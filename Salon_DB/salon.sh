#!/bin/bash

# Function to display services in the specified format
display_services() {
  echo "Our services:"
  psql --username=freecodecamp --dbname=salon -c "SELECT service_id, name FROM services ORDER BY service_id;" | while read SERVICE_ID BAR NAME; do
    echo "$SERVICE_ID) $NAME"
  done
}

# Function to schedule an appointment
schedule_appointment() {
  local SERVICE_ID_SELECTED CUSTOMER_PHONE CUSTOMER_NAME SERVICE_TIME SERVICE_EXISTS

  while true; do
    # Display services to the user
    display_services

    # Ask for service ID
    echo "Please enter the service ID:"
    read SERVICE_ID_SELECTED

    # Validate the service ID
    SERVICE_EXISTS=$(psql --username=freecodecamp --dbname=salon -t -c "SELECT COUNT(*) FROM services WHERE service_id = $SERVICE_ID_SELECTED;")

    if [[ $SERVICE_EXISTS -eq 0 ]]; then
      echo "The selected service does not exist. Please try again."
      continue
    else
      # Fetch the name of the service
      SERVICE_NAME=$(psql --username=freecodecamp --dbname=salon -t -c "SELECT name FROM services WHERE service_id = $SERVICE_ID_SELECTED;")
      SERVICE_NAME=$(echo $SERVICE_NAME | xargs)  # Trim whitespace
      break
    fi
  done

  # Ask for customer phone number
  echo "Please enter your phone number:"
  read CUSTOMER_PHONE

  # Check if the customer exists
  CUSTOMER_EXISTS=$(psql --username=freecodecamp --dbname=salon -t -c "SELECT name FROM customers WHERE phone = '$CUSTOMER_PHONE';")

  if [[ -z $CUSTOMER_EXISTS ]]; then
    # New customer, ask for name
    echo "I don't have a record for that phone number, what's your name?"
    read CUSTOMER_NAME
    # Insert new customer into the database
    psql --username=freecodecamp --dbname=salon -c "INSERT INTO customers (name, phone) VALUES ('$CUSTOMER_NAME', '$CUSTOMER_PHONE');"
  else
    # Existing customer
    CUSTOMER_NAME=$(echo $CUSTOMER_EXISTS | xargs)  # Trim whitespace
  fi

  # Ask for the appointment time
  echo "What time would you like your $SERVICE_NAME, $CUSTOMER_NAME?"
  read SERVICE_TIME

  # Insert the appointment
  psql --username=freecodecamp --dbname=salon -c "INSERT INTO appointments (customer_id, service_id, time) VALUES ((SELECT customer_id FROM customers WHERE phone = '$CUSTOMER_PHONE'), $SERVICE_ID_SELECTED, '$SERVICE_TIME');"

  echo "I have put you down for a $SERVICE_NAME at $SERVICE_TIME, $CUSTOMER_NAME."
}

# Main script execution
schedule_appointment
