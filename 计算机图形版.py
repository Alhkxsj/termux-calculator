import tkinter as tk
from tkinter import messagebox

# 彩蛋函数
def 显示彩蛋():
    messagebox.showinfo("💗 彩蛋时间！", "刘婧仪是我最爱的女孩！\n她是我的唯一~\n我会永远陪伴她 🌸")

# 计算函数
def 点击等于():
    try:
        表达式 = 输入框.get()
        if 表达式.strip() == "520":
            显示彩蛋()
        else:
            结果 = eval(表达式)
            if 结果 == 520:
                显示彩蛋()
            else:
                输入框.delete(0, tk.END)
                输入框.insert(0, str(结果))
    except:
        输入框.delete(0, tk.END)
        输入框.insert(0, "错误")

# 插入函数
def 插入字符(char):
    输入框.insert(tk.END, char)

# 清除函数
def 清除输入():
    输入框.delete(0, tk.END)

# 创建窗口
窗口 = tk.Tk()
窗口.title("少女计算器 🌸")
窗口.geometry("360x500")
窗口.configure(bg="#ffe6f0")  # 粉色背景

# 输入框
输入框 = tk.Entry(窗口, font=("Arial", 24), bd=8, relief=tk.FLAT, justify="right", bg="#fff0f5", fg="#ff69b4")
输入框.pack(fill=tk.BOTH, padx=10, pady=10, ipady=10)

# 按钮列表
按钮样式 = {
    "font": ("Arial", 18),
    "width": 5,
    "height": 2,
    "bg": "#ffc0cb",
    "fg": "#ffffff",
    "bd": 0,
    "activebackground": "#ffb6c1"
}

按钮列表 = [
    ['7', '8', '9', '+'],
    ['4', '5', '6', '-'],
    ['1', '2', '3', '*'],
    ['0', '.', '=', '/'],
]

# 创建按钮
按钮框架 = tk.Frame(窗口, bg="#ffe6f0")
按钮框架.pack()

for 行 in 按钮列表:
    行框 = tk.Frame(按钮框架, bg="#ffe6f0")
    行框.pack(pady=5)
    for 按钮 in 行:
        if 按钮 == '=':
            b = tk.Button(行框, text=按钮, command=点击等于, **按钮样式)
        else:
            b = tk.Button(行框, text=按钮, command=lambda char=按钮: 插入字符(char), **按钮样式)
        b.pack(side=tk.LEFT, padx=5)

# 最后一行：清空和退出
底部行 = tk.Frame(窗口, bg="#ffe6f0")
底部行.pack(pady=15)

清除 = tk.Button(底部行, text="清空", command=清除输入, **按钮样式)
清除.pack(side=tk.LEFT, padx=10)

退出 = tk.Button(底部行, text="退出", command=窗口.destroy, **按钮样式)
退出.pack(side=tk.RIGHT, padx=10)

窗口.mainloop()
