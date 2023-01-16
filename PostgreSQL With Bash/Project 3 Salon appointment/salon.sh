#!/bin/bash
PSQL="psql --username=freecodecamp --dbname=salon -t --no-align -c"

echo -e "\n~~~~~ Welcome to my salon shop ~~~~~\n"

MAIN_MENU() {

 if [[ $1 ]]
 then
  echo -e "\n$1"
 fi

 echo -e "\nWhich of our services would you like to book your appointment for?\n"
 echo -e "1) Cut\n2) Style\n3) Trim\n"

 read SERVICE_ID_SELECTED

  #if not a valid number
  if [[ ! $SERVICE_ID_SELECTED =~ ^[0-9]+$ ]]
  then
    MAIN_MENU "This service doesn't exist in our menu. Please select something else."
     
  #if a valid selection
  
  else

  echo -e "Please enter your phone number:\n"
  read CUSTOMER_PHONE

  #get customer id
  
  CUSTOMER_ID=$($PSQL "SELECT customer_id FROM customers WHERE phone='$CUSTOMER_PHONE'")
  
  #if doesn't exist, add it
  
  if [[ -z $CUSTOMER_ID ]]
  then
    echo -e "\nWe didn't find a name for this phone number. What's your name? \n"
    read CUSTOMER_NAME
    INSERT_NAME_RESULT=$($PSQL "INSERT INTO customers(name,phone) VALUES('$CUSTOMER_NAME','$CUSTOMER_PHONE')")
    CUSTOMER_ID=$($PSQL "SELECT customer_id FROM customers WHERE phone='$CUSTOMER_PHONE'")
  fi  
  
  #get customer name, ask time, insert it into appointments 

  CUSTOMER_NAME=$($PSQL "SELECT name FROM customers WHERE customer_id=$CUSTOMER_ID");
  echo -e "\nAt what time would you like to schedule your appointment, $CUSTOMER_NAME?"
  read SERVICE_TIME

  SERVICE_TIME_INSERT_RESULT=$($PSQL "INSERT INTO appointments(customer_id,service_id,time) VALUES($CUSTOMER_ID,$SERVICE_ID_SELECTED,'$SERVICE_TIME')") 

  SERVICE_NAME=$($PSQL "SELECT name FROM services WHERE service_id=$SERVICE_ID_SELECTED")
  echo -e "\nI have put you down for a $SERVICE_NAME at $SERVICE_TIME, $CUSTOMER_NAME."
fi
}  

MAIN_MENU 
