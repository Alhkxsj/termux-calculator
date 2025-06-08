# 少女计算器启动脚本
# 作者：快手啊泠好困想睡觉
# 版本：1.1 (Termux优化版)

CONFIG_FILE="$HOME/.少女计算器配置"
SKIN_NAME="pink"
REMOTE_VERSION_URL="https://raw.githubusercontent.com/Alhkxsj/termux-calculator/main/版本.txt"
LOCAL_VERSION_FILE="$HOME/版本.txt"

declare -A COLORS
RESET="\033[0m"
BOLD="\033[1m"
TERM_WIDTH=60

# 使用兼容性符号
HEART="<3"
FLOWER="*"
STAR="+"
SPARKLE="."
RIBBON="~"
BUNNY="(^_^)"

EGGS=(
"今天也要像花一样可爱地盛开~"
"计算一下今天的心动指数是多少~"
"用智慧点亮粉色的梦想世界~"
"欢迎回来小可爱~"
"少女的魔法，是不容低估的哦~"
"每一个数字都藏着彩虹的秘密~"
"风轻轻，数字跳跃，心也跟着跳动~"
"梦幻不仅是颜色，更是勇气和坚持~"
)

load_skin() {
    if [[ -f "$CONFIG_FILE" ]]; then
        SKIN_NAME=$(cat "$CONFIG_FILE")
    else
        SKIN_NAME="pink"
    fi
    case "$SKIN_NAME" in
        pink)
            COLORS[PINK]="\033[38;5;213m"
            COLORS[SOFT_PINK]="\033[38;5;218m"
            COLORS[BLUE]="\033[38;5;153m"
            COLORS[PURPLE]="\033[38;5;183m"
            COLORS[YELLOW]="\033[38;5;229m"
        ;;
        dark)
            COLORS[PINK]="\033[38;5;60m"
            COLORS[SOFT_PINK]="\033[38;5;105m"
            COLORS[BLUE]="\033[38;5;111m"
            COLORS[PURPLE]="\033[38;5;99m"
            COLORS[YELLOW]="\033[38;5;220m"
        ;;
        *)
            echo -e "\033[1;31m未知皮肤，使用默认粉色系~${RESET}"
            SKIN_NAME="pink"
        ;;
    esac
    COLORS[RED]="\033[1;31m"
    COLORS[CYAN]="\033[1;36m"
    COLORS[WHITE]="\033[1;37m"
}

center() {
    local text="$1"
    local length=${#text}
    local pad=$(( (TERM_WIDTH - length) / 2 ))
    (( pad < 0 )) && pad=0
    printf "%*s%s%*s\n" $pad "" "$text" $pad ""
}

clear_screen() {
    clear
}

show_easter_egg() {
    local egg=${EGGS[$RANDOM % ${#EGGS[@]}]}
    for i in {1..3}; do
        center "${COLORS[PURPLE]}${BOLD}${SPARKLE} ${egg} ${SPARKLE}${RESET}"
        sleep 0.5
        clear_screen
    done
}

startup_animation() {
    clear_screen
    local msg="${COLORS[PINK]}${BOLD}少女计算器启动中，请稍候...${RESET}"
    center "$msg"
    sleep 1
}

print_logo() {
    clear_screen
    echo -e "${COLORS[SOFT_PINK]}${BOLD}============================================${RESET}"
    echo -e "${COLORS[SOFT_PINK]}${BOLD}                                          ${RESET}"
    echo -e "${COLORS[PINK]}${BOLD}        少女计算器 - 梦幻启动菜单         ${RESET}"
    echo -e "${COLORS[SOFT_PINK]}${BOLD}                                          ${RESET}"
    echo -e "${COLORS[SOFT_PINK]}${BOLD}============================================${RESET}"
    echo -e "${COLORS[BLUE]}作者：快手啊泠好困想睡觉${RESET}"
    echo
}

main_menu() {
    while true; do
        print_logo
        echo -e " ${COLORS[PINK]}1.${RESET} 启动终端版 ${HEART}"
        echo -e " ${COLORS[BLUE]}2.${RESET} 检查更新 ${STAR}"
        echo -e " ${COLORS[PURPLE]}3.${RESET} 切换皮肤 ${RIBBON}"
        echo -e " ${COLORS[RED]}4.${RESET} 退出少女计算器 ${BUNNY}"
        echo
        echo -ne "${COLORS[PINK]}请选择功能编号（1-4）：${RESET}"
        read opt
        case "$opt" in
            1)
                echo -e "${COLORS[PINK]}启动少女终端版中...${RESET}"
                sleep 0.8
                python "$HOME/计算机.py"
                ;;
            2)
                upgrade
                ;;
            3)
                change_skin
                ;;
            4)
                echo -e "${COLORS[RED]}再见喵，欢迎下次光临！${RESET}"
                exit
                ;;
            *)
                echo -e "${COLORS[RED]}无效输入，请输入 1-4 之间的数字${RESET}"
                sleep 1
                ;;
        esac
    done
}

upgrade() {
    echo -e "${COLORS[YELLOW]}少女计算器正在检查 GitHub 更新...${RESET}"
    sleep 1
    local remote_version=$(curl -s "$REMOTE_VERSION_URL")
    local local_version="未知"
    [[ -f "$LOCAL_VERSION_FILE" ]] && local_version=$(cat "$LOCAL_VERSION_FILE")

    echo -e "${COLORS[WHITE]}当前版本：$local_version${RESET}"
    echo -e "${COLORS[WHITE]}最新版本：$remote_version${RESET}"

    if [[ "$remote_version" != "$local_version" ]]; then
        echo -ne "${COLORS[PINK]}发现新版本，是否更新？(y/n)：${RESET}"
        read confirm
        if [[ "$confirm" == "y" ]]; then
            echo -e "${COLORS[CYAN]}正在下载最新版本...${RESET}"
            cd $HOME
            curl -O -L "https://raw.githubusercontent.com/Alhkxsj/termux-calculator/main/启动计算机.sh"
            curl -O -L "https://raw.githubusercontent.com/Alhkxsj/termux-calculator/main/计算机.py"
            curl -O -L "https://raw.githubusercontent.com/Alhkxsj/termux-calculator/main/版本.txt"
            echo -e "${COLORS[SOFT_PINK]}更新完成，请重新运行少女计算器~${RESET}"
            exit
        else
            echo -e "${COLORS[YELLOW]}已取消更新${RESET}"
        fi
    else
        echo -e "${COLORS[GREEN]}当前已是最新版本哦~${RESET}"
    fi
    sleep 1
}

change_skin() {
    echo -e "${COLORS[CYAN]}选择皮肤：${RESET}"
    echo " 1) 粉色系 (默认)"
    echo " 2) 深色系"
    echo -ne "请输入编号："
    read skin_opt
    case "$skin_opt" in
        1)
            echo "pink" > "$CONFIG_FILE"
            echo -e "${COLORS[PINK]}已切换至粉色系${RESET}"
            ;;
        2)
            echo "dark" > "$CONFIG_FILE"
            echo -e "${COLORS[CYAN]}已切换至深色系${RESET}"
            ;;
        *)
            echo -e "${COLORS[RED]}无效选项，保持当前皮肤${RESET}"
            ;;
    esac
    sleep 1
    load_skin
}

main() {
    load_skin
    startup_animation
    show_easter_egg
    main_menu
}

main
