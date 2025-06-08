#!/data/data/com.termux/files/usr/bin/bash

# 少女计算器启动脚本 ✨
# 作者：啊泠好困想睡觉（附带更多魔法✨）

CONFIG_FILE="$HOME/.少女计算器配置"
SKIN_NAME="pink"

# 定义颜色关联数组（根据皮肤动态设置）
declare -A COLORS

# 少女专属符号表 ✨
HEART="❤" FLOWER="❀" STAR="✩" RIBBON="🎀" SPARKLE="✨"
BUNNY="₍ᐢ •͈ ༝ •͈ ᐢ₎" CAT="ฅ•ω•ฅ" MUSIC="♪" BUBBLE="◦"
WING="꒰ঌ" BUTTERFLY="𓆩✿𓆪" CLOUD="☁" RAINBOW="🌈"

# 彩蛋语录阵列 ✨
EGGS=(
    "🌸 今天也要像花一样可爱地盛开~"
    "✨ 计算一下今天的心动指数是多少~"
    "🎀 用智慧点亮粉色的梦想世界~"
    "ฅ•ω•ฅ 喵～欢迎回来小可爱~"
    "❄ 少女的魔法，是不容低估的哦~"
    "🌈 每一个数字都藏着彩虹的秘密~"
    "☁ 风轻轻，数字跳跃，心也跟着跳动~"
    "🦄 梦幻不仅是颜色，更是勇气和坚持~"
)

# 加载皮肤颜色
load_skin() {
    [[ -f "$CONFIG_FILE" ]] && SKIN_NAME=$(cat "$CONFIG_FILE")
    case "$SKIN_NAME" in
        pink)
            COLORS[PINK]='\033[38;5;213m'
            COLORS[SOFT_PINK]='\033[38;5;218m'
            COLORS[PASTEL_BLUE]='\033[38;5;153m'
            COLORS[PASTEL_PURPLE]='\033[38;5;183m'
            COLORS[YELLOW]='\033[38;5;229m'
            ;;
        dark)
            COLORS[PINK]='\033[38;5;60m'
            COLORS[SOFT_PINK]='\033[38;5;105m'
            COLORS[PASTEL_BLUE]='\033[38;5;111m'
            COLORS[PASTEL_PURPLE]='\033[38;5;99m'
            COLORS[YELLOW]='\033[38;5;220m'
            ;;
        *)
            echo -e "\033[1;31m未知皮肤，使用默认粉萌系~${RESET}"
            SKIN_NAME="pink"
            load_skin
            ;;
    esac
    COLORS[RED]='\033[1;31m'
    COLORS[CYAN]='\033[1;36m'
    COLORS[WHITE]='\033[1;37m'
}

# 公共样式
RESET='\033[0m'
BOLD='\033[1m'
TERM_WIDTH=60

# 居中输出函数
center() {
    local text="$1"
    local length=$(echo -e "$text" | wc -m)
    local pad=$(( (TERM_WIDTH - length) / 2 ))
    (( pad < 0 )) && pad=0
    printf "%*s%s%*s\n" $pad "" "$text" $pad ""
}

# 清除当前行
clear_line() {
    echo -ne "\r\033[K"
}

# 彩蛋显示 ✨
show_easter_egg() {
    local egg=${EGGS[$RANDOM % ${#EGGS[@]}]}
    for i in {1..3}; do
        center "${COLORS[PASTEL_PURPLE]}${BOLD}${SPARKLE} ${egg} ${SPARKLE}${RESET}"
        sleep 0.45
        clear_line
        sleep 0.25
    done
}

# 渐变文本输出（可用于 LOGO）
gradient_print() {
    local text="$1"
    local colors=("${!2}")
    local len=${#text}
    local color_count=${#colors[@]}
    for ((i=0; i<len; i++)); do
        local c="${text:i:1}"
        local color_index=$(( i * color_count / len ))
        echo -ne "${colors[color_index]}$c${RESET}"
    done
    echo
}

# 启动动画
startup_animation() {
    clear
    local frames=5
    local msg="${COLORS[PINK]}${BOLD}少女计算器正在启动"
    for ((i=1; i<=frames; i++)); do
        echo -ne "$msg"
        for ((j=0; j<i; j++)); do echo -ne "${SPARKLE}"; done
        echo -ne "${RESET}\r"
        sleep 0.25
    done
    echo -e "${RAINBOW} 少女魔法启动完成！${RESET}"
    sleep 0.6
}

# LOGO 内容
logo_lines=(
"╭──────────────────────────────────────────────╮"
"│                                              │"
"│   少 女 计 算 器 ✨ 梦 幻 启 动 菜 单 ✨      │"
"│                                              │"
"│   让可爱与智慧闪耀你的小小世界♪             │"
"│                                              │"
"╰──────────────────────────────────────────────╯"
)

# LOGO 输出
print_logo() {
    clear
    local gradient=("${COLORS[SOFT_PINK]}" "${COLORS[PASTEL_BLUE]}" "${COLORS[PASTEL_PURPLE]}" "${COLORS[YELLOW]}")
    for i in "${!logo_lines[@]}"; do
        case $i in
            0|6) echo -e "${COLORS[SOFT_PINK]}${BOLD}${logo_lines[$i]}${RESET}" ;;
            2)   gradient_print "${logo_lines[$i]}" gradient[@] ;;
            4)   echo -e "${COLORS[PASTEL_BLUE]}${BOLD}${logo_lines[$i]}${RESET}" ;;
            *)   echo -e "${COLORS[PINK]}${logo_lines[$i]}${RESET}" ;;
        esac
        sleep 0.07
    done
    center "${COLORS[PASTEL_PURPLE]}${BOLD}${BUTTERFLY}${SPARKLE}${BUNNY}${SPARKLE}${FLOWER}${RIBBON}${COLORS[YELLOW]} 作者：快手：啊泠好困想睡觉 ${RIBBON}${FLOWER}${SPARKLE}${BUNNY}${SPARKLE}${BUTTERFLY}${RESET}"
    echo -e "${COLORS[SOFT_PINK]}${BOLD}──────────────────────────────────────────────${RESET}\n"
}

# 主菜单 ✨
main_menu() {
    while true; do
        print_logo
        echo -e "${COLORS[PASTEL_PURPLE]}${BOLD}  1.${RESET} ${COLORS[PINK]}启动终端版${RESET}     ${HEART}${STAR}   ${COLORS[PASTEL_BLUE]}${BOLD}2.${RESET} 检查更新 ${SPARKLE}${FLOWER}"
        echo -e "${COLORS[PASTEL_PURPLE]}${BOLD}  3.${RESET} ${COLORS[CYAN]}切换皮肤${RESET}         ${MUSIC}${RIBBON}   ${COLORS[PASTEL_BLUE]}${BOLD}4.${RESET} 卸载 ${WING}${HEART}"
        echo -e "${COLORS[PASTEL_PURPLE]}${BOLD}  5.${RESET} ${COLORS[RED]}退出少女计算器${RESET}   ${CAT}\n"
        echo -e "${COLORS[YELLOW]}${BOLD}══════════════════════════════════════════════${RESET}"

        for i in {1..2}; do
            echo -ne "${COLORS[PINK]}${BUBBLE} 请选择少女编号喵~${SPARKLE} ➤ ${RESET}"
            sleep 0.15
            echo -ne "\r                                         \r"
            sleep 0.12
        done

        read -p "$(echo -e ${COLORS[PINK]}${BUBBLE} 请选择少女编号喵~${SPARKLE} ➤ ${RESET})" opt

        case "$opt" in
            1)
                echo -e "${COLORS[PINK]}${BOLD}${SPARKLE} 少女终端版即将闪亮起航！${HEART}${RESET}"
                sleep 0.8
                python "$HOME/python/计算机.py"
                break
                ;;
            2)
                echo -e "${COLORS[PASTEL_BLUE]}${SPARKLE} 少女正在温柔为你检查最新版本哟~${RESET}"
                sleep 0.6
                upgrade
                break
                ;;
            3) change_skin ;;
            4)
                echo -e "${COLORS[PASTEL_PURPLE]}${BOLD}${WING}${HEART} 真舍不得……少女为你完成卸载啦${RESET}"
                rm -rf "$HOME/python"
                sed -i '/少女计算器/d' "$HOME/.bashrc"
                rm -f "$CONFIG_FILE"
                echo -e "${COLORS[YELLOW]}${BUBBLE} 卸载完成，下次再见要记得我哟！${RESET}"
                exit
                ;;
            5)
                echo -e "${COLORS[PINK]}${BOLD}${CAT} 再见喵~ 祝你每天都可爱又心动！${RESET}"
                exit
                ;;
            *) echo -e "${COLORS[YELLOW]}${BUBBLE} 少女没听懂你的选择，再试一次嘛~${RESET}"; sleep 1 ;;
        esac
    done
}

# 皮肤切换
change_skin() {
    echo -e "\n${COLORS[PINK]}${BOLD}可选少女皮肤列表：${RESET}"
    echo -e "${COLORS[PASTEL_PURPLE]} 1.${RESET} 粉萌系（pink）"
    echo -e "${COLORS[PASTEL_PURPLE]} 2.${RESET} 魔法夜空（dark）"
    read -p "$(echo -e ${BUBBLE} 请输入数字选择皮肤喵~${RESET}) " skin_opt
    case "$skin_opt" in
        1) echo "pink" > "$CONFIG_FILE" ;;
        2) echo "dark" > "$CONFIG_FILE" ;;
        *) echo -e "${COLORS[YELLOW]}少女没有找到这个皮肤编号哦~${RESET}"; sleep 1; return ;;
    esac
    echo -e "${SPARKLE}皮肤切换成功！少女马上为你施展魔法✨${RESET}"
    sleep 1
    exec "$0"
}

# 升级函数
upgrade() {
    cd "$HOME/python" || { echo "未找到程序目录，无法升级"; return; }
    echo -e "${COLORS[PASTEL_BLUE]}${SPARKLE} 正在下载最新版本，请稍候...${RESET}"
    curl -fsSLO https://raw.githubusercontent.com/Alhkxsj/termux-calculator/main/计算机.py
    curl -fsSLO https://raw.githubusercontent.com/Alhkxsj/termux-calculator/main/版本.txt
    echo -e "${COLORS[PASTEL_BLUE]}${SPARKLE} 升级完成！欢迎再次体验少女的魔法${HEART}${RESET}"
    exit
}

# 启动流程 ✨
load_skin
startup_animation
show_easter_egg
main_menu
