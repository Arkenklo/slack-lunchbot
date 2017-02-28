#!/bin/bash
idag="$(LC_ALL=sv_SE.UTF-8 date +%A)"
WEEK=$(date +%W | sed 's/^0//')

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

wget -q -O /tmp/carinas.pdf http://carinaskok.se/files/meny-v.-$WEEK-1.pdf
check_pdf

wget -q -O /tmp/carinas.pdf http://carinaskok.se/files/meny-v.$WEEK-1.pdf
check_pdf

wget -q -O /tmp/carinas.pdf http://carinaskok.se/files/meny-v.-$WEEK.pdf
check_pdf

wget -q -O /tmp/carinas.pdf http://carinaskok.se/files/meny-v.$WEEK.pdf
check_pdf

exit 1
