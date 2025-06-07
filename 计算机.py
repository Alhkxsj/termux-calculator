
import time
import os

def 打印动画(text, delay=0.04):
    for c in text:
        print(c, end='', flush=True)
        time.sleep(delay)
    print()

def 显示彩蛋():
    os.system("clear")
    print("\033[1;35m💖 特别的彩蛋 💖\033[0m\n")
    打印动画("这是一个特别的数字背后隐藏的心意。", 0.05)
    打印动画("愿你每天都拥有快乐与美好。", 0.05)
    input("\n按回车返回计算器...")

def 主函数():
    os.system("clear")
    print("\033[1;36m欢迎使用计算机（终端版）\033[0m")
    print("输入数学表达式，输入 q 退出\n")

    while True:
        表达式 = input("表达式 > ").strip()
        if 表达式.lower() in ['q', 'quit', 'exit']:
            print("\n再见，祝你好运！")
            break
        if 表达式 == "520":
            显示彩蛋()
            continue
        try:
            结果 = eval(表达式, {"__builtins__": {}}, {})
            print(f"结果 = {结果}")
            if 结果 == 520:
                显示彩蛋()
        except Exception:
            print("错误：无效表达式")

if __name__ == "__main__":
    主函数()
