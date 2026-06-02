#!/bin/bash
PSQL="psql --username=freecodecamp --dbname=number_guess -t --no-align -c"

SECRET_NUMBER=$(( RANDOM % 1000 + 1 ))

USER_INTERACTION(){
    echo "Enter your username:"
    read USERNAME
    USER_ID=$($PSQL "SELECT user_id FROM users WHERE username='$USERNAME';")
    GAMES_PLAYED=$($PSQL "SELECT games_played FROM games WHERE user_id='$USER_ID';")
    BEST_CURRENT_GAME=$($PSQL " SELECT number_of_guesses FROM games WHERE user_id='$USER_ID';")

    if [[ -z $USER_ID ]]
    then
        echo -e "Welcome, $USERNAME! It looks like this is your first time here.\nGuess the secret number between 1 and 1000:"
        INSERT_USERNAME=$($PSQL "INSERT INTO users (username) VALUES ('$USERNAME');")
    else
        echo -e "Welcome back, $USERNAME! You have played $GAMES_PLAYED games, and your best game took $BEST_CURRENT_GAME guesses.\nGuess the secret number between 1 and 1000:"
    fi

    NUMBER_OF_GUESSES=0
    
    while true
    do
        read USER_GUESS
        
        # 1. Zuerst prüfen, ob es ein Integer ist
        if [[ ! $USER_GUESS =~ ^[0-9]+$ ]]
        then
            # Wenn es kein Integer ist, erhöhen wir den Zähler NICHT!
            echo "That is not an integer, guess again:"
        else
            # Es ist ein valider Integer, jetzt erhöhen wir die Versuche
            (( NUMBER_OF_GUESSES++ ))

            if [[ $USER_GUESS -gt $SECRET_NUMBER ]]
            then
                echo "It's lower than that, guess again:"
            elif [[ $USER_GUESS -lt $SECRET_NUMBER ]]
            then
                echo "It's higher than that, guess again:"
            else
                echo "You guessed it in $NUMBER_OF_GUESSES tries. The secret number was $SECRET_NUMBER. Nice job!"
                break
            fi
        fi
    done

    if [[ -n $USER_ID && $NUMBER_OF_GUESSES -lt $BEST_CURRENT_GAME ]]
    then
        UPDATE_FINISHED_GAME=$($PSQL "UPDATE games SET number_of_guesses = $NUMBER_OF_GUESSES, games_played = games_played + 1 WHERE user_id = '$USER_ID';")
    else
        USER_ID=$($PSQL "SELECT user_id FROM users WHERE username='$USERNAME';")
        INSERT_FINISHED_GAME=$($PSQL "INSERT INTO games (user_id, number_of_guesses, games_played) VALUES ('$USER_ID', $NUMBER_OF_GUESSES, 1);")
    fi
}

USER_INTERACTION

