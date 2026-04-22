#!/bin/bash
# query the database in your script with:
# psql --username=freecodecamp --dbname=salon -c "SQL QUERY HERE"

# chmod +x salon.sh
PSQL="psql -X --username=freecodecamp --dbname=salon --tuples-only -c"


SALON_MENU() {
    echo -e "1) cut\n2) color\n3)trim"
    read SERVICE_ID_SELECTED
    case $SERVICE_ID_SELECTED in
        1) ;;
        2) ;;
        3) ;;
        *) SALON_MENU "Sorry, we don't offer this service. Please select a valid option from the menu." ;;
    esac
}

# collect customer info
echo -e "Could you please let us know your phone number?"
read CUSTOMER_PHONE
if [[ -z $($PSQL "SELECT phone FROM customers WHERE phone = '$CUSTOMER_PHONE'") ]]
then
    echo -e "As it seems like you are a new customer, could you please let us know your name?"
    read CUSTOMER_NAME
    INSERT_CUSTOMER_RESULT=$($PSQL "INSERT INTO customers(phone, name) VALUES('$CUSTOMER_PHONE', '$CUSTOMER_NAME')")
fi
echo -e "At what time would you like to schedule your appointment?"
read SERVICE_TIME


# Check if customer exists
CUSTOMER_NAME=$($PSQL "")

if -z $CUSTOMER_NAME
then
    # get customer name
    echo -e "\nWhat's your name?"
    read CUSTOMER_NAME
    # insert new customer
    INSERT_CUSTOMER_RESULT=$($PSQL "INSERT INTO customers(name) VALUES('$CUSTOMER_NAME')")
fi

SALON_MENU