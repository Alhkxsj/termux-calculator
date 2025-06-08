#!/data/data/com.termux/files/usr/bin/bash

# 少女配色
PINK='\033[1;35m'
SOFT_PINK='\033[38;5;218m'
PASTEL_YELLOW='\033[38;5;229m'
PASTEL_BLUE='\033[38;5;153m'
PASTEL_PURPLE='\033[38;5;183m'
WHITE='\033[1;37m'
BOLD='\033[1m'
RESET='\033[0m'
BG_SOFT='\033[48;5;224m'
STAR='\xE2\x98\x86'
HEART='\xE2\x99\xA5'
FLOWER='\xE2\x99\xAB'

# 居中输出
center() {
  local s="$1"
  local w=46
  local l=$(echo -e "$s" | wc -c)
  local p=$(( (w - l) / 2 ))
  printf "%*s%s%*s\n" $p "" "$s" $p ""
}

# 动感LOGO
logo_lines=(
"${SOFT_PINK}${BOLD}╔═══════════════════════════════════════════════╗${RESET}"
"${SOFT_PINK}${BOLD}║                                               ║${RESET}"
"${SOFT_PINK}${BOLD}║   ${PINK}✿${PASTEL_PURPLE}  少 女 计 算 器  启 动 菜 单  ${PINK}✿   ${SOFT_PINK}║${RESET}"
"${SOFT_PINK}${BOLD}║${RESET}        ${PASTEL_YELLOW}可爱与效率并存的小帮手~        ${SOFT_PINK}║${RESET}"
"${SOFT_PINK}${BOLD}║                                               ║${RESET}"
"${SOFT_PINK}${BOLD}╠═══════════════════════════════════════════════╣${RESET}"
)

print_logo() {
    clear
    for i in "${!logo_lines[@]}"; do
        echo -e "${logo_lines[$i]}"
        sleep 0.06
    done
    center "${PASTEL_YELLOW}作者：快手：泠好困想睡觉${RESET}"
    echo -e "${SOFT_PINK}${BOLD}╟───────────────────────────────────────────────╢${RESET}"
}

main_menu() {
    print_logo
    # 可爱菜单体
    echo -e "${SOFT_PINK}${BOLD}║${RESET}   ${PINK}1.${RESET} ${PASTEL_BLUE}启动终端版${RESET}      ${WHITE}♡${RESET}    ${PINK}2.${RESET} ${PASTEL_PURPLE}检查更新${RESET}    ${PASTEL_YELLOW}★${RESET}     ${SOFT_PINK}${BOLD}║${RESET}"
    echo -e "${SOFT_PINK}${BOLD}║${RESET}   ${PINK}3.${RESET} ${PASTEL_YELLOW}卸载少女计算器${RESET}  ${PASTEL_PURPLE}✗${RESET}    ${PINK}4.${RESET} ${WHITE}退出${RESET}           ${PASTEL_BLUE}❀${RESET}     ${SOFT_PINK}${BOLD}║${RESET}"
    echo -e "${SOFT_PINK}${BOLD}╚═══════════════════════════════════════════════╝${RESET}"
    echo
    # 软萌输入提示
    for i in {1..2}; do
        echo -ne "${PASTEL_YELLOW}请选个可爱编号吧~ ➤ ${RESET}"
        sleep 0.15
        echo -ne "\r                             \r"
        sleep 0.12
    done
    read -p "$(echo -e ${PASTEL_YELLOW}请选个可爱编号吧~ ➤ ${RESET})" opt

    case "$opt" in
        1)
            echo -e "${PINK}少女终端版正在为你闪亮登场！${RESET}"
            sleep 0.5
            python "$HOME/python/计算机.py"
            ;;
        2)
            echo -e "${PASTEL_BLUE}少女正在努力为你检查最新版本喵~${RESET}"
            sleep 0.4
            upgrade
            ;;
        3)
            echo -e "${PASTEL_PURPLE}少女有点舍不得地帮你卸载了...${RESET}"
            rm -rf "$HOME/python"
            sed -i '/少女计算器/d' "$HOME/.bashrc"
            echo -e "${PASTEL_YELLOW}卸载完成，下次再见要记得我哦！${RESET}"
            exit
            ;;
        4)
            echo -e "${PASTEL_PURPLE}再见喵~ 祝你每天都可爱又开心！${RESET}"
            exit
            ;;
        *)
            echo -e "${PINK}喵呜，选项输错啦，请重新试试吧~${RESET}"
            sleep 1
            main_menu
            ;;
    esac
}

# 检查更新函数
upgrade() {
    cd "$HOME/python"
    curl -fsSLO https://raw.githubusercontent.com/Alhkxsj/termux-calculator/main/计算机.py
    curl -fsSLO https://raw.githubusercontent.com/Alhkxsj/termux-calculator/main/版本.txt
    echo -e "${PASTEL_BLUE}升级完成！欢迎再次体验少女的魔法♡${RESET}"
    exit
}

main_menu
