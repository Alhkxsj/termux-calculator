import tkinter as tk

# 替代 messagebox 的彩蛋弹窗
def 显示彩蛋():
    彩蛋窗口 = tk.Toplevel(窗口)
    彩蛋窗口.title("💗 刘婧仪 💗")
    彩蛋窗口.configure(bg="#fff0f5")
    彩蛋窗口.geometry("300x200")

    彩蛋文本 = (
        "🌸 我最最喜欢的女孩是：刘婧仪 🌸\n\n"
        "她是我梦里的光，是我世界的粉红。\n"
        "不管未来多远，我都会一直陪着她。\n\n"
        "💖 永远爱你 💖"
    )
    标签 = tk.Label(彩蛋窗口, text=彩蛋文本, font=("Arial", 12), wraplength=280, bg="#fff0f5", fg="#ff69b4", justify="left")
    标签.pack(padx=10, pady=10)

    关闭按钮 = tk.Button(彩蛋窗口, text="我知道了~", command=彩蛋窗口.destroy, bg="#ffc0cb", fg="#fff", font=("Arial", 12), bd=0, activebackground="#ffb6c1")
    关闭按钮.pack(pady=5)

# 计算函数
def 点击等于():
    try:
        表达式 = 输入框.get()
        if 表达式.strip() == "520":
            显示彩蛋()
        else:
            结果 = eval(表达式)
            输入框.delete(0, tk.END)
            输入框.insert(0, str(结果))
            if str(结果) == "520":
                显示彩蛋()
    except:
        输入框.delete(0, tk.END)
        输入框.insert(0, "格式错误")

# 插入字符
def 插入字符(char):
    输入框.insert(tk.END, char)

# 清除输入
def 清除输入():
    输入框.delete(0, tk.END)

# 主窗口设置
窗口 = tk.Tk()
窗口.title("少女计算器 🌸")
窗口.geometry("360x540")
窗口.configure(bg="#ffe6f0")

# 输入框
输入框 = tk.Entry(
    窗口, font=("Arial", 24), bd=6, relief=tk.FLAT,
    justify="right", bg="#fff0f5", fg="#ff69b4"
)
输入框.pack(fill=tk.BOTH, padx=10, pady=15, ipady=12)

# 按钮通用样式
按钮样式 = {
    "font": ("Arial", 16),
    "width": 4,
    "height": 2,
    "bg": "#ffc0cb",
    "fg": "#ffffff",
    "bd": 0,
    "activebackground": "#ffb6c1"
}

# 按钮布局
按钮列表 = [
    ['7', '8', '9', '+'],
    ['4', '5', '6', '-'],
    ['1', '2', '3', '*'],
    ['0', '.', '=', '/'],
]

按钮框架 = tk.Frame(窗口, bg="#ffe6f0")
按钮框架.pack()

for 行 in 按钮列表:
    行框 = tk.Frame(按钮框架, bg="#ffe6f0")
    行框.pack(pady=4)
    for 按钮 in 行:
        if 按钮 == '=':
            b = tk.Button(行框, text=按钮, command=点击等于, **按钮样式)
        else:
            b = tk.Button(行框, text=按钮, command=lambda c=按钮: 插入字符(c), **按钮样式)
        b.pack(side=tk.LEFT, padx=6)

# 底部操作栏
底部行 = tk.Frame(窗口, bg="#ffe6f0")
底部行.pack(pady=20)

清空按钮 = tk.Button(底部行, text="清空", command=清除输入, **按钮样式)
清空按钮.pack(side=tk.LEFT, padx=20)

退出按钮 = tk.Button(底部行, text="退出", command=窗口.destroy, **按钮样式)
退出按钮.pack(side=tk.RIGHT, padx=20)

# 运行窗口
窗口.mainloop()
