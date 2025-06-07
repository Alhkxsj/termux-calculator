#!/data/data/com.termux/files/usr/bin/bash

版本号="v1.0"
更新日期="2025-06-07"
作者="快手：啊泠好困想睡觉"
远程版本链接="https://raw.githubusercontent.com/Alhkxsj/termux-calculator/main/版本.txt"

clear
echo -e "\e[1;35m╭────────────────────────────────────╮"
echo -e "│       🌸 欢迎使用 少女计算器 启动器 🌸      │"
echo -e "╰────────────────────────────────────╯\e[0m"

# 🔍 自动检测更新
最新版本=$(curl -fsSL "$远程版本链接" 2>/dev/null)

if [ -n "$最新版本" ] && [ "$最新版本" != "$版本号" ]; then
    echo -e "\n\e[1;33m🆕 发现新版本：$最新版本（当前版本：$版本号）\e[0m"
    echo -e "\e[1;36m🌸 输入：少女计算器 --更新 来升级最新版~\e[0m\n"
fi

# 显示信息
echo -e "\e[1;36m📌 当前版本：$版本号   📅 更新：$更新日期   👩‍💻 作者：$作者\e[0m\n"

# 处理更新指令
if [[ "$1" == "--更新" ]]; then
    echo -e "\n🚀 正在为你升级少女计算器...\n"
    bash <(curl -fsSL https://raw.githubusercontent.com/Alhkxsj/termux-calculator/main/安装脚本.sh)
    exit 0
fi

# 主菜单
echo -e "\e[1;35m🔸 请选择启动模式：\e[0m"
echo -e " 1. ✨ 终端版计算器"
echo -e " 2. 🖼 图形版计算器 (请先打开 Termux X11)"
echo -e " 0. ❌ 退出"
echo

read -p "输入数字选择操作：" choice

case "$choice" in
    1)
        clear
        python3 ~/python/计算机.py
        ;;
    2)
        clear
        python3 ~/python/计算机图形版.py
        ;;
    0)
        echo -e "\n\e[1;32m已退出，祝你与刘婧仪一起拥有少女般的浪漫生活～✨\e[0m"
        ;;
    *)
        echo -e "\e[1;31m无效选项，请重新输入。\e[0m"
        ;;
esac
