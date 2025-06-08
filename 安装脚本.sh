#!/data/data/com.termux/files/usr/bin/bash

# 少女风配色定义
PINK='\033[1;35m'
SOFT_PINK='\033[38;5;218m'
PASTEL_YELLOW='\033[38;5;229m'
PASTEL_BLUE='\033[38;5;153m'
PASTEL_PURPLE='\033[38;5;183m'
WHITE='\033[1;37m'
BOLD='\033[1m'
UNDERLINE='\033[4m'
RESET='\033[0m'

clear

# 动感欢迎动画
logo_lines=(
"${SOFT_PINK}${BOLD}╔═════════════════════════════════════════════════════╗${RESET}"
"${SOFT_PINK}${BOLD}║                                                     ║${RESET}"
"${SOFT_PINK}${BOLD}║   ${PINK}✿✿ 少女计算器 安装器 启动！ ✿✿   ${SOFT_PINK}║${RESET}"
"${SOFT_PINK}${BOLD}║     ${WHITE}让可爱与效率成为你生活的主旋律~       ${SOFT_PINK}║${RESET}"
"${SOFT_PINK}${BOLD}║                                                     ║${RESET}"
"${SOFT_PINK}${BOLD}╚═════════════════════════════════════════════════════╝${RESET}"
)

echo
for line in "${logo_lines[@]}"; do
    echo -e "$line"
    sleep 0.07
done
echo

# 动态提示
for i in {1..3}; do
    echo -ne "${PASTEL_YELLOW}喵~ 正在为你准备少女计算器，请稍等呀"
    for dot in {1..3}; do
        echo -ne "."
        sleep 0.3
    done
    echo -ne "\r\033[K"
done
echo -e "${PASTEL_YELLOW}准备就绪啦！${RESET}"
sleep 0.7

# 创建安装目录
INSTALL_DIR="$HOME/python"
mkdir -p "$INSTALL_DIR"
echo -e "${PASTEL_BLUE}📂 创建目录 ${INSTALL_DIR}${RESET}"
sleep 0.3

# 下载函数
download_file() {
    local url="$1"
    local dest="$2"
    local desc="$3"
    echo -e "${PASTEL_PURPLE}⬇️  正在下载 ${desc}...${RESET}"
    if curl -fSL# "$url" -o "$dest"; then
        echo -e "${PASTEL_PURPLE}✅ ${desc} 下载成功！${RESET}"
    else
        echo -e "${PINK}❌ ${desc} 下载失败！请检查网络或稍后重试。${RESET}"
        exit 1
    fi
    sleep 0.3
}

# 下载各文件
download_file "https://raw.githubusercontent.com/Alhkxsj/termux-calculator/main/计算机.py" "$INSTALL_DIR/计算机.py" "主程序"
download_file "https://raw.githubusercontent.com/Alhkxsj/termux-calculator/main/启动计算机.sh" "$INSTALL_DIR/启动计算机.sh" "启动脚本"
download_file "https://raw.githubusercontent.com/Alhkxsj/termux-calculator/main/版本.txt" "$INSTALL_DIR/版本.txt" "版本信息"

chmod +x "$INSTALL_DIR/启动计算机.sh"

# 添加别名
ALIAS_CMD="alias 少女计算器='bash $INSTALL_DIR/启动计算机.sh'"
PROFILE_FILE="$HOME/.bashrc"

if ! grep -Fxq "$ALIAS_CMD" "$PROFILE_FILE"; then
    echo "$ALIAS_CMD" >> "$PROFILE_FILE"
    echo -e "${PASTEL_YELLOW}🎀 设置别名成功：输入 ${PINK}少女计算器${PASTEL_YELLOW} 即可启动${RESET}"
else
    echo -e "${PASTEL_YELLOW}🎀 启动别名已存在，无需重复设置${RESET}"
fi

# 立即生效
eval "$ALIAS_CMD"

# 彩蛋提示
echo
echo -e "${PASTEL_BLUE}${BOLD}🎉 少女计算器安装完成！${RESET}"
echo -e "${PASTEL_YELLOW}输入 ${PINK}少女计算器${PASTEL_YELLOW} 就能召唤我啦~${RESET}"
echo -e "${PASTEL_PURPLE}记得每天都要元气满满呦！${PINK}~ฅ●'ω'●ฅ~${RESET}"
echo
echo -e "${SOFT_PINK}${UNDERLINE}友情提示:${RESET} 删除 $INSTALL_DIR 并移除 ~/.bashrc 中的别名即可卸载"
echo -e "${PASTEL_YELLOW}祝你终端时光甜美又高效！🍰✨${RESET}"
echo

# 分割线结尾
for i in {1..3}; do
    echo -e "${SOFT_PINK}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${RESET}"
    sleep 0.1
done
