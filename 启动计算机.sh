#!/data/data/com.termux/files/usr/bin/bash
clear
echo -e "\033[95m🎀 少女风计算机启动 🎀\033[0m"
echo
echo "请选择模式："
echo "1️⃣  终端版"
echo "2️⃣  图形版（请先打开 Termux-X11）"
echo "3️⃣  退出"
read -p "请输入 [1-3]：" num
case $num in
  1) python ~/python/计算机.py ;;
  2)
    echo "请先打开 Termux-X11，再回车继续"
    read
    DISPLAY=:1 python ~/python/计算机图形版.py ;;
  *) echo "已退出"; exit ;;
esac
