#!/bin/bash
for o in ${1//./ }; do printf "%08d." "$(echo "obase=2;$o" | bc)"; done | sed 's/\.$//'
