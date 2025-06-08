#!/data/data/com.termux/files/usr/bin/bash

# 梦幻少女配色
PINK='\033[38;5;213m'
SOFT_PINK='\033[38;5;218m'
PASTEL_BLUE='\033[38;5;153m'
PASTEL_PURPLE='\033[38;5;183m'
YELLOW='\033[38;5;229m'
WHITE='\033[1;37m'
BOLD='\033[1m'
CYAN='\033[1;36m'
RED='\033[1;31m'
RESET='\033[0m'

# 少女符号
HEART="❤"
FLOWER="❀"
STAR="✩"
RIBBON="🎀"
SPARKLE="✨"
BUNNY="₍ᐢ •͈ ༝ •͈ ᐢ₎"
CAT="ฅ•ω•ฅ"
MUSIC="♪"
BUBBLE="◦"
WING="꒰ঌ"
BUTTERFLY="𓆩✿𓆪"

# 居中输出函数
center() {
  local s="$1"
  local w=54
  local l=$(echo -e "$s" | wc -m)
  local p=$(( (w - l) / 2 ))
  printf "%*s%s%*s\n" $p "" "$s" $p ""
}

# 梦幻渐变少女LOGO动效
logo_lines=(
"${SOFT_PINK}${BOLD}╭────────────────────────────────────────────────────╮${RESET}"
"${SOFT_PINK}${BOLD}│                                                    │${RESET}"
"${SOFT_PINK}${BOLD}│   ${PINK}${RIBBON}${STAR}${FLOWER}${SPARKLE}${BOLD}  少 女 计 算 器 ♡ 梦 幻 启 动 菜 单  ${SPARKLE}${FLOWER}${STAR}${RIBBON}   ${SOFT_PINK}│${RESET}"
"${SOFT_PINK}${BOLD}│                                                    │${RESET}"
"${SOFT_PINK}${BOLD}│      ${PASTEL_PURPLE}让可爱与智慧闪耀你的小小世界~${MUSIC}      ${SOFT_PINK}│${RESET}"
"${SOFT_PINK}${BOLD}│                                                    │${RESET}"
"${SOFT_PINK}${BOLD}╰────────────────────────────────────────────────────╯${RESET}"
)

logo_rainbow() {
    clear
    for i in "${!logo_lines[@]}"; do
        case $i in
            0|6) echo -e "${SOFT_PINK}${BOLD}${logo_lines[$i]}${RESET}" ;;
            2) echo -e "${PASTEL_PURPLE}${BOLD}${logo_lines[$i]}${RESET}" ;;
            4) echo -e "${PASTEL_BLUE}${BOLD}${logo_lines[$i]}${RESET}" ;;
            *) echo -e "${PINK}${logo_lines[$i]}${RESET}" ;;
        esac
        sleep 0.05
    done

    # 美化版作者信息输出 ✨🌸
    center "${PASTEL_PURPLE}${BOLD}${BUTTERFLY}${SPARKLE}${BUNNY}${SPARKLE}${FLOWER}${RIBBON}${YELLOW} 作者：快手：啊泠好困想睡觉 ${RIBBON}${FLOWER}${SPARKLE}${BUNNY}${SPARKLE}${BUTTERFLY}${RESET}"
    echo -e "${SOFT_PINK}${BOLD}─────────────────────────────────────────────────────${RESET}\n"
}

# 少女菜单
main_menu() {
    while true; do
        logo_rainbow
        # 菜单体，超少女符号点缀
        echo -e "${PASTEL_PURPLE}${BOLD}     1.${RESET} ${PINK}启动终端版${RESET}     ${HEART}${STAR}   ${PASTEL_BLUE}${BOLD}2.${RESET} 检查更新 ${SPARKLE}${FLOWER}${RESET} "
        echo -e "${PASTEL_PURPLE}${BOLD}     3.${RESET} ${RED}卸载少女计算器${RESET} ${WING}${HEART}${RESET}   ${PASTEL_BLUE}${BOLD}4.${RESET} 退出 ${CAT}${RESET}\n"
        echo -e "${YELLOW}${BOLD}═════════════════════════════════════════════════════${RESET}"
        # 输入动效
        for i in {1..2}; do
            echo -ne "${PINK}${BUBBLE} 请选一个少女编号喵~${SPARKLE} ➤ ${RESET}"
            sleep 0.13
            echo -ne "\r                                         \r"
            sleep 0.11
        done
        read -p "$(echo -e ${PINK}${BUBBLE} 请选一个少女编号喵~${SPARKLE} ➤ ${RESET})" opt

        case "$opt" in
            1)
                echo -e "${PINK}${BOLD}${SPARKLE} 少女终端版即将闪亮起航！${HEART}${RESET}"
                sleep 0.7
                python "$HOME/python/计算机.py"
                break
                ;;
            2)
                echo -e "${PASTEL_BLUE}${SPARKLE} 少女正在温柔为你检查最新版本哟~${RESET}"
                sleep 0.5
                upgrade
                break
                ;;
            3)
                echo -e "${PASTEL_PURPLE}${BOLD}${WING}${HEART} 真舍不得……少女为你完成卸载啦${RESET}"
                rm -rf "$HOME/python"
                sed -i '/少女计算器/d' "$HOME/.bashrc"
                echo -e "${YELLOW}${BUBBLE} 卸载好啦，下次再见要记得我哟！${RESET}"
                exit
                ;;
            4)
                echo -e "${PINK}${BOLD}${CAT} 再见喵~ 祝你每天都可爱又心动！${RESET}"
                exit
                ;;
            *)
                echo -e "${YELLOW}${BUBBLE} 少女没听懂你的选择，再试一次嘛~${RESET}"
                sleep 1
                ;;
        esac
    done
}

# 检查更新函数
upgrade() {
    cd "$HOME/python"
    curl -fsSLO https://raw.githubusercontent.com/Alhkxsj/termux-calculator/main/计算机.py
    curl -fsSLO https://raw.githubusercontent.com/Alhkxsj/termux-calculator/main/版本.txt
    echo -e "${PASTEL_BLUE}${SPARKLE} 升级完成！欢迎再次体验少女的魔法${HEART}${RESET}"
    exit
}

main_menu
