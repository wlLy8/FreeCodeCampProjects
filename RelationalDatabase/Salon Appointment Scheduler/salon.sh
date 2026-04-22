#!/bin/bash
# query the database in your script with:
# psql --username=freecodecamp --dbname=salon -c "SQL QUERY HERE"

# chmod +x salon.sh
PSQL="psql -X --username=freecodecamp --dbname=salon --tuples-only -c"


SALON_MENU() {
    if [[ $1 ]]
    then
        echo -e "\n$1"
    fi
    #You should display a numbered list of the services you offer before the first prompt for input, each with the format #) <service>. For example, 1) cut, where 1 is the service_id
    echo -e "1) cut\n2) color\n3) trim\n4) exit"
    # 

    SERVICES_list=$($PSQL "SELECT service_id, name FROM services ORDER BY service_id")
    # echo -e "\n1) cut\n2) color\n3) trim"
    echo "$SERVICES_list" | while read SERVICE_ID BAR SERVICE_NAME
    do
        echo "$SERVICE_ID) $SERVICE_NAME"
    done
    read SERVICE_ID_SELECTED
    SERVICES=$($PSQL "SELECT service_id FROM services WHERE service_id = $SERVICE_ID_SELECTED")
    if [[ -z $SERVICES ]]
    then
        SALON_MENU "Sorry, we don't offer this service. Please select a valid option from the menu."
    else
        PROCESS_REQUEST
    fi
}

# collect customer info
PROCESS_REQUEST() {
    echo -e "Could you please let us know your phone number?"
    read CUSTOMER_PHONE
    if [[ -z $($PSQL "SELECT phone FROM customers WHERE phone = '$CUSTOMER_PHONE'") ]]
    then
        echo -e "As it seems like you are a new customer, could you please let us know your name?"
        read CUSTOMER_NAME
        INSERT_CUSTOMER_RESULT=$($PSQL "INSERT INTO customers(phone, name) VALUES('$CUSTOMER_PHONE', '$CUSTOMER_NAME')")
    else
        CUSTOMER_NAME=$($PSQL "SELECT name FROM customers WHERE phone = '$CUSTOMER_PHONE'")
    fi
    CUSTOMER_ID=$($PSQL "SELECT customer_id FROM customers WHERE phone = '$CUSTOMER_PHONE'")
    echo -e "At what time would you like to schedule your appointment?"
    read SERVICE_TIME
    APPOINTMENT_RESULT=$($PSQL "INSERT INTO appointments(customer_id, service_id, time) VALUES($CUSTOMER_ID, $SERVICE_ID_SELECTED, '$SERVICE_TIME')")
    CONFIRMATION
}

CONFIRMATION() {
    SERVICE=$($PSQL "SELECT name FROM services WHERE service_id = $SERVICE_ID_SELECTED")
    echo -e "I have put you down for a $(echo $SERVICE | sed -r 's/^ *| *$//g') at $SERVICE_TIME, $(echo $CUSTOMER_NAME | sed -r 's/^ *| *$//g')."
}

EXIT() {
    echo -e "\nThank you for stopping in.\n"
}

SALON_MENU