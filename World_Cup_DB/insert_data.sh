#! /bin/bash

if [[ $1 == "test" ]]
then
  PSQL="psql --username=postgres --dbname=worldcuptest -t --no-align -c"
else
  PSQL="psql --username=freecodecamp --dbname=worldcup -t --no-align -c"
fi

# Do not change code above this line. Use the PSQL variable above to query your database.
cat games.csv | while IFS="," read YEAR ROUND WINNER OPPONENT WGOALS OGOALS
do
  if [[ "$YEAR" != "year" && "$ROUND" != "round" && "$WINNER" != "winner" && "$OPPONENT" != "opponent" && "$WGOALS" != "winner_goals" && "$OGOALS" != "opponent_goals" ]]; then
  
    # Obtenemos nombre equipo
    WINNER_ID=$($PSQL "SELECT team_id FROM teams WHERE name='$WINNER'")
    OPPONENT_ID=$($PSQL "SELECT team_id FROM teams WHERE name='$OPPONENT'")

    # Si está vacío insertamos
    # Sabemos que name1 != name2
    if [[ -z $WINNER_ID ]]
    then
      # Insertamos los valores a la tabla teams, con su nombre
      INSERT_TEAM=$($PSQL "INSERT INTO teams(name) VALUES('$WINNER')")
      # Obtenemos nuevo ID
      WINNER_ID=$($PSQL "SELECT team_id FROM teams WHERE name='$WINNER'")
    fi

    if  [[ -z $OPPONENT_ID ]]
    then
      INSERT_TEAM=$($PSQL "INSERT INTO teams(name) VALUES('$OPPONENT')")
      # Obtenemos nuevo ID
      OPPONENT_ID=$($PSQL "SELECT team_id FROM teams WHERE name='$OPPONENT'")
    fi
  fi
done


cat games.csv | while IFS="," read YEAR ROUND WINNER OPPONENT WGOALS OGOALS
do
  if [[ "$YEAR" != "year" && "$ROUND" != "round" && "$WINNER" != "winner" && "$OPPONENT" != "opponent" && "$WGOALS" != "winner_goals" && "$OGOALS" != "opponent_goals" ]]; then
    echo "$YEAR, $ROUND, $WINNER, $OPPONENT, $WGOALS, $OGOALS"

    # Obtenemos id de la partida
    WINNER_ID=$($PSQL "SELECT team_id FROM teams WHERE name='$WINNER'")
    OPPONENT_ID=$($PSQL "SELECT team_id FROM teams WHERE name='$OPPONENT'")
    GAME_ID=$($PSQL "SELECT game_id FROM games WHERE winner_id='$WINNER_ID' AND opponent_id='$OPPONENT_ID'")

    # Si está vacío insertamos
    # Sabemos que name1 != name2
    if [[ -z $GAME_ID ]]
    then
      # Insertamos los valores a la tabla teams, con su nombre
      INSERT_GAMES=$($PSQL "INSERT INTO games(winner_id, opponent_id, year, winner_goals, opponent_goals, round) VALUES('$WINNER_ID', '$OPPONENT_ID', '$YEAR', '$WGOALS', '$OGOALS', '$ROUND')")
      # Obtenemos nuevos ID
      WINNER_ID=$($PSQL "SELECT team_id FROM teams WHERE name='$WINNER'")
      OPPONENT_ID=$($PSQL "SELECT team_id FROM teams WHERE name='$OPPONENT'")
      GAME_ID=$($PSQL "SELECT game_id FROM games WHERE winner_id='$WINNER_ID' AND opponent_id='$OPPONENT_ID'")
    fi
  fi
done