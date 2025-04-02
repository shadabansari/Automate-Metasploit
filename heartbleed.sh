#!/bin/bash

# Check if Metasploit Framework is installed
command -v msfconsole >/dev/null 2>&1 || { echo >&2 "Metasploit Framework is required but not installed. Aborting."; exit 1; }
command -v scrot >/dev/null 2>&1 || { echo >&2 "scrot is required but not installed. Aborting."; exit 1; }

# Create a directory to save the screenshots
mkdir -p screenshots

# Loop through each IP address in the file
while IFS= read -r ip; do
    echo "Scanning for OpenSSL Heartbleed on $ip"
    clear
    
    # Create a temporary msfconsole script
    echo "use auxiliary/scanner/ssl/openssl_heartbleed" > msf_script.rc
    echo "set VERBOSE true" >> msf_script.rc
    echo "set RHOSTS $ip" >> msf_script.rc
    echo "run" >> msf_script.rc
    echo "exit" >> msf_script.rc
    
    # Run msfconsole with the script and save the output
    msfconsole -q -r msf_script.rc > temp_output.txt 2>/dev/null
    
    # Display the output in the terminal
    cat temp_output.txt
    
    # Take a screenshot of the output
    scrot -u -d 1 -q 100 "screenshots/$ip.png"
    
    # Remove the temporary files
    rm msf_script.rc
    rm temp_output.txt
    
    # Wait for 5 seconds before running the script on the next IP
    sleep 5

done < ip_addresses.txt

