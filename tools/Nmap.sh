#!/bin/bash
# bebdoNmap - Interactive Nmap Port Scanner by bebdon

ascii_art() {
cat << "EOF"
 ____            _     _             
| __ )  ___  ___| |__ (_)_ __   __ _ 
|  _ \ / _ \/ __| '_ \| | '_ \ / _` |
| |_) |  __/ (__| | | | | | | | (_| |
|____/ \___|\___|_| |_|_|_| |_|\__, |
                               |___/ 

  Nmap Scanner by bebdon
EOF
}

menu() {
    echo "\nSelect an Nmap scan option:" 
    echo "1) Live Host Discovery (Ping Sweep)"
    echo "2) Aggressive ARP Scan (/24 LAN)"
    echo "3) Stealth SYN Scan (all ports)"
    echo "4) TCP Connect Scan (ports 1-1000)"
    echo "5) UDP Scan (common ports)"
    echo "6) Service & Version Detection"
    echo "7) OS Fingerprinting"
    echo "8) Aggressive Scan (all-in-one)"
    echo "9) Run Default Scripts"
    echo "10) Vulnerability Scripts"
    echo "11) Traceroute"
    echo "12) Custom Port Scan"
    echo "13) Save Last Scan Output to File"
    echo "14) About/Help"
    echo "0) Exit"
    echo -n "\nEnter choice: "
}

ascii_art

scan_output=""
last_scan=""

while true; do
    menu
    read choice
    case $choice in
        1)
            read -p "Target subnet (e.g. 10.0.0.0/24): " target
            nmap -sn "$target"
            ;;
        2)
            read -p "Target subnet (e.g. 10.0.0.0/24): " target
            nmap -PR -sn "$target"
            ;;
        3)
            read -p "Target IP: " target
            nmap -sS -p- -T4 -v "$target"
            ;;
        4)
            read -p "Target IP: " target
            nmap -sT -p 1-1000 "$target"
            ;;
        5)
            read -p "Target IP: " target
            nmap -sU -p 53,67,123,161 "$target"
            ;;
        6)
            read -p "Target IP: " target
            nmap -sV "$target"
            ;;
        7)
            read -p "Target IP: " target
            nmap -O "$target"
            ;;
        8)
            read -p "Target IP: " target
            nmap -A "$target"
            ;;
        9)
            read -p "Target IP: " target
            nmap -sC -sV "$target"
            ;;
        10)
            read -p "Target IP: " target
            nmap --script vuln "$target"
            ;;
        11)
            read -p "Target IP: " target
            nmap --traceroute -sn "$target"
            ;;
        12)
            read -p "Target IP: " target
            read -p "Ports (e.g. 22,80,443 or 1-1000): " ports
            scan_output=$(nmap -Pn -p "$ports" "$target")
            echo "$scan_output"
            last_scan="$scan_output"
            ;;
        13)
            if [ -z "$last_scan" ]; then
                echo "No scan output to save. Run a scan first."
            else
                read -p "Enter filename to save output: " filename
                echo "$last_scan" > "$filename"
                echo "Output saved to $filename"
            fi
            ;;
        14)
            echo "bebdoNmap - Interactive Nmap Port Scanner by bebdon"
            echo "- Menu-driven Nmap tool for quick recon"
            echo "- Choose scan type, enter target, view/save results"
            echo "- See Nmap_User_Guide.md for full documentation."
            ;;
        0)
            echo "Goodbye!"
            exit 0
            ;;
        *)
            echo "Invalid option. Try again."
            ;;
    esac
    echo "\nPress Enter to continue..."
    read
    clear
    ascii_art
    done
