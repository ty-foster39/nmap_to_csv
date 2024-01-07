#! /bin/bash
#
# -------------------------- README -----------------------------------
#
# Output: .csv file with the columns ip_address, mac_address, vendor_name
# To run: `bash nmap_generate_csv.sh`
# Modifications: Enter all IP addresses to scan. For example, `sudo nmap -sn 192.300.2.7/24 320.222.5.1/24 |`
# More details: For unknown items, use `sudo nmap -sT -O -v 192.168...`
# 
# ---------------------------------------------------------------------
sudo nmap -sn 192.168.1.1/24 | 
    awk '/Nmap scan report for/{printf $5;}/MAC Address:/{print ","substr($0, index($0,$3)) }' | 
    awk '{ print $1","$2" "$3" "$4" "$5" "$6 }' | 
    tr -d '()' | 
    sort -t . -k 4,4n >> nmap_output_$(date +"%Y%m%d%H%M").csv 
