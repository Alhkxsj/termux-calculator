import time
import os
import sys
import math

# 颜色与符号定义（Termux兼容）
粉 = "\033[95m"
嫩粉 = "\033[38;5;218m"
蓝 = "\033[94m"
青 = "\033[96m"
红 = "\033[91m"
亮白 = "\033[97m"
黄 = "\033[93m"
紫 = "\033[38;5;183m"
重置 = "\033[0m"
BOLD = "\033[1m"

# 兼容符号
爱心 = "<3"
花朵 = "*"
星星 = "+"
蝴蝶结 = "~"
闪 = "."
兔 = "(^_^)"
猫 = "(>_<)"

def 清屏():
    os.system("clear")

def 打印渐变(text, delay=0.04, color=嫩粉, end='\n'):
    for char in text:
        sys.stdout.write(f"{color}{char}{重置}")
        sys.stdout.flush()
        time.sleep(delay)
    print(end=end)

def 爱心动画():
    hearts = [
        f"{红}     {爱心}     {爱心}     {爱心}     ",
        f"{红}   {爱心}   {爱心}  {花朵}  {爱心}   {爱心}   ",
        f"{红}{BOLD} {爱心}  {闪} 刘婧仪最可爱 {闪}  {爱心} {重置}",
        f"{红}   {爱心}   {爱心}  {蝴蝶结}  {爱心}   {爱心}   ",
        f"{红}     {爱心}     {爱心}     {爱心}     {重置}"
    ]
    for _ in range(3):
        清屏()
        for line in hearts:
            print(line)
        time.sleep(0.6)
        清屏()
        time.sleep(0.25)

def 彩蛋():
    清屏()
    爱心动画()
    打印渐变(f"{蓝}{BOLD}{爱心} 致我最爱的女孩：刘婧仪 {爱心}{重置}", 0.07, 蓝)
    print()
    打印渐变(f"{嫩粉}你是我心中的光，是我每天的期待与欢喜。{重置}", 0.045)
    打印渐变(f"{紫}你笑的样子，是世界上最美的风景。{重置}", 0.045)
    打印渐变(f"{青}我希望未来的日子里，有你、有我、有我们。{重置}", 0.045)
    print()
    打印渐变(f"{黄}爱你的 —— 啊泠好困想睡觉{重置}", 0.06, 黄)
    print()
    打印渐变(f"{亮白}（按回车继续少女计算器喵~）{重置}", 0.03, 亮白)
    input("")
    清屏()

def 打印Logo():
    print(f"{嫩粉}{BOLD}============================================{重置}")
    print(f"{嫩粉}{BOLD}                                          {重置}")
    print(f"{嫩粉}{BOLD}     {花朵}{星星} 少女计算器终端版 {蝴蝶结}{星星}{花朵}     {重置}")
    print(f"{嫩粉}{BOLD}                                          {重置}")
    print(f"{嫩粉}{BOLD}============================================{重置}")
    print(f"{嫩粉}{BOLD} 作者:快手:啊泠好困想睡觉{重置}")
    打印渐变(f"{青}提示：输入 exit/quit 退出，520 有彩蛋{重置}\n", 0.01, 青)

def 打印分割线():
    print(f"{粉}{BOLD}{'='*52}{重置}")

def 打印欢迎界面():
    打印Logo()

def 终端计算器():
    清屏()
    打印欢迎界面()
    安全环境 = {
        "__builtins__": {},
        "abs": abs,
        "round": round,
        "min": min,
        "max": max,
        "pow": pow,
        "int": int,
        "float": float,
        "math": math,
    }
    while True:
        表达式 = input(f"{粉}{BOLD}➤ 请输入算式（支持 + - * / 和 math 模块）：{重置}")
        if 表达式.strip().lower() in ("exit", "quit"):
            打印渐变(f"{蓝}再见喵~ 记得想我和刘婧仪哦 {爱心}{猫}{重置}", 0.045, 蓝)
            time.sleep(0.5)
            break
        elif 表达式.strip() == "520":
            彩蛋()
            打印欢迎界面()
        elif not 表达式.strip():
            打印渐变(f"{黄}喵呜，啥也没输入哦~{重置}", 0.03, 黄)
        else:
            try:
                结果 = eval(表达式, 安全环境)
                打印渐变(f"{青}{BOLD}= {结果}{重置}", 0.02, 青)
            except Exception:
                打印渐变(f"{红}出错了喵，请检查格式和函数名~{重置}", 0.02, 红)

if __name__ == "__main__":
    终端计算器()
