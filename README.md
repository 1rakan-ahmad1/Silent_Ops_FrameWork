<img width="774" height="354" alt="0" src="https://github.com/user-attachments/assets/e700986e-fbf7-46e1-be2e-16af1cfa21ef" />
<img width="943" height="440" alt="1" src="https://github.com/user-attachments/assets/ceaeaff8-5983-43b0-b73d-31fe829d9fe5" />
<img width="862" height="497" alt="2" src="https://github.com/user-attachments/assets/3a00f17b-1cd0-49d3-a636-1d22d0972937" />
<img width="970" height="429" alt="3" src="https://github.com/user-attachments/assets/3112021d-e5d5-48df-be31-6c7b378c9149" />
<img width="1086" height="437" alt="4" src="https://github.com/user-attachments/assets/0800ec1c-48da-49db-84ea-866f42280890" />






# ⚡ SilentOps Framework

An interactive, menu-driven Offensive Security framework designed to unify reconnaissance, payload generation, exploitation handlers, and password-cracking workflows natively inside Kali Linux.

**Author:** Rakan Khaled  
**Platform:** Kali Linux  
**Category:** Offensive Security / Penetration Testing  
**Language:** Bash Scripting  

---

## 📌 Overview

**SilentOps** is a modular, terminal-based offensive security framework developed to streamline multi-stage penetration testing workflows. Instead of jumping between disconnected CLI tools, SilentOps integrates crucial lifecycle phases—from initial OSINT and stealth scanning to payload delivery, listener initialization, and credential auditing—into a centralized interface.

### Key Architecture Highlights
* **Native Integration:** Built on top of industry-standard toolsets (Nmap, Hydra, Scapy, John, etc.).
* **Stealth Focused:** Features dedicated modules for IDS/IPS evasion using packet fragmentation.
* **Modular Payloads:** Automates the creation of weaponized documents and execution vectors.
* **Session Persistence:** Integrated active handlers to catch incoming reverse connections.

---

## ⚠️ Legal Disclaimer

This framework is intended **ONLY** for educational purposes, cybersecurity training labs, and authorized penetration testing. Any use against systems without prior explicit written permission is strictly illegal. The author assumes no liability for misuse, damages, or unintended consequences resulting from this tool.

---

## 🧩 Framework Architecture & Menus

### 1️⃣ Reconnaissance & Scanning Menu
Designed for thorough information gathering and infrastructure mapping:
* **Emails Gathering:** Automated OSINT via passive and active sources.
* **Port Scanning & Host Discovery:** Rapid asset discovery and service identification.
* **Stealth TCP Scan:** Fragmented packets engineered for IDS evasion (Slow but Anonymous).
* **Stealth UDP Scan:** Fragmented UDP auditing bypassing standard inspection controls.
* **Vulnerability Assessment:** Scans targeting popular CVEs and high-impact vulnerabilities.
* **SMB & SNMP Enumeration:** Complete null-session checks, share enumeration, and MIB walking.

### 2️⃣ Attack & Password Cracking Menu
Splits credential auditing into real-time network attacks and local cryptographic cracking:
* **Online Password Attacks:**
  * FTP Brute Forcing 
  * SSH Brute Forcing
  * SMB Brute Forcing
* **Offline Password Cracking:**
  * PDF Document Password Decryption
  * ZIP Archive Cracking
  * MD5 Cryptographic Hash Cracking

### 3️⃣ Payloads Menu
Automates the generation of initial access vectors and reverse shells:
* **VBA PSH (Excel):** Generates weaponized Excel documents embedding obfuscated PowerShell reverse shells.
* **VBA Macro (Excel):** Standard macro-based office delivery vectors.
* **HTA psh:** HTML Application deployment payloads invoking PowerShell stagers.
* **exe app:** Compiles standalone executable reverse shells for direct execution.

### 4️⃣ Handler Crafting (Listener)
A streamlined interface to quickly spin up backend listeners:
* Allows instant configuration of `LHOST` and `LPORT`.
* Sets up reliable catchers for generated `VBA`, `HTA`, or `EXE` reverse shell callbacks.

---

## 📚 Unified Wordlists Setup

All password-cracking modules rely on structured, optimized dictionaries to maximize coverage and maintain consistency:
* **Default Wordlist Strength:** Based on custom-filtered `RockYou` variants containing **2,904,739** unique patterns.
* **Consistency:** The same unified database provides predictable testing behaviors across PDF, ZIP, and MD5 modules.
* **Customization:** Users can seamlessly pass runtime flags or switch to bespoke wordlists as needed.

---

## 🛠️ Installation & Setup

SilentOps runs natively on any up-to-date Kali Linux instance.

### 1. Clone the Repository
Ensure you clone it directly to your home path or verified working directory:
```bash
cd /home/kali/
git clone [https://github.com/1rakan-ahmad1/Silent_Ops_FrameWork.git](https://github.com/1rakan-ahmad1/Silent_Ops_FrameWork.git)
2. Navigate & Set Permissions
Bash
cd /home/kali/Silent_Ops_FrameWork
chmod +x silentops.sh
chmod +x ui_engine.sh
3. Install Core Dependencies
Ensure all backend engines are installed via apt:

Bash
sudo apt update && sudo apt install \
nmap theharvester gobuster hydra patator john dnsutils -y
4. Execute the Framework
Run with elevated privileges to allow low-level socket manipulation (e.g., packet fragmentation, network sniffing):

Bash
sudo bash silentops.sh
📁 Directory Structure
Plaintext
Silent_Ops_FrameWork/
├── silentops.sh               # Main control flow logic
├── ui_engine.sh               # Interactive interface generator
├── README.md                  # Documentation
├── ftp_usernames_list.txt     # Targeted credential hunting
├── ftp_passwords_list.txt
├── ssh_usernames_list.txt
├── ssh_passwords_list.txt
├── pdf_passwords_wordlist.txt # Local cryptographic dictionaries
├── zip_passwords_wordlist.txt
├── hash_wordlist.txt
└── paths.txt                  # Directory web bruteforcing list
