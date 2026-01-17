import time
import os
import sys
import math

DELAY_FAST = 0.02
DELAY_NORMAL = 0.04
DELAY_SLOW = 0.045
DELAY_ANIM = 0.07

def 清屏():
    os.system("clear")

def 打印渐变(text, delay=DELAY_NORMAL, end='\n'):
    for char in text:
        sys.stdout.write(f"{char}")
        sys.stdout.flush()
        time.sleep(delay)
    print(end, end='')

def 爱心动画():
    hearts = [
        "     ♥     ♥     ♥     ",
        "   ♥   ♥   ♥   ♥   ♥   ",
        " ♥   阿泠计算器   ♥ ",
        "   ♥   ♥   ♥   ♥   ♥   ",
        "     ♥     ♥     ♥     "
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
    打印渐变(" ♥ 感谢使用阿泠计算器 ♥ ", DELAY_ANIM)
    print()
    打印渐变("愿你的每一天都闪闪发光！", DELAY_SLOW)
    打印渐变("保持热爱，继续加油！", DELAY_SLOW)
    打印渐变("未来可期，一起努力！", DELAY_SLOW)
    print()
    打印渐变("—— 阿泠好困想睡觉", DELAY_SLOW)
    print()
    打印渐变("（按回车继续）", DELAY_FAST)
    input("")
    清屏()

def 打印Logo():
    print("╔════════════════════════════════════════════════════╗")
    print("║                                                    ║")
    print("║        阿泠计算器 - 终端版                         ║")
    print("║                                                    ║")
    print("╚════════════════════════════════════════════════════╝")
    print(" 作者:快手:啊泠好困想睡觉")
    打印渐变("提示：输入 exit/quit 退出，520 有彩蛋\n", DELAY_FAST)

def 打印分割线():
    print("════════════════════════════════════════════════════")

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
        表达式 = input("➤ 请输入算式（支持 + - * / 和 math 模块）：")
        if 表达式.strip().lower() in ("exit", "quit"):
            打印渐变("再见啦！", DELAY_SLOW)
            time.sleep(0.5)
            break
        elif 表达式.strip() == "520":
            彩蛋()
            打印欢迎界面()
        elif not 表达式.strip():
            打印渐变("请输入算式", DELAY_FAST)
        else:
            try:
                结果 = eval(表达式, 安全环境)
                打印渐变(f"= {结果}", DELAY_FAST)
            except Exception:
                打印渐变("出错了，请检查格式和函数名", DELAY_FAST)

if __name__ == "__main__":
    终端计算器()
