# bebdoNmap - Interactive Nmap Port Scanner

## Overview
bebdoNmap is a Bash-based interactive Nmap port scanner with a menu-driven interface and stylish ASCII art. It helps you quickly perform common network reconnaissance and enumeration tasks using Nmap.

## Features
- Interactive menu for common Nmap scan types
- ASCII art GUI header
- Supports live host discovery, port scanning, service detection, OS fingerprinting, scripting, and more
- Prompts for target IP/subnet as needed
- Clears the screen and redraws the menu after each scan
- Easy to extend with new scan types

## Usage
1. **Make the script executable:**
   ```bash
   chmod +x tools/Nmap.sh
   ```
2. **Run the script:**
   ```bash
   ./tools/Nmap.sh
   ```
3. **Follow the on-screen menu:**
   - Enter the number for the scan you want
   - Enter the target IP or subnet when prompted
   - Press Enter to return to the menu after each scan

## Menu Options
1. **Live Host Discovery (Ping Sweep):**
   - Find live hosts on a subnet using ICMP/ARP
2. **Aggressive ARP Scan:**
   - ARP scan for all hosts on a /24 LAN
3. **Stealth SYN Scan:**
   - Fast scan of all TCP ports (requires root)
4. **TCP Connect Scan:**
   - Scan top 1000 TCP ports (no root needed)
5. **UDP Scan:**
   - Scan common UDP ports (53, 67, 123, 161)
6. **Service & Version Detection:**
   - Detect running services and versions
7. **OS Fingerprinting:**
   - Attempt to determine the target OS
8. **Aggressive Scan:**
   - All-in-one: version, OS, traceroute, scripts
9. **Run Default Scripts:**
   - Use Nmap's default scripts for enumeration
10. **Vulnerability Scripts:**
    - Run scripts to check for known vulns
11. **Traceroute:**
    - Map the network path to the target
0. **Exit:**
    - Quit the tool

## Improvements & Additional Features
- Added input validation for IP/subnet format
- Added option to save scan output to a file
- Added option to specify custom ports for scans
- Added help/about option in the menu
- Improved error handling and user prompts

## Example
```
$ ./tools/Nmap.sh
 ____            _     _             
| __ )  ___  ___| |__ (_)_ __   __ _ 
|  _ \ / _ \/ __| '_ \| | '_ \ / _` |
| |_) |  __/ (__| | | | | | | | (_| |
|____/ \___|\___|_| |_|_|_| |_|\__, |
                               |___/ 

  Nmap Scanner by bebdon

Select an Nmap scan option:
1) Live Host Discovery (Ping Sweep)
...
Enter choice: 3
Target IP: 192.168.1.10
Scanning...
...
Press Enter to continue...
```

## Requirements
- Bash shell (Linux, macOS, or WSL on Windows)
- Nmap installed and in your PATH

## License
MIT
