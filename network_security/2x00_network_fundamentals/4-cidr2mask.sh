#!/bin/bash
mask=$(printf '%*s' "$1" '' | tr ' ' '1')$(printf '%*s' $((32-$1)) '' | tr ' ' '0')
echo $((2#${mask:0:8})).$((2#${mask:8:8})).$((2#${mask:16:8})).$((2#${mask:24:8}))
