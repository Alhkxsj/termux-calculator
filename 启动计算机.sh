#!/data/data/com.termux/files/usr/bin/bash

# 配置文件保存皮肤
CONFIG_FILE="$HOME/.少女计算器配置"

# 默认皮肤名
SKIN_NAME="pink"

# 加载皮肤
load_skin() {
    if [[ -f "$CONFIG_FILE" ]]; then
        SKIN_NAME=$(cat "$CONFIG_FILE")
    fi

    case "$SKIN_NAME" in
        "pink")
            PINK='\033[38;5;213m'
            SOFT_PINK='\033[38;5;218m'
            PASTEL_BLUE='\033[38;5;153m'
            PASTEL_PURPLE='\033[38;5;183m'
            ;;
        "dark")
            PINK='\033[38;5;60m'
            SOFT_PINK='\033[38;5;105m'
            PASTEL_BLUE='\033[38;5;111m'
            PASTEL_PURPLE='\033[38;5;99m'
            ;;
        *)
            echo "未知皮肤，使用默认粉色系"
            SKIN_NAME="pink"
            ;;
    esac
}

# 基础色不变
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

# 彩蛋少女语录
EGGS=(
    "🌸 今天也要像花一样可爱地盛开~"
    "✨ 计算一下今天的心动指数是多少~"
    "🎀 用智慧点亮粉色的梦想世界~"
    "ฅ•ω•ฅ 喵～欢迎回来小可爱~"
    "❄ 少女的魔法，是不容低估的哦~"
)

# 彩蛋显示
show_easter_egg() {
    local egg=${EGGS[$RANDOM % ${#EGGS[@]}]}
    center "${PASTEL_PURPLE}${BOLD}${SPARKLE} ${egg} ${SPARKLE}${RESET}"
    sleep 1.3
}

# 居中输出函数
center() {
  local s="$1"
  local w=54
  local l=$(echo -e "$s" | wc -m)
  local p=$(( (w - l) / 2 ))
  printf "%*s%s%*s\n" $p "" "$s" $p ""
}

# 启动动画
startup_animation() {
    clear
    for frame in 1 2 3 4 5; do
        echo -ne "${PINK}${BOLD}少女计算器正在启动"
        for ((i = 0; i < frame; i++)); do
            echo -n "${SPARKLE}"
        done
        echo -ne "${RESET}\r"
        sleep 0.25
    done
    echo ""
    sleep 0.4
}

# 梦幻 LOGO 动效
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
    center "${PASTEL_PURPLE}${BOLD}${BUTTERFLY}${SPARKLE}${BUNNY}${SPARKLE}${FLOWER}${RIBBON}${YELLOW} 作者：快手：啊泠好困想睡觉 ${RIBBON}${FLOWER}${SPARKLE}${BUNNY}${SPARKLE}${BUTTERFLY}${RESET}"
    echo -e "${SOFT_PINK}${BOLD}─────────────────────────────────────────────────────${RESET}\n"
    show_easter_egg
}

# 主菜单
main_menu() {
    while true; do
        logo_rainbow
        echo -e "${PASTEL_PURPLE}${BOLD}     1.${RESET} ${PINK}启动终端版${RESET}       ${HEART}${STAR}   ${PASTEL_BLUE}${BOLD}2.${RESET} 检查更新 ${SPARKLE}${FLOWER}${RESET} "
        echo -e "${PASTEL_PURPLE}${BOLD}     3.${RESET} ${CYAN}切换皮肤${RESET}           ${MUSIC}${RIBBON}   ${PASTEL_BLUE}${BOLD}4.${RESET} 卸载 ${WING}${HEART}${RESET} "
        echo -e "${PASTEL_PURPLE}${BOLD}     5.${RESET} ${RED}退出少女计算器${RESET}     ${CAT}${RESET}\n"
        echo -e "${YELLOW}${BOLD}═════════════════════════════════════════════════════${RESET}"

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
                change_skin
                ;;
            4)
                echo -e "${PASTEL_PURPLE}${BOLD}${WING}${HEART} 真舍不得……少女为你完成卸载啦${RESET}"
                rm -rf "$HOME/python"
                sed -i '/少女计算器/d' "$HOME/.bashrc"
                rm -f "$CONFIG_FILE"
                echo -e "${YELLOW}${BUBBLE} 卸载好啦，下次再见要记得我哟！${RESET}"
                exit
                ;;
            5)
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

# 切换皮肤函数
change_skin() {
    echo -e "\n${PINK}${BOLD}可选少女皮肤：${RESET}"
    echo -e "${PASTEL_PURPLE} 1.${RESET} 粉萌系（pink）"
    echo -e "${PASTEL_PURPLE} 2.${RESET} 魔法夜空（dark）"
    read -p "$(echo -e ${BUBBLE} 输入数字切换皮肤喵~${RESET}) " skin_opt

    case "$skin_opt" in
        1)
            echo "pink" > "$CONFIG_FILE"
            ;;
        2)
            echo "dark" > "$CONFIG_FILE"
            ;;
        *)
            echo -e "${YELLOW}少女没有找到这个皮肤编号哦~${RESET}"
            sleep 1
            return
            ;;
    esac

    echo -e "${SPARKLE}皮肤切换成功~ 少女重新启动加载魔法！${RESET}"
    sleep 1
    exec "$0"
}

# 检查更新函数
upgrade() {
    cd "$HOME/python"
    curl -fsSLO https://raw.githubusercontent.com/Alhkxsj/termux-calculator/main/计算机.py
    curl -fsSLO https://raw.githubusercontent.com/Alhkxsj/termux-calculator/main/版本.txt
    echo -e "${PASTEL_BLUE}${SPARKLE} 升级完成！欢迎再次体验少女的魔法${HEART}${RESET}"
    exit
}

# 启动流程
load_skin
startup_animation
main_menu
