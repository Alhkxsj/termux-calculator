#!/data/data/com.termux/files/usr/bin/bash

# 配置变量
VERSION_FILE="$HOME/python/版本.txt"
REMOTE_VERSION_URL="https://raw.githubusercontent.com/Alhkxsj/termux-calculator/main/版本.txt"

# 颜色代码（ASCII 变量名！）
PINK='\033[95m'
RESET='\033[0m'

check_update() {
    [ ! -f "$VERSION_FILE" ] && echo "v0.0" > "$VERSION_FILE"

    current_version=$(< "$VERSION_FILE")
    latest_version=$(curl -fsSL "$REMOTE_VERSION_URL" 2>/dev/null)

    if [[ -n "$latest_version" && "$current_version" != "$latest_version" ]]; then
        echo
        echo -e "${PINK}╭────────────────────────────────────╮${RESET}"
        echo -e "${PINK}│        🌸 少女计算器启动菜单 🌸     │${RESET}"
        echo -e "${PINK}╰────────────────────────────────────╯${RESET}"
        echo -e "作者：快手：泠好困想睡觉"
        echo -e "当前版本：$current_version"
        echo -e "检测到新版本：$latest_version"
        read -p "是否升级？（y/n）➤ " answer
        [[ "$answer" == "y" ]] && upgrade
    fi
}

upgrade() {
    echo -e "\n${PINK}正在升级少女计算器，请稍候...${RESET}"
    cd "$HOME/python"
    curl -fsSLO https://raw.githubusercontent.com/Alhkxsj/termux-calculator/main/计算机.py
    curl -fsSLO https://raw.githubusercontent.com/Alhkxsj/termux-calculator/main/计算机图形版.py
    curl -fsSLO https://raw.githubusercontent.com/Alhkxsj/termux-calculator/main/版本.txt
    echo -e "${PINK}升级完成！请重新启动程序。${RESET}"
    exit
}

main_menu() {
    clear
    echo -e "${PINK}╭────────────────────────────────────╮${RESET}"
    echo -e "${PINK}│        🌸 少女计算器启动菜单 🌸     │${RESET}"
    echo -e "${PINK}╰────────────────────────────────────╯${RESET}"
    echo "作者：快手：泠好困想睡觉"
    echo
    echo "1. 启动终端版"
    echo "2. 启动图形版（请提前打开 Termux-X11）"
    echo "3. 检查更新"
    echo "4. 卸载少女计算器"
    echo "5. 退出"
    echo -e "${PINK}════════════════════════════════════${RESET}"
    read -p "请输入选项 ➤ " opt

    case "$opt" in
        1) python "$HOME/python/计算机.py" ;;
        2) python "$HOME/python/计算机图形版.py" ;;
        3) upgrade ;;
        4)
            echo -e "${PINK}正在卸载少女计算器...${RESET}"
            rm -rf "$HOME/python"
            sed -i '/少女计算器/d' "$HOME/.bashrc"
            echo -e "${PINK}卸载完成，请重启 Termux！${RESET}"
            exit ;;
        5) echo "再见喵~" ; exit ;;
        *) echo "无效输入，请重新选择~" ; sleep 1 ; main_menu ;;
    esac
}

# 执行启动流程
check_update
main_menu
