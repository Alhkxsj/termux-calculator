#!/data/data/com.termux/files/usr/bin/bash
# 少女计算器启动脚本（简洁兼容版）
# 作者：啊泠好困想睡觉
# 版本：1.0

CONFIG_FILE="$HOME/.少女计算器配置"
SKIN_NAME="pink"

# 颜色定义
declare -A COLORS

RESET='\033[0m'
BOLD='\033[1m'
TERM_WIDTH=60

# 兼容性好且清新的符号（有限）
HEART="❤"
FLOWER="❀"
STAR="★"
SPARKLE="✨"
RIBBON="🎀"
BUNNY="(｡･ω･｡)"

# 彩蛋语录
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

# 载入皮肤颜色
load_skin() {
    [[ -f "$CONFIG_FILE" ]] && SKIN_NAME=$(cat "$CONFIG_FILE")
    case "$SKIN_NAME" in
        pink)
            COLORS[PINK]='\033[38;5;213m'
            COLORS[SOFT_PINK]='\033[38;5;218m'
            COLORS[BLUE]='\033[38;5;153m'
            COLORS[PURPLE]='\033[38;5;183m'
            COLORS[YELLOW]='\033[38;5;229m'
            ;;
        dark)
            COLORS[PINK]='\033[38;5;60m'
            COLORS[SOFT_PINK]='\033[38;5;105m'
            COLORS[BLUE]='\033[38;5;111m'
            COLORS[PURPLE]='\033[38;5;99m'
            COLORS[YELLOW]='\033[38;5;220m'
            ;;
        *)
            echo -e "\033[1;31m未知皮肤，使用默认粉色系~${RESET}"
            SKIN_NAME="pink"
            load_skin
            ;;
    esac
    COLORS[RED]='\033[1;31m'
    COLORS[CYAN]='\033[1;36m'
    COLORS[WHITE]='\033[1;37m'
}

# 居中输出
center() {
    local text="$1"
    local length=$(echo -e "$text" | wc -m)
    local pad=$(( (TERM_WIDTH - length) / 2 ))
    (( pad < 0 )) && pad=0
    printf "%*s%s%*s\n" $pad "" "$text" $pad ""
}

# 清屏兼清除行
clear_screen() {
    clear
}

# 彩蛋展示
show_easter_egg() {
    local egg=${EGGS[$RANDOM % ${#EGGS[@]}]}
    for i in {1..3}; do
        center "${COLORS[PURPLE]}${BOLD}${SPARKLE} ${egg} ${SPARKLE}${RESET}"
        sleep 0.5
        clear_screen
    done
}

# 启动动画
startup_animation() {
    clear_screen
    local msg="${COLORS[PINK]}${BOLD}少女计算器启动中，请稍候...${RESET}"
    echo
    center "$msg"
    echo
    sleep 1
}

# 显示logo
print_logo() {
    clear_screen
    echo -e "${COLORS[SOFT_PINK]}${BOLD}╔══════════════════════════════════════════╗${RESET}"
    echo -e "${COLORS[SOFT_PINK]}║                                          ║${RESET}"
    echo -e "${COLORS[PINK]}║          少女计算器 - 梦幻启动菜单          ║${RESET}"
    echo -e "${COLORS[SOFT_PINK]}║                                          ║${RESET}"
    echo -e "${COLORS[SOFT_PINK]}╚══════════════════════════════════════════╝${RESET}"
    echo
    center "${COLORS[BLUE]}作者：啊泠好困想睡觉${RESET}"
    echo
}

# 主菜单，注意右侧对齐保证数字列宽度一致
main_menu() {
    while true; do
        print_logo

        echo -e "  ${COLORS[PINK]}1.${RESET} 启动终端版          ${HEART}"
        echo -e "  ${COLORS[BLUE]}2.${RESET} 检查更新            ${STAR}"
        echo -e "  ${COLORS[PURPLE]}3.${RESET} 切换皮肤            ${RIBBON}"
        echo -e "  ${COLORS[CYAN]}4.${RESET} 卸载程序            ${FLOWER}"
        echo -e "  ${COLORS[RED]}5.${RESET} 退出少女计算器      ${BUNNY}"
        echo
        read -p "$(echo -e ${COLORS[PINK]}请选择功能编号（1-5）：${RESET})" opt

        case "$opt" in
            1)
                echo -e "${COLORS[PINK]}启动少女终端版中...${RESET}"
                sleep 0.8
                # 这里调用python脚本
                python "$HOME/python/计算机.py"
                ;;
            2)
                echo -e "${COLORS[BLUE]}检查更新中...${RESET}"
                sleep 1
                upgrade
                ;;
            3)
                change_skin
                ;;
            4)
                echo -e "${COLORS[PURPLE]}开始卸载少女计算器...${RESET}"
                rm -rf "$HOME/python"
                sed -i '/少女计算器/d' "$HOME/.bashrc"
                rm -f "$CONFIG_FILE"
                echo -e "${COLORS[FLOWER]}卸载完成，再见喵~${RESET}"
                exit
                ;;
            5)
                echo -e "${COLORS[RED]}再见喵，欢迎下次光临！${RESET}"
                exit
                ;;
            *)
                echo -e "${COLORS[RED]}无效输入，请输入 1-5 之间的数字${RESET}"
                sleep 1
                ;;
        esac
    done
}

# 升级函数占位
upgrade() {
    echo -e "${COLORS[YELLOW]}少女计算器正在检查 GitHub 更新...${RESET}"
    # 这里写你的升级逻辑
    sleep 1
    echo -e "${COLORS[YELLOW]}当前已是最新版本哦~${RESET}"
    sleep 1
}

# 切换皮肤占位
change_skin() {
    echo -e "${COLORS[CYAN]}选择皮肤：${RESET}"
    echo "  1) 粉色系 (默认)"
    echo "  2) 深色系"
    read -p "请输入编号：" skin_opt
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

# 主入口
main() {
    load_skin
    startup_animation
    show_easter_egg
    main_menu
}

main
