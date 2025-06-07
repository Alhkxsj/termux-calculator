#!/data/data/com.termux/files/usr/bin/bash

# 配置变量
版本文件="$HOME/python/版本.txt"
远程版本地址="https://raw.githubusercontent.com/Alhkxsj/termux-calculator/main/版本.txt"

# 颜色代码
粉红='\033[95m'
重置='\033[0m'

检测更新() {
    if [ ! -f "$版本文件" ]; then
        echo "v0.0" > "$版本文件"
    fi

    当前版本=$(cat "$版本文件")
    最新版本=$(curl -fsSL "$远程版本地址" 2>/dev/null)

    if [ "$当前版本" != "$最新版本" ] && [ -n "$最新版本" ]; then
        echo
        echo -e "${粉红}╭────────────────────────────────────╮${重置}"
        echo -e "${粉红}│        🌸 少女计算器启动菜单 🌸     │${重置}"
        echo -e "${粉红}╰────────────────────────────────────╯${重置}"
        echo -e "作者：快手：泠好困想睡觉"
        echo -e "当前版本：$当前版本"
        echo -e "检测到新版本：$最新版本"
        echo -e -n "是否升级？（y/n）➤ "
        read 是否升级
        if [ "$是否升级" = "y" ]; then
            升级程序
        fi
    fi
}

升级程序() {
    echo -e "\n${粉红}正在升级少女计算器，请稍候...${重置}"
    cd "$HOME/python"
    curl -fsSLO https://raw.githubusercontent.com/Alhkxsj/termux-calculator/main/计算机.py
    curl -fsSLO https://raw.githubusercontent.com/Alhkxsj/termux-calculator/main/计算机图形版.py
    curl -fsSLO https://raw.githubusercontent.com/Alhkxsj/termux-calculator/main/版本.txt
    echo -e "${粉红}升级完成！请重新启动程序。${重置}"
    exit
}

主菜单() {
    clear
    echo -e "${粉红}╭────────────────────────────────────╮${重置}"
    echo -e "${粉红}│        🌸 少女计算器启动菜单 🌸     │${重置}"
    echo -e "${粉红}╰────────────────────────────────────╯${重置}"
    echo "作者：快手：泠好困想睡觉"
    echo
    echo "1. 启动终端版"
    echo "2. 启动图形版（请提前打开 Termux-X11）"
    echo "3. 检查更新"
    echo "4. 卸载少女计算器"
    echo "5. 退出"
    echo -e "${粉红}════════════════════════════════════${重置}"
    read -p "请输入选项 ➤ " 选项

    case "$选项" in
        1) python "$HOME/python/计算机.py" ;;
        2) python "$HOME/python/计算机图形版.py" ;;
        3) 升级程序 ;;
        4)
            echo -e "${粉红}正在卸载少女计算器...${重置}"
            rm -rf "$HOME/python"
            sed -i '/少女计算器/d' "$HOME/.bashrc"
            echo -e "${粉红}卸载完成，请重启 Termux！${重置}"
            exit ;;
        5) echo "再见喵~" ; exit ;;
        *) echo "无效输入，请重新选择~" ; sleep 1 ; 主菜单 ;;
    esac
}

# 执行启动流程
检测更新
主菜单
