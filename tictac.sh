#!/bin/bash


scoreboard(){
  echo "SCORES"
  echo "$p1=$p1_score"
  echo "$p2=$p2_score"
  echo " "
}

players() {

  p1_score=0
  p2_score=0 

  echo -e "Enter player name --> \c"
  read name1
  echo " "
  echo -e "Enter player name --> \c"
  read name2
  echo " "
  echo "0 or 1 will be drawn. If 0 is drawn then $name1 is X and goes first. If 1 is drawn then $name2 is X and goes first."

  sleep 3 
  R=$(($RANDOM%2))
  echo " "
  echo "The number is $R"
  echo " "
  sleep 3 

  if [ $R == 0 ]; then
    p1=$name1
    p2=$name2
    echo "$name1 goes first."
    echo " "
    sleep 2
  else
    echo "$name2 goes first."
    echo " "
    p1=$name2
    p2=$name1
    sleep 2 
  fi
  clear
}

game_rematch_order(){

  echo "0 or 1 will be drawn. If 0 $name1 is X and goes first. If 1 $name2 is X and goes first. "
  R=$(($RANDOM%2))
  sleep 2 
  echo "The number is $R"
  echo " "
  sleep 3 

  if [ $R == 0 ]; then
    p1=$name1
    p2=$name2
    echo "$name1 goes first."
    sleep 2
  else
    echo "$name2 goes first."
    p1=$name2
    p2=$name1
    sleep 2 
  fi
  clear
}

array=("-" "-" "-"
       "-" "-" "-"
       "-" "-" "-")

clear_board() {
  unset array
  array=("-" "-" "-"
         "-" "-" "-"
         "-" "-" "-")
}

draw_board() {
    echo "${array[0]}|${array[1]}|${array[2]}"
    echo "-----"
    echo "${array[3]}|${array[4]}|${array[5]}"
    echo "-----"
    echo "${array[6]}|${array[7]}|${array[8]}"
  }

game_tie() {
  tie=0
  if [[ ${array[0]} = - || ${array[1]} = - || ${array[2]} = - || ${array[3]} = - || ${array[4]} = - || ${array[5]} = - || ${array[6]} = - || ${array[7]} = - || ${array[8]} = - || ${array[9]} = - ]]; then
    tie=0
  else
    tie=1
    rematch
  fi
}

rematch() {
  echo " "
  read -p "Would you like to do a rematch? (y/n) " again
  case $again in
    [Yy]*)game_rematch;;
    [Nn]*)exit;;
  esac
}

win_condition() {
  if [[ ${array[0]} != - && ${array[0]} == ${array[1]} && ${array[2]} == ${array[0]} ]]; then
    echo "Game is over!"
    echo " "
    echo "${array[0]} is the winner!"
    if [[ ${array[0]} = X ]]; then
      p1_score=$((p1_score + 1))
      clear
      scoreboard
      draw_board
    else
      p2_score=$((p2_score + 1))
      clear
      scoreboard
      draw_board
    fi
    rematch
  fi

  if [[ ${array[3]} != - && ${array[3]} == ${array[4]} && ${array[3]} == ${array[5]} ]]; then
    echo "Game is over!"
    echo " "
    echo "${array[3]} is the winner!"
    if [[ ${array[3]} = X ]]; then
      p1_score=$((p1_score + 1))
      clear
      scoreboard
      draw_board
    else
      p2_score=$((p2_score + 1))
      clear
      scoreboard
      draw_board
    fi
    rematch
  fi

  if [[ ${array[6]} != - && ${array[6]} == ${array[7]} && ${array[6]} == ${array[8]} ]]; then
    echo "Game is over!"
    echo " "
    echo "${array[6]} is the winner!"
    if [[ ${array[6]} = X ]]; then
      p1_score=$((p1_score + 1))
      clear
      scoreboard
      draw_board
    else
      p2_score=$((p2_score + 1))
      clear
      scoreboard
      draw_board
    fi
    rematch
  fi

    if [[ ${array[4]} != - && ${array[4]} == ${array[6]} && ${array[4]} == ${array[2]} ]]; then
    echo "Game is over!"
    echo " "
    echo "${array[4]} is the winner!"
    if [[ ${array[4]} = X ]]; then
      p1_score=$((p1_score + 1))
      clear
      scoreboard
      draw_board
    else
      p2_score=$((p2_score + 1))
      clear
      scoreboard
      draw_board
    fi
    rematch
  fi

  if [[ ${array[0]} != - && ${array[0]} == ${array[3]} && ${array[0]} == ${array[6]} ]]; then
    echo "Game is over!"
    echo " "
    echo "${array[0]} is the winner!"
    if [[ ${array[0]} = X ]]; then
      p1_score=$((p1_score + 1))
      clear
      scoreboard
      draw_board
    else
      p2_score=$((p2_score + 1))
      clear
      scoreboard
      draw_board
    fi
    rematch
  fi

  if [[ ${array[1]} != - && ${array[1]} == ${array[4]} && ${array[1]} == ${array[7]} ]]; then
    echo "Game is over!"
    echo " "
    echo "${array[1]} is the winner!"
    if [[ ${array[1]} = X ]]; then
      p1_score=$((p1_score + 1))
      clear
      scoreboard
      draw_board
    else
      p2_score=$((p2_score + 1))
      clear
      scoreboard
      draw_board
    fi
    rematch
  fi

  if [[ ${array[2]} != - && ${array[2]} == ${array[5]} && ${array[2]} == ${array[8]} ]]; then
    echo "Game is over!"
    echo " "
    echo "${array[2]} is the winner!"
    if [[ ${array[2]} = X ]]; then
      p1_score=$((p1_score + 1))
      clear
      scoreboard
      draw_board
    else
      p2_score=$((p2_score + 1))
      clear
      scoreboard
      draw_board
    fi
    rematch
  fi

  if [[ ${array[0]} != - && ${array[0]} == ${array[4]} && ${array[0]} == ${array[8]} ]]; then
    echo "Game is over!"
    echo " "
    echo "${array[0]} is the winner!"
    if [[ ${array[0]} = X ]]; then
      p1_score=$((p1_score + 1))
      clear
      scoreboard
      draw_board
    else
      p2_score=$((p2_score + 1))
      clear
      scoreboard
      draw_board
    fi
    rematch
  fi

  if [[ ${array[2]} != - && ${array[2]} == ${array[4]} && ${array[2]} == ${array[6]} ]]; then
    echo "Game is over!"
    echo " "
    echo "${array[2]} is the winner!"
    if [[ ${array[2]} = X ]]; then
      p1_score=$((p1_score + 1))
      clear
      scoreboard
      draw_board
    else
      p2_score=$((p2_score + 1))
      clear
      scoreboard
      draw_board
    fi
    rematch
  fi
}

turns() {
  while true; do
    while true; do
      echo -e "$p1 enter input (1-9) --> \c"
      read input
      i=$((input - 1))
      if [ ${array[$i]} == - ]; then
        array[$i]='X'
        clear
        scoreboard
        draw_board
        break
      fi
      echo "Enter a valid position!"
    done
    clear
    scoreboard
    draw_board
    win_condition
    game_tie
    while true; do
      echo -e "$p2 enter your (1-9) --> \c"
      read input
      i=$((input - 1))
      if [ ${array[$i]} == - ]; then
        array[$i]='O'
        clear
        scoreboard
        draw_board
        break
      fi
      echo "Enter a valid position!"
    done
    clear 
    scoreboard
    draw_board
    win_condition
    game_tie
  done
}

game() { 
  players
  scoreboard
  draw_board
  turns
 }

game_rematch() {
  game_rematch_order
  clear_board
  scoreboard
  draw_board
  turns
 }

game