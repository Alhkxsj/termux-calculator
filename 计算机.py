import time
import os

# 定义颜色
粉 = "\033[95m"
蓝 = "\033[94m"
重置 = "\033[0m"

def 清屏():
    os.system("clear" if os.name == "posix" else "cls")

def 彩蛋():
    清屏()
    print(f"{粉}╭──────────────────────────╮")
    print(f"│     💗 我爱刘婧仪 💗      │")
    print(f"╰──────────────────────────╯{重置}")
    input("按回车继续...")

def 主程序():
    清屏()
    print(f"{粉}少女计算器终端版启动成功！输入算式开始计算吧~")
    print(f"输入 {蓝}exit{粉} 或 {蓝}quit{粉} 可退出计算器{重置}\n")
    
    while True:
        表达式 = input(f"{粉}➤ 请输入算式：{重置}")
        if 表达式.strip().lower() in ("exit", "quit"):
            print(f"{蓝}再见喵~{重置}")
            break
        try:
            if 表达式.strip() == "520":
                彩蛋()
            else:
                结果 = eval(表达式)
                print(f"{蓝}= {结果}{重置}")
        except Exception:
            print(f"{蓝}出错了喵，请检查格式~{重置}")

if __name__ == "__main__":
    主程序()
