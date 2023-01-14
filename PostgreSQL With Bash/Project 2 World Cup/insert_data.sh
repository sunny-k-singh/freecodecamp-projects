#! /bin/bash

if [[ $1 == "test" ]]
then
  PSQL="psql --username=postgres --dbname=worldcuptest -t --no-align -c"
else
  PSQL="psql --username=freecodecamp --dbname=worldcup -t --no-align -c"
fi

# Do not change code above this line. Use the PSQL variable above to query your database.
echo $($PSQL "TRUNCATE games,teams")
cat games.csv | while IFS="," read YEAR ROUND WINNER OPPONENT WINNER_GOALS OPPONENT_GOALS

do 
  if [[ $WINNER != 'winner' ]]
  then
  #lets first create a team name if it doesn't exist in the team table 
  #and give it a primary key. Without this we can't add a foreign key to the games table

  #So let's first get winner_id. If not found, insert the name
  WINNER_ID=$($PSQL "SELECT team_id FROM teams WHERE name = '$WINNER'")

  #if not found
  if [[ -z $WINNER_ID ]]
  then

    #add the team name
    INSERT_TEAM_RESULT=$($PSQL "INSERT INTO teams (name) VALUES ('$WINNER')")
    if [[ $INSERT_TEAM_RESULT == "INSERT 0 1" ]]
    then
      echo A new team, $WINNER inserted into the database
    fi
    #now get the winner_id for later use

    WINNER_ID=$($PSQL "SELECT team_id FROM teams WHERE name = '$WINNER'")
  fi    

  #we will do the same thing for opponent_id now.
  OPPONENT_ID=$($PSQL "SELECT team_id FROM teams WHERE name = '$OPPONENT'")

  #if not found
  if [[ -z $OPPONENT_ID ]]
  then

    #add the team name
    INSERT_TEAM_RESULT=$($PSQL "INSERT INTO teams (name) VALUES ('$OPPONENT')")
    if [[ $INSERT_TEAM_RESULT == "INSERT 0 1" ]]
    then
      echo A new team, $OPPONENT inserted into the database
    fi
    #now get the winner_id for later use

    OPPONENT_ID=$($PSQL "SELECT team_id FROM teams WHERE name = '$OPPONENT'")
  fi

  # now we insert all the other data including the appropriate foreign keys for winners
  # and opponents

   INSERT_GAME_RESULT=$($PSQL "INSERT INTO games(year,round,winner_id,opponent_id,winner_goals,opponent_goals) VALUES ($YEAR, '$ROUND', $WINNER_ID, $OPPONENT_ID, $WINNER_GOALS, $OPPONENT_GOALS)")
   if [[ $INSERT_GAME_RESULT == "INSERT 0 1" ]]
   then
    echo A new game from the $ROUND round of $YEAR is inserted into the database
   fi  
  fi
done  

