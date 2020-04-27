#!/bin/bash
wget -q https://raw.githubusercontent.com/vulnersCom/nmap-vulners/master/vulners.nse
wget -q https://raw.githubusercontent.com/vulnersCom/nmap-vulners/master/http-vulners-regex.nse
wget -q https://raw.githubusercontent.com/vulnersCom/nmap-vulners/master/http-vulners-regex.json
wget -q https://raw.githubusercontent.com/vulnersCom/nmap-vulners/master/http-vulners-paths.txt
mv vulners.se /usr/share/nmap/scripts/
mv http-vulners-regex.nse /usr/share/nmap/scripts/
mv http-vulners-regex.json /usr/share/nmap/nselib/data/
mv http-vulners-paths.txt /usr/share/nmap/nselib/data/
nmap --script-updatedb
