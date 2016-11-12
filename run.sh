#!/bin/bash

for test_case in test/*
do
    python -c "print('*' * 50)"
    N=$(cat $test_case | cut -d ' ' -f 1)
    B=$(cat $test_case | cut -d ' ' -f 2)
    printf 'Test %s\t: %s %s\n' "$test_case" "$N" "$B"
    /usr/bin/time -f "<< runtime %es >>" python pollardRhoAttack.py $N $B
    python -c "print('*' * 50)"
done