
#!/data/data/com.termux/files/usr/bin/bash
set -e

pkg update -y
pkg install -y python tk x11-repo

mkdir -p ~/python
cd ~/python

curl -LO https://你的链接/计算机.py
curl -LO https://你的链接/计算机图形版.py
curl -LO https://你的链接/启动计算机.sh

chmod +x 启动计算机.sh

echo -e "\n安装完成！运行：bash ~/python/启动计算机.sh"
