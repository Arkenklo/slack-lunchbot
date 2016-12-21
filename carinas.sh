#!/bin/bash
idag="$(LC_ALL=sv_SE.UTF-8 date +%A)"

function convert {
pdftotext /tmp/carinas.pdf - | grep --color=never -A 1 -i $idag | grep -i -v $idag | sed "s/^ *//"
}

wget -q -O /tmp/carinas.pdf http://carinaskok.se/files/meny-v.-$(date +%W).pdf
output=$(convert)
if [ ! -z "$output" ]; then exit; fi

wget -q -O /tmp/carinas.pdf http://carinaskok.se/files/meny-v.$(date +%W).pdf
output=$(convert)
if [ ! -z "$output" ]; then exit; fi

wget -q -O /tmp/carinas.pdf http://carinaskok.se/files/meny-v.$(date +%W)-1.pdf
output=$(convert)
if [ ! -z "$output" ]; then exit; fi

