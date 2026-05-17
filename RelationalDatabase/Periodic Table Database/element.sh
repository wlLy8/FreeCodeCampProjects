#!/bin/bash
PSQL="psql --username=freecodecamp --dbname=periodic_table -t --no-align -c"
INPUT=$1

DATABASE_LOOKUP(){
if [[ -z $INPUT ]]
then
    echo "Please provide an element as an argument."
    exit
fi

if [[ -n $INPUT ]]
then
    echo "Will proceess."
    ATOMIC_NUMBER=$($PSQL "SELECT atomic_number FROM elements WHERE elements::text ~ '\y${INPUT}\y';")
    
    if [[ -z $ATOMIC_NUMBER ]]
    then
        echo "I could not find that element in the database."
        exit
    fi

    TYPE=$($PSQL "SELECT type FROM properties WHERE atomic_number = $ATOMIC_NUMBER;")
    ATOMIC_MASS=$($PSQL "SELECT atomic_mass FROM properties WHERE atomic_number = $ATOMIC_NUMBER;")
    MELTING_POINT=$($PSQL "SELECT melting_point_celsius FROM properties WHERE atomic_number = $ATOMIC_NUMBER;")
    BOILING_POINT=$($PSQL "SELECT boiling_point_celsius FROM properties WHERE atomic_number = $ATOMIC_NUMBER;")
    ELEMENT_NAME=$($PSQL "SELECT name FROM elements WHERE atomic_number = $ATOMIC_NUMBER;")
    SYMBOL=$($PSQL "SELECT symbol FROM elements WHERE atomic_number = $ATOMIC_NUMBER;")
    echo "The element with atomic number $ATOMIC_NUMBER is $ELEMENT_NAME ($SYMBOL). It's a $TYPE, with a mass of $ATOMIC_MASS amu. $ELEMENT_NAME has a melting point of $MELTING_POINT celsius and a boiling point of $BOILING_POINT celsius."

fi
}

DATABASE_LOOKUP $INPUT