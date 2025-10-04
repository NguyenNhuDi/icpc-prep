#!/bin/bash

clear
file="$(ls  *.cpp *.py -t | head -n 1)"
if [[ $file == *".py" ]]; then
    r="python $file"
    c="echo"
else
    g++ $file -g -Og --static -std=gnu++14 -Wall -Wextra -Wconversion -Wshadow -Wfatal-errors -o sol ||
        exit 1
    r="./sol"
    c="rm sol"
fi
echo "Running file \"${file}\":"
for i in *.in; do
    echo --- $i
    o="out/${i::-3}.out"
    d="out/${i::-3}.diff"
    eval $r < $i > $o &&
        (diff -y -W 50 -Z $o ${i::-3}.ans > "$d" && echo "PASSED") ||
        (echo "FAILED" && cat "$d")
done
eval $c