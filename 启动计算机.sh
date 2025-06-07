#!/data/data/com.termux/files/usr/bin/bash

# ====== 色彩定义 ======
PINK='\033[1;35m'
WHITE='\033[1;37m'
BLUE='\033[1;34m'
GREEN='\033[1;32m'
RESET='\033[0m'

# ====== 作者信息 ======
AUTHOR_NAME="快手：泠好困想睡觉"
REPO_URL="https://github.com/Alhkxsj/termux-calculator"
VERSION_FILE="$HOME/python/版本.txt"
REMOTE_VERSION_URL="https://raw.githubusercontent.com/Alhkxsj/termux-calculator/main/版本.txt"

# ====== 获取当前本地版本 ======
CURRENT_VERSION=$(cat "$VERSION_FILE" 2>/dev/null || echo "未知")

# ====== 获取远程版本 ======
REMOTE_VERSION=$(curl -fsSL "$REMOTE_VERSION_URL" 2>/dev/null || echo "未知")

clear
echo -e "${PINK}╭────────────────────────────────────╮${RESET}"
echo -e "${PINK}│        🌸 少女计算器启动菜单 🌸     │${RESET}"
echo -e "${PINK}╰────────────────────────────────────╯${RESET}"
echo -e "${WHITE}作者：${GREEN}${AUTHOR_NAME}${RESET}"
echo -e "${WHITE}当前版本：${GREEN}${CURRENT_VERSION}${RESET}"

# 检查是否需要更新
if [ "$CURRENT_VERSION" != "$REMOTE_VERSION" ] && [ "$REMOTE_VERSION" != "未知" ]; then
    echo -e "${YELLOW}检测到新版本：$REMOTE_VERSION，是否升级？（y/n）${RESET}"
    read -p "➤ 请输入选择：" choice
    if [ "$choice" = "y" ] || [ "$choice" = "Y" ]; then
        echo -e "${BLUE}正在更新，请稍候...${RESET}"
        curl -fsSL https://raw.githubusercontent.com/Alhkxsj/termux-calculator/main/安装脚本.sh | bash
        exit
    fi
fi

# 启动菜单
echo
echo -e "${PINK}请选择启动模式：${RESET}"
echo -e " 1. 🌸 启动终端版计算器"
echo -e " 2. 🖼  启动图形版计算器（需开启 Termux:X11）"
echo -e " 0. ❌ 退出"
echo
read -p "➤ 请输入序号：" mode

case "$mode" in
    1)
        clear
        python ~/python/计算机.py
        ;;
    2)
        echo -e "${YELLOW}请先确保已打开 Termux:X11 应用，否则可能黑屏或无响应哦~${RESET}"
        sleep 2
        python ~/python/计算机图形版.py
        ;;
    0)
        echo -e "${BLUE}感谢使用，再见啦喵~${RESET}"
        exit
        ;;
    *)
        echo -e "${RED}无效选项，请重新运行少女计算器~${RESET}"
        ;;
esac
