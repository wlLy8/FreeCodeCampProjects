#!/bin/bash
PSQL="psql --username=freecodecamp --dbname=number_guess -t --no-align -c"

SECRET_NUMBER=$RANDOM

USER_INTERACTION(){
    echo "Enter you username:"
    read USERNAME
    USER_ID=$($PSQL "SELECT user_id FROM users WHERE username='$USERNAME';")
    GAMES_PLAYED=$($PSQL "SELECT COUNT(*) FROM games WHERE user_id='$USER_ID';")
    BEST_GAME=$($PSQL " SELECT MIN(number_of_guesses) FROM games WHERE user_id='$USER_ID';")

    echo "Welcome back $USERNAME! You have played $GAMES_PLAYED games, and your best game took $BEST_GAME guesses."

    echo "Welcome, $USERNAME! It looks like this is your first time here."

    echo "Guess the secret number between 1 and 1000:"
    read USER_GUESS

    NUMBER_OF_GUESSES=1
    
    while [[ $USER_GUESS != $SECRET_NUMBER ]]
    do
        echo "It's lower than that, guess again:"
        echo "It's higher than that, guess again:"
        echo "That is not an integer, guess again:"
        echo "You guessed it in $NUMBER_OF_GUESSES tries. The secret number was $SECRET_NUMBER. Nice job!"
    done
}

USER_INTERACTION

