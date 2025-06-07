
#!/data/data/com.termux/files/usr/bin/bash
clear
echo -e "\033[1;35m欢迎使用计算机\033[0m"
echo
echo "请选择启动模式："
echo "1) 终端版"
echo "2) 图形版（请先打开Termux-X11）"
echo "3) 退出"
read -p "请输入数字[1-3]：" 选项

case $选项 in
  1)
    python ~/python/计算机.py
    ;;
  2)
    echo
    echo "请先启动 Termux-X11，然后按回车继续..."
    read -p ""
    DISPLAY=:1 python ~/python/计算机图形版.py
    ;;
  3)
    echo "已退出"
    exit 0
    ;;
  *)
    echo "输入无效"
    ;;
esac
