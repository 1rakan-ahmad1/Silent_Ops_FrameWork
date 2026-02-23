#!/bin/bash
# =========================================================
# GLOBAL PROFESSIONAL CLI UI ENGINE
# Level : Red Team / Enterprise Tooling
# Author: Rakan Ahmad
# =========================================================

# ---------------- COLORS ----------------
RESET="\033[0m"
BOLD="\033[1m"
DIM="\033[2m"

RED="\033[38;5;196m"
GREEN="\033[38;5;82m"
YELLOW="\033[38;5;220m"
BLUE="\033[38;5;75m"
PURPLE="\033[38;5;141m"
CYAN="\033[38;5;51m"
WHITE="\033[38;5;252m"
GRAY="\033[38;5;245m"

PRIMARY="$CYAN"
ACCENT="$PURPLE"

LINE="${ACCENT}──────────────────────────────────────────────────────────────${RESET}"

# ---------------- SYMBOLS ----------------
OK="${GREEN}✔${RESET}"
WARN="${YELLOW}⚠${RESET}"
ERR="${RED}✖${RESET}"
INFO="${BLUE}➜${RESET}"

# ---------------- CINEMATIC INTRO ----------------
clear
sleep 0.2
echo -e "$LINE"
printf "${PRIMARY}${BOLD}  Initializing SilentOps FrameWork${RESET}\n"
echo -e "$LINE"
sleep 0.4

for i in "Loading modules" "Preparing interface" "Applying global theme"; do
    printf "${GRAY}  %s${RESET}" "$i"
    for d in {1..3}; do
        printf "${PRIMARY}.${RESET}"
        sleep 0.25
    done
    echo
done

sleep 0.5
clear

# ---------------- SMART echo OVERRIDE ----------------
echo() {
    if [[ "$1" == "-e" ]]; then
        shift
    fi
    builtin echo -e "${PRIMARY}$*${RESET}"
}

# ---------------- SMART read PROMPT COLOR ----------------
read() {
    if [[ "$1" == "-p" ]]; then
        builtin read -p "$(echo -e "${BOLD}${WHITE}${2}${RESET}")" "${@:3}"
    else
        builtin read "$@"
    fi
}

# ---------------- AUTO RESET ----------------
trap 'printf "\033[0m"' EXIT
