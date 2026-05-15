#!/bin/bash
PSQL="psql --username=freecodecamp --dbname=periodic_table -t --no-align -c"


DATABASE_LOOKUP(){
echo "Please provide an element as an argument."
echo "The element with atomic number 1 is Hydrogen (H). It's a nonmetal, with a mass of 1.008 amu. Hydrogen has a melting point of -259.1 celsius and a boiling point of -252.9 celsius."
ATOMIC_NUMBER=$($PSQL "SELECT atomic_number FROM properties WHERE")
TYPE=$($PSQL "SELECT type FROM properties WHERE")
ATOMIC_MASS=$($PSQL "SELECT atomic_mass FROM properties WHERE")
MELTING_POINT=$($PSQL "SELECT melting_point_celsius FROM properties WHERE")
BOILING_POINT=$($PSQL "SELECT boiling_point_celsius FROM properties WHERE")
ELEMENT_NAME=$($PSQL "SELECT name FROM elements WHERE")
SYMBOL=$($PSQL "SELECT symbol FROM elements WHERE")



echo "I could not find that element in the database."

}

DATABASE_LOOKUP $1