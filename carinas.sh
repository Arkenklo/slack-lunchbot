#!/bin/bash
idag="$(LC_ALL=sv_SE.UTF-8 date +%A)"
wget -q -O /tmp/carinas.pdf http://carinaskok.se/files/meny-v.-$(date +%W).pdf && \
pdftotext /tmp/carinas.pdf - | grep --color=never -A 1 -i $idag | grep -i -v $idag | sed "s/^ *//"
