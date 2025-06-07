
import tkinter as tk
import math
import threading
import time

主题 = {
    "背景": "#121212",
    "前景": "#e0e0e0",
    "高亮": "#ff4081",
    "按钮背景": "#222222",
    "按钮前景": "#e0e0e0",
}

信息 = [
    "这不是一个普通的数字。",
    "它背后藏着温暖和祝福。",
    "愿你一直幸福快乐。",
]

def 播放动画(窗口, 文本):
    文本框 = tk.Text(窗口, bg=主题["背景"], fg=主题["高亮"], font=("Consolas", 14), bd=0)
    文本框.pack(expand=True, fill="both", padx=10, pady=10)
    def 写入():
        for ch in 文本:
            文本框.insert("end", ch)
            文本框.update()
            time.sleep(0.05)
        文本框.config(state="disabled")
    threading.Thread(target=写入).start()

def 显示彩蛋():
    新窗口 = tk.Toplevel()
    新窗口.title("隐藏彩蛋")
    新窗口.geometry("400x250")
    新窗口.configure(bg=主题["背景"])
    文本 = "\n".join(["💖 彩蛋 💖\n"] + 信息 + ["\n来自一个用心的程序"])
    播放动画(新窗口, 文本)

def 计算(表达式, 显示区域, 输入框):
    try:
        if 表达式.strip() == "520":
            显示彩蛋()
            return
        结果 = eval(表达式, {"__builtins__": None}, {
            "sqrt": math.sqrt,
            "pow": pow,
            "abs": abs,
            "round": round
        })
        显示区域.config(text=f"结果：{round(结果,6)}")
        if 结果 == 520:
            显示彩蛋()
    except Exception:
        显示区域.config(text="错误：表达式无效")
    输入框.delete(0, 'end')

def 点击(值, 输入框, 显示区域):
    if 值 == "清除":
        输入框.delete(0, 'end')
        显示区域.config(text="")
    elif 值 == "=":
        表达式 = 输入框.get()
        计算(表达式, 显示区域, 输入框)
    else:
        输入框.insert('end', 值)

def 主函数():
    主窗口 = tk.Tk()
    主窗口.title("计算机（图形版）")
    主窗口.geometry("420x520")
    主窗口.configure(bg=主题["背景"])

    标题 = tk.Label(主窗口, text="计算机", font=("Arial", 24), fg=主题["高亮"], bg=主题["背景"])
    标题.pack(pady=20)

    输入框 = tk.Entry(主窗口, font=("Consolas", 20), bg="#fff", fg="#000", justify="right")
    输入框.pack(padx=20, pady=10, ipady=10)

    按钮组 = [
        ['7', '8', '9', '/'],
        ['4', '5', '6', '*'],
        ['1', '2', '3', '-'],
        ['0', '.', '清除', '+'],
        ['(', ')', 'sqrt', '=']
    ]

    框架 = tk.Frame(主窗口, bg=主题["背景"])
    框架.pack(pady=10)

    for 行 in 按钮组:
        行框架 = tk.Frame(框架, bg=主题["背景"])
        行框架.pack(pady=3)
        for 按钮 in 行:
            btn = tk.Button(行框架, text=按钮, width=5, height=2, font=("Arial", 16),
                            bg=主题["按钮背景"], fg=主题["按钮前景"],
                            command=lambda x=按钮: 点击(x, 输入框, 主窗口.children['!label2']))
            btn.pack(side="left", padx=5)

    显示区域 = tk.Label(主窗口, text="", font=("Arial", 18), fg=主题["前景"], bg=主题["背景"])
    显示区域.pack(pady=20)

    主窗口.mainloop()

if __name__ == "__main__":
    主函数()
