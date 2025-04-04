# Automate-Metasploit

## Metasploit Automation Scripts

### 📌 Overview

This repository contains a **Bash-based automation script** that helps penetration testers run multiple Metasploit Framework modules across a list of target IP addresses. It logs outputs, takes screenshots, and saves results in module-specific folders — all in one run.

---

## 🚀 Features

- Menu-based module selection
- Automates both auxiliary and exploit modules
- Reads target IPs from a text file
- Saves logs and screenshots per module
- Runs Metasploit modules silently with `.rc` scripting
- Captures clean terminal output and module configuration
- Easy to extend or modify

---

## ✅ Supported Modules

| No. | Metasploit Module |
|-----|--------------------|
| 1   | auxiliary/scanner/ftp/anonymous |
| 2   | auxiliary/scanner/rdp/cve_2019_0708_bluekeep |
| 3   | auxiliary/scanner/ssl/openssl_heartbleed |
| 4   | auxiliary/scanner/smb/smb_ms17_010 |
| 5   | exploit/multi/http/simple_backdoors_exec |
| 6   | auxiliary/scanner/mysql/mysql_authbypass_hashdump |
| 7   | auxiliary/scanner/msmq/cve_2023_21554_queuejumper |
| 8   | auxiliary/scanner/smtp/smtp_relay |

---

## ⚙️ Prerequisites

Ensure the following are installed:

- Metasploit Framework (`msfconsole`)
- `scrot` (for screenshots)
- `bash` shell

Install them on a Debian-based system:

```bash
sudo apt update && sudo apt install metasploit-framework scrot -y
```

---

## 📂 Folder Structure

Results are saved in the following folder structure:

```
outputs/
├── heartbleed/
│   ├── logs/
│   │   └── 192.168.1.10.log
│   └── screenshots/
│       └── 192.168.1.10.png
├── smb_ms17_010/
│   ├── logs/
│   └── screenshots/
...
```

Each module will have:
- A `logs/` folder for terminal output per IP
- A `screenshots/` folder for terminal capture

---

## 🧪 Usage

### 1. Clone the Repository

```bash
git clone https://github.com/yourusername/automate-metasploit.git
cd automate-metasploit
```

### 2. Prepare Your IP List

Create a file called `ip_addresses.txt` in the same directory:

```
192.168.1.100
10.0.0.55
```

### 3. Run the Script

Make it executable and start scanning:

```bash
chmod +x metasploit_automator.sh
./metasploit_automator.sh
```

### 4. Select a Module from Menu

You'll see a menu like this:

```
Select the exploit module to run:
1) auxiliary/scanner/ftp/anonymous
2) auxiliary/scanner/rdp/cve_2019_0708_bluekeep
3) auxiliary/scanner/ssl/openssl_heartbleed
...
Enter your choice [1-8]:
```

Once selected, the script:
- Runs the module on each IP
- Saves logs with output from `options` and `run`
- Takes terminal screenshots using `scrot`

---

## 📄 Output Example

For each IP scanned:
- Logs are saved to `outputs/<module>/logs/<ip>.log`
- Screenshots are saved to `outputs/<module>/screenshots/<ip>.png`

Logs contain:
- The full output of the `options` command (module settings)
- The result of the `run` command
- Cleaned, readable text without ANSI escape codes

---

## ✏️ Customization

To add a new module:
1. Open `metasploit_automator.sh`
2. Add a new menu entry in the case list
3. Create a new folder name for it
4. Define the module path and required `set` commands

Example:
```bash
"9" ) module="auxiliary/scanner/http/http_put"
     folder="http_put"
     ;;
```

---

## ⚠️ Disclaimer

> **This tool is for educational and authorized testing purposes only.**
> Do **NOT** use this on networks or systems you don't own or have explicit permission to test.
> Unauthorized use of this tool may be illegal and unethical.

---

## 🤝 Contributions Welcome

If you'd like to add more modules, features, or improve functionality — feel free to fork this repo and submit a pull request.

---

## 👤 Author

🔗 LinkedIn: [@xhanix](https://www.linkedin.com/in/xhanix/)

---

## 📝 License

This project is licensed under the [MIT License](LICENSE)
