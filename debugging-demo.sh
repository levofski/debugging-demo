#!/bin/bash
# Make sure we are not alreay bisecting
git bisect reset
clear

commands=(
"gitk"
"php helloworld.php"
"git bisect start"
"git bisect bad"
"git bisect good v1.0"
"php helloworld.php"
"git bisect bad"
"php helloworld.php"
"git bisect good"
"php helloworld.php"
"git bisect bad"
"php helloworld.php"
"git bisect good"
"git bisect reset"
"git show 0a028f"
)
for comm in "${commands[@]}"
do
    printf "$ $comm"
    read -p ""
    $comm
    read -p ""
done

