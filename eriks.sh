#!/bin/bash
idag="$(LC_ALL=sv_SE.UTF-8 date +%A)"

# TODO: Implementera ordentlig HTML-parsing, eller robustare grep

# Den här ful-greppen har fel ungefär varannan vecka, eftersom lunchschemat inte roterar pålitligt.
curl "http://www.eriks.se/gondolen/#meny-lunch" 2>/dev/null | \
grep -i -m 1 -A 1 "<strong>$idag" | grep -i -v $idag | sed "s:\s*<br />::" | sed 's/^\s*//'
