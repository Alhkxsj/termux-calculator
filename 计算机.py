#!/usr/bin/env python3
import time, os, sys

def slow_print(text, delay=0.04):
    for c in text:
        print(c, end='', flush=True)
        time.sleep(delay)
    print()

def show_egg():
    os.system('clear')
    print("\033[1;35m🌸 少女彩蛋🌸\033[0m\n")
    slow_print("520，是你我的小心动。",0.06)
    slow_print("愿你每天都像被花瓣轻吻。",0.06)
    slow_print("你的笑容，是我计算里最美的结果。",0.06)
    slow_print("—— 来自用心的人",0.06)
    input("\n按回车继续")

def main():
    os.system('clear')
    print("\033[95m欢迎使用 少女风计算机（终端版）\033[0m")
    print("输入表达式（例：1+1），输入 q 退出\n")
    while True:
        expr = input("表达式 > ").strip()
        if expr.lower() in ['q','exit']:
            print("\n再见~ 愿你每天都灿烂🌸")
            break
        if expr == "520":
            show_egg(); continue
        try:
            result = eval(expr, {"__builtins__":None}, {})
            print(f"\033[96m结果 = {result}\033[0m")
            if result == 520: show_egg()
        except:
            print("\033[91m错误：无效表达式\033[0m")

if __name__=="__main__":
    main()
