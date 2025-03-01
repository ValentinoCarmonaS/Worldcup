#! /bin/bash

if [[ $1 == "test" ]]
then
  PSQL="psql --username=postgres --dbname=worldcuptest -t --no-align -c"
else
  PSQL="psql --username=freecodecamp --dbname=worldcup -t --no-align -c"
fi

# Do not change code above this line. Use the PSQL variable above to query your database.
echo "$($PSQL "TRUNCATE TABLE games, teams")"

cat games.csv | while IFS="," read YEAR ROUND WINNER OPPONENT WINNER_GOALS OPPONENT_GOALS
do 

  if [[ $YEAR != "year" ]]
  then

    #get winner_id from teams:
    WINNER_ID=$($PSQL "SELECT team_id FROM teams WHERE name='$WINNER';")
    #if not found:
    if [[ -z $WINNER_ID ]]
    then
      #insert winner_id into teams:
      $PSQL "INSERT INTO teams(name) VALUES('$WINNER');"
      #get new winner_id:
      WINNER_ID=$($PSQL "SELECT team_id FROM teams WHERE name='$WINNER';")
    fi

    #get opponent_id from teams:
    OPPONENT_ID=$($PSQL "SELECT team_id FROM teams WHERE name='$OPPONENT';")
    #if not found:
    if [[ -z $OPPONENT_ID ]]
    then
      #insert opponent_id into teams:
      $PSQL "INSERT INTO teams(name) VALUES('$OPPONENT');"
      #get new opponent_id:
      OPPONENT_ID=$($PSQL "SELECT team_id FROM teams WHERE name='$OPPONENT';")
    fi

    #get the game_id where th winner_id and the opponent_id played together:
    GAME_ID=$($PSQL "SELECT game_id FROM games WHERE (winner_id='$WINNER_ID' AND opponent_id='$OPPONENT_ID');")
    #if not found:
    if [[ -z $GAME_ID ]]
    then
      #insert the game into games:
      $PSQL "INSERT INTO games(year, round, winner_id, opponent_id, winner_goals, opponent_goals) VALUES('$YEAR', '$ROUND', '$WINNER_ID', '$OPPONENT_ID', '$WINNER_GOALS', '$OPPONENT_GOALS');"
    fi
  fi

done