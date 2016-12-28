#!/bin/bash
idag="$(LC_ALL=sv_SE.UTF-8 date +%A)"

function convert {
pdftotext /tmp/carinas.pdf - 2>/dev/null | grep --color=never -A 1 -i $idag | grep -i -v $idag | sed "s/^ *//" 2>/dev/null
}

function check_pdf {
output=$(convert)
if [ ! -z "$output" ]; then
	echo $output
	exit 0
fi
}

wget -q -O /tmp/carinas.pdf http://carinaskok.se/files/meny-v.-$(date +%W).pdf
check_pdf

wget -q -O /tmp/carinas.pdf http://carinaskok.se/files/meny-v.$(date +%W).pdf
check_pdf

wget -q -O /tmp/carinas.pdf http://carinaskok.se/files/meny-v.$(date +%W)-1.pdf
check_pdf
exit 1
