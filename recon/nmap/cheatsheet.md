# 🔍 Nmap Recon Cheatsheet

## 🔍 Live Host Discovery

### Basic ping sweep:
```bash
nmap -sn 10.0.0.0/24
```
This sends ICMP echo requests and ARP to find live hosts. Works well on internal networks.

### Aggressive ARP scan (good on a /24 LAN, ignores ICMP blocks):
```bash
nmap -PR -sn 10.0.0.0/24
```
Forces ARP discovery even if ICMP is blocked by host firewalls.

### Detect hosts behind firewalls (TCP ACK or SYN):
```bash
nmap -PA80,443 -sn 10.0.0.0/24
nmap -PS22,80,443 -sn 10.0.0.0/24
```

## 🕷️ Port Scanning & Service Enumeration

### Stealth SYN scan (the bread & butter of red team recon):
```bash
nmap -sS -p- -T4 -v 10.0.0.5
```
Scans all ports (0–65535) quickly. Use `-T4` for speed, `-T0` or `-T1` if you want to stay quiet.

### TCP connect scan (fallback if you lack raw socket privileges):
```bash
nmap -sT -p 1-1000 10.0.0.5
```

### UDP scan (slow, but important for services like DNS, SNMP, TFTP):
```bash
nmap -sU -p 53,67,123,161 10.0.0.5
```

### Service and version detection:
```bash
nmap -sV 10.0.0.5
```

### OS fingerprinting:
```bash
nmap -O 10.0.0.5
```

### Aggressive scan (combines version detection, OS detection, traceroute, and scripts):
```bash
nmap -A 10.0.0.5
```

## 🔗 Scripting & Advanced Enumeration

Nmap’s NSE (Nmap Scripting Engine) is where it shines for enumeration.

### Run default scripts:
```bash
nmap -sC -sV 10.0.0.5
```

### Run a specific category of scripts (e.g., vuln):
```bash
nmap --script vuln 10.0.0.5
```

### Run a specific script (e.g., smb-enum-shares):
```bash
nmap --script smb-enum-shares -p445 10.0.0.5
```

### Brute-force an SSH login:
```bash
nmap --script ssh-brute -p22 10.0.0.5
```

## 👣 Network Mapping & Topology

### Traceroute to target:
```bash
nmap --traceroute -sn 10.0.0.5
```

### Identify hosts, open ports, and network path all at once:
```bash
nmap -A -T4 10.0.0.5
```

## 📜 Pro Tips

✅ Use `-oA` output to save your scans in all formats.  
✅ Mix `--top-ports <N>` for faster scans of the most common ports.  
✅ Use `--reason` to see why Nmap thinks a port is open.  
✅ Consider `-Pn` if ICMP is blocked and you’re sure the host is up.