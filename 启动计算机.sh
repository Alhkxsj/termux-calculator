#!/data/data/com.termux/files/usr/bin/bash

版本号="1.1.0"
远程版本地址="https://raw.githubusercontent.com/Alhkxsj/termux-calculator/main/版本.txt"
更新脚本地址="https://raw.githubusercontent.com/Alhkxsj/termux-calculator/main/安装脚本.sh"

# 彩色定义
粉红="\033[1;35m"
紫="\033[1;34m"
绿="\033[1;32m"
黄="\033[1;33m"
重置="\033[0m"

clear
echo -e "${粉红}💖 欢迎使用少女计算器 ～ 启动中 💖${重置}"
echo

# 自动检测版本
echo -e "${紫}🔍 正在检查更新中...${重置}"
最新版本=$(curl -fsSL "$远程版本地址" | tr -d '\r')

if [ "$最新版本" != "$版本号" ]; then
    echo -e "${黄}🌸 检测到新版本：v$最新版本（当前版本：v$版本号）${重置}"
    echo -ne "${绿}是否立即升级？(y/n)：${重置}"
    read -r 是否升级
    if [[ "$是否升级" == "y" || "$是否升级" == "Y" ]]; then
        echo -e "${紫}✨ 正在下载最新版少女计算器...${重置}"
        bash <(curl -fsSL "$更新脚本地址")
        exit
    fi
else
    echo -e "${绿}✅ 已是最新版本！少女计算器 v$版本号${重置}"
fi

# 菜单显示
while true; do
    clear
    echo -e "${粉红}╭────────────────────────────╮${重置}"
    echo -e "${粉红}│       🌸 少女计算器启动菜单 🌸       │${重置}"
    echo -e "${粉红}╰────────────────────────────╯${重置}"
    echo
    echo -e "${绿}当前版本：v$版本号   📅 更新日期：自动检测${重置}"
    echo -e "${黄}👩‍💻 作者：@泠好困想睡觉（快手）${重置}"
    echo
    echo -e "${紫}请选择启动方式：${重置}"
    echo -e "${黄}1.${重置} 💻 启动终端计算器"
    echo -e "${黄}2.${重置} 🖼 启动图形计算器（请先打开 Termux X11）"
    echo -e "${黄}3.${重置} 🔄 手动检查更新"
    echo -e "${黄}4.${重置} ❌ 退出少女计算器"
    echo
    echo -ne "${粉红}输入选项编号（1-4）：${重置}"
    read -r 选项

    case $选项 in
        1)
            clear
            python ~/python/计算机.py
            ;;
        2)
            clear
            python ~/python/计算机图形版.py
            ;;
        3)
            echo -e "${紫}🌸 手动检查更新中...${重置}"
            最新版本=$(curl -fsSL "$远程版本地址" | tr -d '\r')
            if [ "$最新版本" != "$版本号" ]; then
                echo -e "${黄}发现新版本 v$最新版本，当前版本 v$版本号${重置}"
                echo -ne "${绿}是否立即升级？(y/n)：${重置}"
                read -r 是否升级
                if [[ "$是否升级" == "y" || "$是否升级" == "Y" ]]; then
                    bash <(curl -fsSL "$更新脚本地址")
                    exit
                fi
            else
                echo -e "${绿}你已经是最新版啦～ v$版本号${重置}"
                sleep 2
            fi
            ;;
        4)
            echo -e "${粉红}🌸 再见喵～ 有缘再见少女计算器 💕${重置}"
            exit
            ;;
        *)
            echo -e "${黄}无效的输入，请重新选择～${重置}"
            sleep 1.5
            ;;
    esac
done
