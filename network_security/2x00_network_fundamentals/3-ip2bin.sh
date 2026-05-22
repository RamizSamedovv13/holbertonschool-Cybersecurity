#!/bin/bash

echo "$1" | tr '.' '\n' | while read octet
do
    printf "%08d" "$(echo "obase=2; $octet" | bc)"
    [ "$octet" != "$(echo $1 | cut -d. -f4)" ] && echo -n "."
done

echo
