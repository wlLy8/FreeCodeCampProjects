#! /bin/bash

if [[ $1 == "test" ]]
then
  PSQL="psql --username=postgres --dbname=worldcuptest -t --no-align -c"
else
  PSQL="psql --username=freecodecamp --dbname=worldcup -t --no-align -c"
fi

# Do not change code above this line. Use the PSQL variable above to query your database.

cat games.csv | while IFS="," read YEAR ROUND WINNER OPPONENT WINNER_GOALS OPPONENT_GOALS
do
  if [[ $WINNER != "winner" ]] # skip header, only needed once for whole file
  then
    # Check and insert WINNER; if team name exists it returns the ID, if not it returns an empty string
    TEAM_ID=$($PSQL "SELECT team_id FROM teams WHERE name='$WINNER'")
    if [[ -z $TEAM_ID ]]
    then
      INSERT_TEAM_RESULT=$($PSQL "INSERT INTO teams(name) VALUES('$WINNER')")
      echo "Inserted team: $WINNER"
    fi

    # Check and insert OPPONENT
    TEAM_ID=$($PSQL "SELECT team_id FROM teams WHERE name='$OPPONENT'")
    if [[ -z $TEAM_ID ]]
    then
      INSERT_TEAM_RESULT=$($PSQL "INSERT INTO teams(name) VALUES('$OPPONENT')")
      echo "Inserted team: $OPPONENT"
    fi

    GAME_ID=$($PSQL "SELECT game_id FROM games WHERE year='$YEAR' AND round='$ROUND' AND winner='$WINNER' AND opponent='$OPPONENT' AND winner_goals='$WINNER_GOALS' AND opponent_goals='$OPPONENT_GOALS'")
    if [[ -z $GAME_ID ]]
    then
      INSERT_GAME_RESULT=$($PSQL "INSERT INTO games(year, round, winner_id, opponent_id, winner_goals, opponent_goals) 
                                  VALUES('$YEAR', '$ROUND', 
                                  (SELECT team_id FROM teams WHERE name='$WINNER'), 
                                  (SELECT team_id FROM teams WHERE name='$OPPONENT'), 
                                  '$WINNER_GOALS', '$OPPONENT_GOALS')")
  fi
done

