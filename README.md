

# 🔥 SilentOps Framework

**Author:** Rakan Khaled  
**Platform:** Kali Linux  
**Category:** Offensive Security / Penetration Testing  
**Language:** Bash  

---

## 📌 Overview

**SilentOps Framework** is a modular, terminal-based offensive security framework built for **educational purposes and authorized penetration testing**.

The framework unifies **server reconnaissance**, **online brute-force attacks**, and **offline password cracking** into a single interactive, menu-driven environment that follows realistic penetration testing workflows.

SilentOps is designed to be:

- Simple to deploy  
- Easy to understand  
- Practical for students and junior red-teamers  
- Fully compatible with Kali Linux toolsets  

---

## ⚠️ Legal Disclaimer

This framework is intended **ONLY** for:

- Educational use  
- Cybersecurity training labs  
- Authorized penetration testing  

🚫 **Any use against systems you do not own or have explicit permission to test is illegal.**  
The author is **not responsible** for misuse or damage caused by this tool.

---

## 🧩 Framework Structure

SilentOps is divided into **two main sections**:

---

### 🔍 Section 1: Server Reconnaissance & Enumeration

Includes:

- Email harvesting (theHarvester)  
- IPv4 & IPv6 enumeration  
- MX & NS DNS record discovery  
- Full port scanning & OS detection  
- Vulnerability scanning (CVSS-based)  
- SMB enumeration  
- Web directory brute-force (Gobuster)  

---

### 💥 Section 2: Attack & Password Cracking

#### 🔐 Online Password Attacks
- FTP brute-force (Hydra)  
- SSH brute-force (Patator)
- SMB brute-force (nmap) 

#### 🧠 Offline Password Attacks
- PDF password cracking  
- ZIP password cracking  
- MD5 hash cracking  

---

## 📚 Wordlists & Password Databases

All offline cracking modules rely on a **unified password database**.

### 🔑 Default Offline Wordlist

- Based on **RockYou**
- **Total passwords (per PDF / ZIP / HASH wordlist):** `2,904,739`
- Used consistently across:
  - PDF cracking
  - ZIP cracking
  - Hash cracking

This ensures:

- Consistent attack strength  
- Predictable cracking behavior  
- Standardized testing results  

📌 Users may also supply **custom wordlists** at runtime.

---

## 🛠 Installation

SilentOps Framework runs natively on **Kali Linux** with minimal setup.

---

### 1️⃣ Clone the Framework

```bash
cd /home/kali/
git clone https://github.com/rakan-khaled1/Silent_Ops_FrameWork.git
Or ensure the directory exists:

text

/home/kali/Silent_Ops_FrameWork
2️⃣ Navigate to the Directory

cd /home/kali/Silent_Ops_FrameWork
3️⃣ Set Execution Permissions

chmod +x silentops.sh
chmod +x ui_engine.sh
4️⃣ Install Required Tools

sudo apt update && sudo apt install \
nmap theharvester gobuster hydra patator john dnsutils -y
5️⃣ Wordlists Setup
Default wordlists are stored in:

text
Copy code
/home/kali/Silent_Ops_FrameWork/
Includes:

FTP usernames & passwords

SSH usernames & passwords

PDF / ZIP / HASH wordlists

Web path lists

6️⃣ Run the Framework

sudo bash silentops.sh
📝 Logging & Output
Optional result saving

Timestamped output files

Live output using tee

Organized per execution session

📁 Default Directory Structure
text
Copy code
Silent_Ops_FrameWork/
│
├── silentops.sh
├── ui_engine.sh
├── README.md
│
└── /home/kali/Silent_Ops_FrameWork/
    ├── ftp_usernames_list.txt
    ├── ftp_passwords_list.txt
    ├── ssh_usernames_list.txt
    ├── ssh_passwords_list.txt
    ├── pdf_passwords_wordlist.txt
    ├── zip_passwords_wordlist.txt
    ├── hash_wordlist.txt
    └── paths.txt
🎯 Design Philosophy
SilentOps was developed with a focus on:

Clean Bash scripting

Modular attack logic

Realistic penetration testing flow

Educational clarity

Minimal dependencies

This is not an automated hacking tool, but a learning-focused offensive framework that reflects real-world methodologies.

🚀 Who Is This For?
Cybersecurity students

Ethical hacking learners

Red team beginners

Lab-based penetration testing

Academic security projects

🧠 Final Notes
Offline cracking efficiency depends on wordlist quality

SilentOps allows controlled, transparent testing

Always test legally and responsibly
