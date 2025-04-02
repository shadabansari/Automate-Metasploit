# Automate-Metasploit

# Metasploit Automation Scripts

## Overview
This repository contains a collection of **Bash scripts** designed to automate vulnerability scanning and exploitation using the **Metasploit Framework**. These scripts help penetration testers efficiently execute Metasploit modules across multiple IP addresses while capturing outputs and screenshots for documentation.

## Features
- Automates Metasploit auxiliary and exploit modules.
- Reads target IPs from a file.
- Saves output logs for later analysis.
- Takes screenshots of results using `scrot` (for documentation and reporting).
- Includes error handling to ensure required tools are installed.

## Prerequisites
Ensure you have the following installed on your system:
- **Metasploit Framework** (`msfconsole`)
- **scrot** (for taking screenshots)
- **Bash** (Linux/macOS environment recommended)

To install the dependencies:
```bash
sudo apt update && sudo apt install metasploit-framework scrot -y
```

## Usage
1. Clone this repository:
   ```bash
   git clone https://github.com/yourusername/metasploit-scripts.git
   cd metasploit-scripts
   ```
2. Ensure your **IP list** is saved in a file (e.g., `ip_addresses.txt`), with one IP per line.
3. Run the script:
   ```bash
   chmod +x bluekeep_scan.sh  # Example script
   ./bluekeep_scan.sh
   ```

## Example Scripts
### **BlueKeep Vulnerability Scanner** (`bluekeep_scan.sh`)
This script checks for the **CVE-2019-0708 (BlueKeep)** vulnerability on a list of IPs.
- Uses Metasploit’s `auxiliary/scanner/rdp/cve_2019_0708` module.
- Saves output and takes screenshots.

### **Heartbleed Vulnerability Scanner** (`heartbleed_scan.sh`)
- Uses Metasploit’s `auxiliary/scanner/ssl/openssl_heartbleed`.
- Detects **CVE-2014-0160 (Heartbleed)**.

### **SMB Exploit Scanner** (`smb_exploit_scan.sh`)
- Runs SMB-based exploits like EternalBlue.

## Output & Logs
- All **screenshots** are saved in the `screenshots/` directory.
- Each scan outputs results in the terminal.

## Customization
To modify or add a new Metasploit module:
- Edit the script and replace the Metasploit module name (`use auxiliary/scanner/...`).
- Adjust `set` commands for required module options.
- Run the script as usual.

## Disclaimer
**For educational and authorized security testing purposes only.** Unauthorized use may violate laws and regulations.

---
📌 **Contributions Welcome!** Feel free to submit issues and pull requests. 🚀

