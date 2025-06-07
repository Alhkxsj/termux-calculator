#!/data/data/com.termux/files/usr/bin/bash
set -e
echo -e "\033[1;36m少女风计算机安装中…\033[0m"
pkg update -y
pkg install -y python tk x11-repo
mkdir -p ~/python && cd ~/python
curl -LO https://raw.githubusercontent.com/Alhkxsj/termux-calculator/main/计算机.py
curl -LO https://raw.githubusercontent.com/Alhkxsj/termux-calculator/main/计算机图形版.py
curl -LO https://raw.githubusercontent.com/Alhkxsj/termux-calculator/main/启动计算机.sh
chmod +x 启动计算机.sh
echo -e "\n\033[1;32m安装完成！\033[0m"
echo "▶️ 输入命令启动：bash ~/python/启动计算机.sh"
