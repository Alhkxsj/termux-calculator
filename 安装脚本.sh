#!/data/data/com.termux/files/usr/bin/bash

INSTALL_DIR="$HOME/python"
GITHUB_URL="https://raw.githubusercontent.com/Alhkxsj/termux-calculator/main"

mkdir -p "$INSTALL_DIR"

download_file() {
    local url="$1"
    local dest="$2"
    if curl -fSL "$url" -o "$dest" 2>/dev/null; then
        return 0
    else
        return 1
    fi
}

download_file "$GITHUB_URL/计算机.py" "$INSTALL_DIR/计算机.py"
download_file "$GITHUB_URL/启动计算机.sh" "$INSTALL_DIR/启动计算机.sh"
download_file "$GITHUB_URL/版本.txt" "$INSTALL_DIR/版本.txt"

chmod +x "$INSTALL_DIR/启动计算机.sh"

ALIAS_CMD="alias 计算器='bash $INSTALL_DIR/启动计算机.sh'"
PROFILE_FILE="$HOME/.bashrc"

if ! grep -Fxq "$ALIAS_CMD" "$PROFILE_FILE" 2>/dev/null; then
    echo "$ALIAS_CMD" >> "$PROFILE_FILE"
fi

eval "$ALIAS_CMD"

echo "阿泠计算器安装完成！"
echo "输入 '计算器' 即可启动"