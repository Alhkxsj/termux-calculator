#!/data/data/com.termux/files/usr/bin/bash

echo -e "\033[1;35m🌸 欢迎使用 少女计算器 安装器 🌸\033[0m"
echo "正在安装，请稍等…"

mkdir -p ~/python

# 下载主文件
curl -fsSL https://raw.githubusercontent.com/Alhkxsj/termux-calculator/main/计算机.py -o ~/python/计算机.py
curl -fsSL https://raw.githubusercontent.com/Alhkxsj/termux-calculator/main/计算机图形版.py -o ~/python/计算机图形版.py
curl -fsSL https://raw.githubusercontent.com/Alhkxsj/termux-calculator/main/启动计算机.sh -o ~/python/启动计算机.sh
curl -fsSL https://raw.githubusercontent.com/Alhkxsj/termux-calculator/main/版本.txt -o ~/python/版本.txt

chmod +x ~/python/启动计算机.sh

# 添加别名
ALIAS_CMD="alias 少女计算器='bash ~/python/启动计算机.sh'"
PROFILE_FILE="$HOME/.bashrc"
if ! grep -Fxq "$ALIAS_CMD" "$PROFILE_FILE"; then
  echo "$ALIAS_CMD" >> "$PROFILE_FILE"
fi

# 立即生效
eval "$ALIAS_CMD"

echo
echo -e "\033[1;32m🎉 安装完成！现在你可以输入：少女计算器 来启动程序啦！\033[0m"
