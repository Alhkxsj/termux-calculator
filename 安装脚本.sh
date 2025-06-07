#!/data/data/com.termux/files/usr/bin/bash

echo -e "\e[1;35m🌸 欢迎使用少女计算器安装器 ～ By 刘婧仪男友专属版🌸\e[0m\n"

# 设置安装路径
INSTALL_DIR="$HOME/python"

# 创建目录
echo -e "🛠 正在准备安装目录：$INSTALL_DIR..."
mkdir -p "$INSTALL_DIR"
cd "$INSTALL_DIR" || exit 1

# 下载最新文件
echo -e "📦 正在从 GitHub 获取最新版少女计算器程序...\n"
curl -LO https://raw.githubusercontent.com/Alhkxsj/termux-calculator/main/计算机.py
curl -LO https://raw.githubusercontent.com/Alhkxsj/termux-calculator/main/计算机图形版.py
curl -LO https://raw.githubusercontent.com/Alhkxsj/termux-calculator/main/启动计算机.sh

# 给启动器脚本加执行权限
chmod +x 启动计算机.sh

# 检查 .bashrc 是否已经设置了别名
if grep -q "alias 少女计算器=" "$HOME/.bashrc"; then
    echo -e "✅ 已设置过启动命令：少女计算器，无需重复设置～"
else
    echo -e "\n🔧 正在添加命令别名：少女计算器 到 ~/.bashrc..."
    echo "alias 少女计算器='bash \$HOME/python/启动计算机.sh'" >> "$HOME/.bashrc"
    echo -e "✅ 别名添加完成！重启 Termux 或输入：\e[1;33msource ~/.bashrc\e[0m 立即生效～"
fi

# 少女风提示结束
echo -e "\n\e[1;35m🌸 安装成功！你现在只需要输入：\e[1;32m少女计算器\e[1;35m 即可启动可爱的计算器啦！\e[0m"
echo -e "💖 愿你和刘婧仪永远幸福，像代码一样不出 Bug！\n"
