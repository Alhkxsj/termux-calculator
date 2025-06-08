import time
import os
import sys

# 定义颜色
粉 = "\033[95m"
蓝 = "\033[94m"
青 = "\033[96m"
红 = "\033[91m"
亮白 = "\033[97m"
重置 = "\033[0m"

def 清屏():
    os.system("clear" if os.name == "posix" else "cls")

def 打印渐变(text, delay=0.04, color=粉):
    for char in text:
        sys.stdout.write(f"{color}{char}{重置}")
        sys.stdout.flush()
        time.sleep(delay)
    print()

def 爱心动画():
    hearts = [
        f"{红}      💖         💖       ",
        f"{红}   💗     💗   💗     💗    ",
        f"{红}💓   💞 刘婧仪 💞   💓",
        f"{红}   💗     💗   💗     💗    ",
        f"{红}      💖         💖       {重置}"
    ]
    for i in range(3):
        清屏()
        for line in hearts:
            print(line)
        time.sleep(0.5)
        清屏()
        time.sleep(0.3)

def 彩蛋():
    清屏()
    爱心动画()
    打印渐变("💘 致我最爱的女孩：刘婧仪 💘", 0.07, 蓝)
    print()
    打印渐变("你是我心中的光，是我每一天的期待与欢喜。", 0.04)
    打印渐变("你笑的样子，是世界上最美的风景。", 0.04)
    打印渐变("我希望未来的日子里，有你、有我、有我们。", 0.04)
    print()
    打印渐变("💌 爱你的 —— 泠好困想睡觉", 0.06, 青)
    print()
    input(f"{亮白}按下回车继续使用少女计算器吧喵~{重置}")
    清屏()

def 打印欢迎界面():
    print(f"{粉}╭────────────────────────────────────────────╮")
    print(f"│              🌸 少女计算器终端版 🌸             │")
    print(f"╰────────────────────────────────────────────╯{重置}")
    print(f"{蓝}作者：快手：泠好困想睡觉{重置}")
    print(f"{青}提示：输入 exit 或 quit 可退出，输入 520 查看彩蛋~{重置}\n")

def 主程序():
    清屏()
    打印欢迎界面()

    while True:
        表达式 = input(f"{粉}➤ 请输入算式：{重置}")
        if 表达式.strip().lower() in ("exit", "quit"):
            打印渐变("再见喵~ 记得想我和刘婧仪哦 💕", delay=0.04, color=蓝)
            break
        try:
            if 表达式.strip() == "520":
                彩蛋()
                打印欢迎界面()
            else:
                结果 = eval(表达式)
                print(f"{青}= {结果}{重置}")
        except Exception:
            print(f"{红}出错了喵，请检查格式~{重置}")

if __name__ == "__main__":
    主程序()
