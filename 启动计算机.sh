#!/data/data/com.termux/files/usr/bin/bash

WORKDIR="$HOME/python"
LOCAL_VERSION_FILE="$WORKDIR/版本.txt"
REMOTE_VERSION_URL="https://raw.githubusercontent.com/Alhkxsj/termux-calculator/main/版本.txt"

TERM_WIDTH=60

EGGS=(
"今天也要加油计算鸭~"
"来计算一下今天的幸运值吧！"
"数字的世界很精彩~"
"欢迎回来！"
"阿泠计算器来啦~"
"每一个数字都有意义~"
"开始计算吧！"
"保持热爱，继续前进！"
)

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
        center " $egg "
        sleep 0.5
        clear_screen
    done
}

startup_animation() {
    clear_screen
    local msg="阿泠计算器启动中..."
    center "$msg"
    sleep 1
}

print_logo() {
    clear_screen
    echo "╔════════════════════════════════════════════════════╗"
    echo "║                                                    ║"
    echo "║        阿泠计算器 - 主菜单                         ║"
    echo "║                                                    ║"
    echo "╚════════════════════════════════════════════════════╝"
    echo "作者：快手:啊泠好困想睡觉"
    echo
}

main_menu() {
    while true; do
        print_logo
        echo "  1. 启动计算器"
        echo "  2. 检查更新"
        echo "  3. 退出"
        echo
        echo -n "请选择功能编号（1-3）："
        read opt
        case "$opt" in
            1)
                echo "启动中..."
                sleep 0.8
                cd "$WORKDIR"
                command -v python3 >/dev/null && python3 计算机.py || python 计算机.py
                ;;
            2)
                upgrade
                ;;
            3)
                echo "再见！"
                exit
                ;;
            *)
                echo "无效输入，请输入 1-3 之间的数字"
                sleep 1
                ;;
        esac
    done
}

upgrade() {
    echo "检查更新中..."
    sleep 1
    local remote_version=$(curl -s "$REMOTE_VERSION_URL" 2>/dev/null)
    local local_version="未知"
    [[ -f "$LOCAL_VERSION_FILE" ]] && local_version=$(cat "$LOCAL_VERSION_FILE")

    if [[ -z "$remote_version" ]]; then
        echo "无法连接到 GitHub，请检查网络"
        sleep 2
        return
    fi

    echo "当前版本：$local_version"
    echo "最新版本：$remote_version"

    if [[ "$remote_version" != "$local_version" ]]; then
        echo -n "发现新版本，是否更新？(y/n)："
        read confirm
        if [[ "$confirm" == "y" ]]; then
            echo "下载中..."
            cd "$WORKDIR"
            if curl -f -O -L "https://raw.githubusercontent.com/Alhkxsj/termux-calculator/main/启动计算机.sh" 2>/dev/null && \
               curl -f -O -L "https://raw.githubusercontent.com/Alhkxsj/termux-calculator/main/计算机.py" 2>/dev/null && \
               curl -f -O -L "https://raw.githubusercontent.com/Alhkxsj/termux-calculator/main/版本.txt" 2>/dev/null; then
                echo "更新完成，请重新运行"
                exit
            else
                echo "下载失败，请稍后再试"
            fi
        else
            echo "已取消更新"
        fi
    else
        echo "当前已是最新版本"
    fi
    sleep 1
}

main() {
    startup_animation
    show_easter_egg
    main_menu
}

main