#!/bin/sh

#井字棋小游戏
#tic-tac-toe Game
clear
list=( " " "-" "-" "-" "-" "-" "-" "-" "-" "-" )
echo "-----------tic-tac-toe Game ( two player )--------------"
echo "Table:::"
tr=0
table(){
  echo "  ┌┄┄┄┄┄┐"
  echo "  ┆ ${list[1]}${list[2]}${list[3]} ┆"
  echo "  ┆ ${list[4]}${list[5]}${list[6]} ┆"
  echo "  ┆ ${list[7]}${list[8]}${list[9]} ┆"
  echo "  └┄┄┄┄┄┘"
}
is_draw(){
  if [ $tr -ge 9 ]; then
    echo -e "\n---------draw----------\n"
    echo -e "next if you input a letter: \c"
    read is_next
    list=( " " "-" "-" "-" "-" "-" "-" "-" "-" "-" )
    echo -e "\n---------Next----------\n"
    tr=0
  fi
}
is_win(){
  if [ ${list[1]} == "X" -a ${list[2]} == "X" -a ${list[3]} == "X" -o ${list[4]} == "X" -a ${list[5]} == "X" -a ${list[6]} == "X" -o ${list[7]} == "X" -a ${list[8]} == "X" -a ${list[9]} == "X" -o ${list[1]} == "X" -a ${list[4]} == "X" -a ${list[7]} == "X" -o ${list[2]} == "X" -a ${list[5]} == "X" -a ${list[8]} == "X" -o ${list[3]} == "X" -a ${list[6]} == "X" -a ${list[9]} == "X" -o ${list[1]} == "X" -a ${list[5]} == "X" -a ${list[9]} == "X" -o ${list[3]} == "X" -a ${list[5]} == "X" -a ${list[7]} == "X" -o ${list[1]} == "O" -a ${list[2]} == "O" -a ${list[3]} == "O" -o ${list[4]} == "O" -a ${list[5]} == "O" -a ${list[6]} == "O" -o ${list[7]} == "O" -a ${list[8]} == "O" -a ${list[9]} == "O" -o ${list[1]} == "O" -a ${list[4]} == "O" -a ${list[7]} == "O" -o ${list[2]} == "O" -a ${list[5]} == "O" -a ${list[8]} == "O" -o ${list[3]} == "O" -a ${list[6]} == "O" -a ${list[9]} == "O" -o ${list[1]} == "O" -a ${list[5]} == "O" -a ${list[9]} == "O" -o ${list[3]} == "O" -a ${list[5]} == "O" -a ${list[7]} == "O" ]; then
    echo -e "\n---------$1 Win----------\n"
    echo -e "next if you input a letter: \c"
    read is_next
    list=( " " "-" "-" "-" "-" "-" "-" "-" "-" "-" )
    echo -e "\n---------Next----------\n"
    tr=0
  fi
}
table
echo -e "-----------tic-tac-toe Game--------------\n\n"
while true
do
  while true
  do
    echo -e "Player1 : [X] Position: \c"
    read x
    if [ ${list[x]} == "-" -a $x -lt 9 ]; then
      list[x]="X"
      table
      tr=`expr $tr + 1`
      break
    fi
    echo "This position is occupied, please replace it with a new grid"
  done
  is_win "Player1"
  is_draw
  while true
  do
    echo -e "Player2 : [O] Position \c"
    read o
    if [ ${list[o]} == "-" -a $x -lt 9 ]; then
      list[o]="O"
      table
      tr=`expr $tr + 1`
      break
    fi
    echo "This position is occupied, please replace it with a new grid"
  done
  is_win "Player2"
  is_draw
done