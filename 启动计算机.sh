#!/data/data/com.termux/files/usr/bin/bash

PINK='\033[1;35m'
WHITE='\033[1;37m'
BLUE='\033[1;34m'
GREEN='\033[1;32m'
YELLOW='\033[1;33m'
RESET='\033[0m'

AUTHOR_NAME="快手：泠好困想睡觉"
VERSION_FILE="$HOME/python/版本.txt"
REMOTE_VERSION_URL="https://raw.githubusercontent.com/Alhkxsj/termux-calculator/main/版本.txt"
UPDATE_SCRIPT_URL="https://raw.githubusercontent.com/Alhkxsj/termux-calculator/main/安装脚本.sh"

# 读取本地版本
if [ -f "$VERSION_FILE" ]; then
    CURRENT_VERSION=$(head -n1 "$VERSION_FILE" | tr -d '\r\n')
else
    CURRENT_VERSION="未知"
fi

# 读取远程版本
REMOTE_VERSION=$(curl -fsSL "$REMOTE_VERSION_URL" 2>/dev/null | head -n1 | tr -d '\r\n')
if [ -z "$REMOTE_VERSION" ]; then
    REMOTE_VERSION="未知"
fi

clear
echo -e "${PINK}╭────────────────────────────────────╮${RESET}"
echo -e "${PINK}│        🌸 少女计算器启动菜单 🌸     │${RESET}"
echo -e "${PINK}╰────────────────────────────────────╯${RESET}"
echo -e "${WHITE}作者：${GREEN}${AUTHOR_NAME}${RESET}"
echo -e "${WHITE}本地版本：${GREEN}${CURRENT_VERSION}${RESET}"
echo -e "${WHITE}远程版本：${GREEN}${REMOTE_VERSION}${RESET}"

# 自动检测更新
if [ "$REMOTE_VERSION" != "未知" ] && [ "$CURRENT_VERSION" != "$REMOTE_VERSION" ]; then
    echo -e "${YELLOW}检测到新版本，请选择是否升级：（y/n）${RESET}"
    read -p "➤ 请输入 y 或 n：" choice
    if [[ "$choice" =~ ^[Yy]$ ]]; then
        echo -e "${BLUE}正在更新程序…${RESET}"
        bash <(curl -fsSL "$UPDATE_SCRIPT_URL")
        exit 0
    fi
else
    echo -e "${GREEN}目前已是最新版本，无需升级！${RESET}"
fi

echo
echo -e "${PINK}请选择启动模式：${RESET}"
echo -e " 1️⃣  终端计算器"
echo -e " 2️⃣  图形计算器（需开启 Termux-X11）"
echo -e " 3️⃣  检查更新"
echo -e " 0️⃣  退出"
echo
read -p "➤ 请输入选项 (0-3)：" mode

case "$mode" in
    1)
        clear
        python ~/python/计算机.py
        ;;
    2)
        echo -e "${YELLOW}请确保已打开 Termux-X11，再按回车继续…${RESET}"
        read
        python ~/python/计算机图形版.py
        ;;
    3)
        echo -e "${BLUE}正在手动检查更新…${RESET}"
        sleep 1
        bash "$0"
        ;;
    0)
        echo -e "${PINK}再见～希望你的少女时光每天都甜蜜💖${RESET}"
        exit 0
        ;;
    *)
        echo -e "${YELLOW}无效输入，请重新启动运行…${RESET}"
        ;;
esac
