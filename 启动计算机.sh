#!/data/data/com.termux/files/usr/bin/bash

clear
echo -e "\e[1;35m╭────────────────────────────╮"
echo -e "│ 🌸 欢迎使用 少女计算器 启动器 🌸 │"
echo -e "╰────────────────────────────╯\e[0m"

echo -e "\e[1;36m由 快手：啊泠好困想睡觉 制作 💖\e[0m"
echo

echo -e "\e[1;33m请选择启动模式：\e[0m"
echo -e " 1. 终端版计算器"
echo -e " 2. 图形版计算器 (请先打开 Termux X11)"
echo -e " 0. 退出"
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
        echo -e "\n\e[1;32m已退出。祝你和刘婧仪永远甜蜜～🌸\e[0m"
        ;;
    *)
        echo -e "\e[1;31m无效选项，请重新运行少女计算器。\e[0m"
        ;;
esac
