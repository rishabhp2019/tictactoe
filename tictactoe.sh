#!/bin/bash


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
  t="0"

  while [ $win = 0 ] && [ t++ ]
  do
    clear
    draw_board
    echo -e "$player1 please choose which square you would like to place a X. (1-9) -->\c"
    read inputx 
    i=$inputx
    unset -v 'array["$inputx"]'
    array=("${array[@]:0:$i}" 'X' "${array[@]:$i}")
    clear
    draw_board
    echo "$t"
    echo -e "$player2 please choose which square you would like to place an O. (1-9) -->\c"
    read inputo
    i=$inputo
    unset -v 'array["$inputo"]'
    array=("${array[@]:0:$i}" 'O' "${array[@]:$i}")
    clear
    draw_board
    echo "$t"

    if [ t=10 ]; then
      echo "The Game is a Tie. Nobody wins!"
    fi
    exit

  done
}



reset
draw_board
player_turns 