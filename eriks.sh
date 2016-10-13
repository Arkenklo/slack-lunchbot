#!/bin/bash
idag="$(LC_ALL=sv_SE.UTF-8 date +%A)"

curl "http://www.eriks.se/gondolen/#meny-lunch" 2>/dev/null | \
grep -i -m 1 -A 1 $idag | grep -i -v $idag | sed "s:\s*<br />::" | sed 's/^\s*//'
