#!/data/data/com.termux/files/usr/bin/bash

# 少女风配色定义（兼容大部分终端）
PINK='\033[1;35m'               # 粉紫
SOFT_PINK='\033[38;5;218m'     # 柔和粉
PASTEL_YELLOW='\033[38;5;229m' # 淡黄
PASTEL_BLUE='\033[38;5;153m'   # 淡蓝
PASTEL_PURPLE='\033[38;5;183m' # 淡紫
WHITE='\033[1;37m'             # 白色加粗
BOLD='\033[1m'                 # 加粗
UNDERLINE='\033[4m'            # 下划线
RESET='\033[0m'                # 重置

clear

# 动感LOGO与欢迎语动画
logo_lines=(
"${SOFT_PINK}${BOLD}╔═════════════════════════════════════════════════════╗${RESET}"
"${SOFT_PINK}${BOLD}║                                                     ║${RESET}"
"${SOFT_PINK}${BOLD}║   ${PINK}✿✿ 少女计算器 安装器 启动！ ✿✿   ${SOFT_PINK}║${RESET}"
"${SOFT_PINK}${BOLD}║          ${WHITE}让可爱与效率成为你生活的主旋律~          ${SOFT_PINK}║${RESET}"
"${SOFT_PINK}${BOLD}║                                                     ║${RESET}"
"${SOFT_PINK}${BOLD}╚═════════════════════════════════════════════════════╝${RESET}"
)

echo
for line in "${logo_lines[@]}"; do
    echo -e "$line"
    sleep 0.07
done
echo

# 闪烁提示，增加动感
for i in {1..3}; do
    echo -ne "${PASTEL_YELLOW}喵~ 正在为你准备少女计算器，请稍等呀"
    for dot in {1..3}; do
        echo -ne "."
        sleep 0.3
    done
    echo -ne "\r\033[K"  # 回到行首并清除
done
echo -e "${PASTEL_YELLOW}准备就绪啦！${RESET}"
sleep 0.7

# 创建目录，保证存在
mkdir -p ~/python
echo -e "${PASTEL_BLUE}📂 创建存放目录 ~/python （如果不存在的话）${RESET}"
sleep 0.3

# 下载文件函数，带进度与提示
download_file() {
    local url=$1
    local dest=$2
    local desc=$3
    echo -e "${PASTEL_PURPLE}⬇️  开始下载 ${desc}...${RESET}"
    curl -# -fSL "$url" -o "$dest"
    if [ $? -eq 0 ]; then
        echo -e "${PASTEL_PURPLE}✅ ${desc} 下载完成！${RESET}"
    else
        echo -e "${PINK}❌ ${desc} 下载失败，请检查网络或稍后重试。${RESET}"
        exit 1
    fi
    sleep 0.4
}

# 主程序
download_file "https://raw.githubusercontent.com/Alhkxsj/termux-calculator/main/计算机.py" "~/python/计算机.py" "主程序文件"

# 启动脚本
download_file "https://raw.githubusercontent.com/Alhkxsj/termux-calculator/main/启动计算机.sh" "~/python/启动计算机.sh" "启动脚本"

# 版本信息
download_file "https://raw.githubusercontent.com/Alhkxsj/termux-calculator/main/版本.txt" "~/python/版本.txt" "版本信息"

chmod +x ~/python/启动计算机.sh

# 设置别名，方便启动
ALIAS_CMD="alias 少女计算器='bash ~/python/启动计算机.sh'"
PROFILE_FILE="$HOME/.bashrc"
if ! grep -Fxq "$ALIAS_CMD" "$PROFILE_FILE"; then
    echo "$ALIAS_CMD" >> "$PROFILE_FILE"
    echo -e "${PASTEL_YELLOW}🎀 已为你贴心设置启动别名：${PINK}少女计算器${PASTEL_YELLOW} （输入即可启动）${RESET}"
else
    echo -e "${PASTEL_YELLOW}🎀 启动别名已存在，无需重复设置~${RESET}"
fi

# 立即生效别名
eval "$ALIAS_CMD"

# 最后彩蛋动画 + 温馨提示
echo
echo -e "${PASTEL_BLUE}${BOLD}🎉 安装完成！欢迎使用少女计算器！${RESET}"
echo -e "${PASTEL_YELLOW}现在只需输入 ${PINK}少女计算器${PASTEL_YELLOW} 就能召唤我啦！${RESET}"
echo -e "${PASTEL_PURPLE}╭( ･ㅂ･)و ̑̑ 加油，每天都要元气满满呐！${PINK}~ฅ●'ω'●ฅ~${RESET}"
echo

# 额外提醒
echo -e "${SOFT_PINK}${UNDERLINE}友情提示:${RESET} 如果你想卸载，只需删除 ~/python 目录并移除 .bashrc 中的别名即可。"
echo -e "${PASTEL_YELLOW}祝你终端时光甜美又高效！🍰✨${RESET}"
echo

# 多行分割线，增强层次感
for i in {1..3}; do
    echo -e "${SOFT_PINK}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${RESET}"
    sleep 0.1
done
