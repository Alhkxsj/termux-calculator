#!/data/data/com.termux/files/usr/bin/bash

# 少女配色
PINK='\033[1;35m'
SOFT_PINK='\033[38;5;218m'
PASTEL_YELLOW='\033[38;5;229m'
PASTEL_BLUE='\033[38;5;153m'
PASTEL_PURPLE='\033[38;5;183m'
WHITE='\033[1;37m'
BOLD='\033[1m'
RESET='\033[0m'

clear

# 动感LOGO
logo_lines=(
"${SOFT_PINK}${BOLD}╔════════════════════════════════════════════╗${RESET}"
"${SOFT_PINK}${BOLD}║                                          ║${RESET}"
"${SOFT_PINK}${BOLD}║   ${PINK}✿ 少女计算器 安装器 启动！ ✿   ${SOFT_PINK}║${RESET}"
"${SOFT_PINK}${BOLD}║     ${WHITE}让可爱与效率常伴你身边~    ${SOFT_PINK}║${RESET}"
"${SOFT_PINK}${BOLD}║                                          ║${RESET}"
"${SOFT_PINK}${BOLD}╚════════════════════════════════════════════╝${RESET}"
)
for line in "${logo_lines[@]}"; do
    echo -e "$line"
    sleep 0.06
done
echo

echo -e "${PASTEL_YELLOW}喵~ 正在为你准备少女计算器，请稍等呀...${RESET}"
sleep 0.7

mkdir -p ~/python

# 下载主文件
echo -e "${PASTEL_PURPLE}正在下载主程序...${RESET}"
curl -fsSL https://raw.githubusercontent.com/Alhkxsj/termux-calculator/main/计算机.py -o ~/python/计算机.py
echo -e "${PASTEL_PURPLE}正在下载启动脚本...${RESET}"
curl -fsSL https://raw.githubusercontent.com/Alhkxsj/termux-calculator/main/启动计算机.sh -o ~/python/启动计算机.sh
echo -e "${PASTEL_PURPLE}正在下载版本信息...${RESET}"
curl -fsSL https://raw.githubusercontent.com/Alhkxsj/termux-calculator/main/版本.txt -o ~/python/版本.txt

chmod +x ~/python/启动计算机.sh

# 添加别名
ALIAS_CMD="alias 少女计算器='bash ~/python/启动计算机.sh'"
PROFILE_FILE="$HOME/.bashrc"
if ! grep -Fxq "$ALIAS_CMD" "$PROFILE_FILE"; then
  echo "$ALIAS_CMD" >> "$PROFILE_FILE"
  echo -e "${PASTEL_YELLOW}已为你贴心设置启动别名~${RESET}"
fi

# 立即生效
eval "$ALIAS_CMD"

echo
echo -e "${PASTEL_BLUE}${BOLD}🎀 安装完成！${RESET}"
echo -e "${PASTEL_YELLOW}现在你可以在终端输入：${PINK}少女计算器${PASTEL_YELLOW} 来召唤我啦！${RESET}"
echo -e "${PASTEL_PURPLE}祝你每天都可爱又高效${PINK}~ฅ●'ω'●ฅ~${RESET}"
