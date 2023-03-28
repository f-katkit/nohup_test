#!/bin/bash
count=0
while true
do
  #テストのためにあえて二行ずつ出力
  echo -e "$count\n--sleep 1sec--"
  sleep 1
  count=`expr $count + 1`
done