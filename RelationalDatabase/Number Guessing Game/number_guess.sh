#!/bin/bash
PSQL="psql --username=freecodecamp --dbname=number_guess -t --no-align -c"

SECRET_NUMBER=$RANDOM
# SECRET_NUMBER=2

USER_INTERACTION(){
    echo "Enter your username:"
    read USERNAME
    USER_ID=$($PSQL "SELECT user_id FROM users WHERE username='$USERNAME';")
    # GAMES_PLAYED=$($PSQL "SELECT COUNT(*) FROM games WHERE user_id='$USER_ID';")
    GAMES_PLAYED=$($PSQL "SELECT games_played FROM games WHERE user_id='$USER_ID';")
    # BEST_GAME=$($PSQL " SELECT MIN(number_of_guesses) FROM games WHERE user_id='$USER_ID';")
    BEST_CURRENT_GAME=$($PSQL " SELECT number_of_guesses FROM games WHERE user_id='$USER_ID';")

    if [[ -z $USER_ID ]]
    then
        echo "Welcome, $USERNAME! It looks like this is your first time here."
        INSERT_USERNAME=$($PSQL "INSERT INTO users (username) VALUES ('$USERNAME');")
    else
        echo "Welcome back, $USERNAME! You have played $GAMES_PLAYED games, and your best game took $BEST_GAME guesses."
    fi


    echo "Guess the secret number between 1 and 1000:"

    NUMBER_OF_GUESSES=0
    
    while [[ $USER_GUESS -ne $SECRET_NUMBER ]]
    do
        read USER_GUESS
        (( NUMBER_OF_GUESSES++ ))
        if [[ ! $USER_GUESS =~ ^[0-9]+$ ]]
        then
            echo "That is not an integer, guess again:"
        elif [[ $USER_GUESS -lt $SECRET_NUMBER ]]
        then
            echo "It's higher than that, guess again:"
        elif [[ $USER_GUESS -gt $SECRET_NUMBER ]]
        then
            echo "It's lower than that, guess again:"
        else
            echo "You guessed it in $NUMBER_OF_GUESSES tries. The secret number was $SECRET_NUMBER. Nice job!"
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

