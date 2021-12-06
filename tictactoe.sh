#!/bin/bash

turn="0"

player() {
echo -e "What is player ones name? (First 3 letters) --->\c"
read player1
echo -e "What is player twos name? (First 3 letters) --->\c"
read player2
}

num_matches() {
  echo -e "How many rounds would you like?(1 or 3)--->\c"
  read number

  if [ $number = 1 ]; then
    echo "There will be "$number" round"
    clear
  elif [ $number = 3 ]; then
    echo "There will be "$number" rounds."
    clear
  else
    echo 'That is an incorrect input, please enter 1 or 3'
    exit
  fi
}

score() {
  score1="0"
  score2="0"
}

scoreboard() {
  echo "| $player1 | $player2 |"
  echo "---------"
  echo "| $score1 | $score2 |"
}

array=()

reset() {
  array=(0 1 2 3 4 5 6 7 8 9)
}

draw_board() {
    echo "${array[1]}|${array[2]}|${array[3]}"
    echo "-----"
    echo "${array[4]}|${array[5]}|${array[6]}"
    echo "-----"
    echo "${array[7]}|${array[8]}|${array[9]}"
  }

player_turns() {
  win="0"
  turn="10"

  while [ $win = 0 ] && [ $turn != 0 ]
  do
    clear
    draw_board
    echo -e "$player1 please choose which square you would like to place a X. (1-9) -->\c"
    read inputx 
    turn=$((turn-1))
    echo "$turn"
    i=$inputx
    unset -v 'array["$inputx"]'
    array=("${array[@]:0:$i}" 'X' "${array[@]:$i}")
    clear
    draw_board
    echo -e "$player2 please choose which square you would like to place an O. (1-9) -->\c"
    read inputo
    turn=$((turn-1))
    echo "$turn"
    i=$inputo
    unset -v 'array["$inputo"]'
    array=("${array[@]:0:$i}" 'O' "${array[@]:$i}")
    clear
    draw_board

    if [ $turn == 1 ]; then
      win=1
      echo -e "The game is a tie! Nobody Wins!"
    fi
  done
}

win_condition() {
  #Horizontal Lines
  w1="${array[1]} ${array[2]} ${array[3]}"
  w2="${array[4]} ${array[5]} ${array[6]}"
  w3="${array[7]} ${array[8]} ${array[9]}"
  #Vertical Lines
  w4="${array[1]} ${array[4]} ${array[7]}"
  w5="${array[2]} ${array[5]} ${array[8]}"
  w6="${array[3]} ${array[6]} ${array[9]}"
  #Diagonal Lines
  w7="${array[1]} ${array[5]} ${array[9]}"
  w8="${array[3]} ${array[5]} ${array[7]}"
}



reset
draw_board
win_condition
player_turns 