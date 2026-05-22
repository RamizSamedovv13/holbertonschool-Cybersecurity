#!/bin/bash

cidr=$1

mask=$(printf '%*s' "$cidr" '' | tr ' ' '1')
mask=$mask$(printf '%*s' $((32-cidr)) '' | tr ' ' '0')

for i in {0..3}; do
    part=${mask:$((i*8)):8}
    echo -n "$((2#$part))"
    [ $i -lt 3 ] && echo -n "."
done

echo
