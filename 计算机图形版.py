#!/usr/bin/env python3
import tkinter as tk, threading, time, math

class SkinCalculator:
    def __init__(self, root):
        self.root = root
        self.skin = 'pink'
        self.skins = {
            'pink': {'bg':'#fff0f5','fg':'#c2185b','btn_bg':'#fddde6','btn_hover':'#f8bbd0'},
            'mint': {'bg':'#f0fff4','fg':'#00796b','btn_bg':'#c8e6c9','btn_hover':'#a5d6a7'}
        }
        root.title("少女风计算机（图形版）")
        root.geometry("400x550")
        self.create_widgets()
        self.apply_skin()

    def apply_skin(self):
        s = self.skins[self.skin]
        self.root.config(bg=s['bg'])
        self.title.config(bg=s['bg'], fg=s['fg'])
        self.entry.config(bg='white', fg='black')
        self.footer.config(bg=s['bg'], fg=s['fg'])
        for btn in self.buttons:
            btn.config(bg=s['btn_bg'], fg=s['fg'],
                       activebackground=s['btn_hover'])
        self.skin_button.config(bg=s['btn_bg'], fg=s['fg'], activebackground=s['btn_hover'])

    def toggle_skin(self):
        self.skin = 'mint' if self.skin=='pink' else 'pink'
        self.apply_skin()

    def show_egg(self):
        w = tk.Toplevel(self.root)
        w.title("彩蛋")
        w.geometry("380x220")
        s = self.skins[self.skin]
        w.config(bg=s['bg'])
        txt = tk.Text(w,bg=s['bg'],fg=s['fg'],bd=0,wrap="word",font=("Arial",14))
        txt.pack(expand=True, fill="both", padx=10, pady=10)
        msg = "🌸 少女彩蛋 🌸\n\n520，是你我的小心动。\n愿你每天都像被花瓣轻吻。\n—— 来自用心的人"
        def writer():
            for c in msg:
                txt.insert("end",c); txt.update(); time.sleep(0.04)
            txt.config(state="disabled")
        threading.Thread(target=writer).start()

    def calculate(self, v):
        if v=="C":
            self.entry.delete(0,'end'); self.result_label.config(text="")
            return
        if v=="=":
            expr = self.entry.get()
            if expr=="520": self.show_egg(); return
            try:
                res = eval(expr,{"__builtins__":None},{"sqrt":math.sqrt})
                self.result_label.config(text=f"结果 = {round(res,6)}")
                if res==520: self.show_egg()
            except:
                self.result_label.config(text="错误")

            self.entry.delete(0,'end')
            return
        self.entry.insert('end',v)

    def create_widgets(self):
        self.title = tk.Label(self.root,text="少女风计算机",font=("Helvetica",24,"bold"))
        self.title.pack(pady=12)
        self.entry = tk.Entry(self.root,font=("Consolas",20),justify="right")
        self.entry.pack(fill="x",padx=10,pady=5,ipady=6)
        frame = tk.Frame(self.root)
        frame.pack(pady=8)
        self.buttons=[]
        for row in [["7","8","9","/"],["4","5","6","*"],["1","2","3","-"],["C","0",".","="]]:
            rowf=tk.Frame(frame); rowf.pack(expand=True,fill="both", pady=3)
            for ch in row:
                b=tk.Button(rowf,text=ch,font=("Helvetica",16,"bold"), command=lambda x=ch: self.calculate(x))
                b.pack(side="left",expand=True,fill="both", padx=4)
                self.buttons.append(b)
        self.result_label = tk.Label(self.root,text="",font=("Consolas",18))
        self.result_label.pack(pady=5)
        self.footer = tk.Label(self.root,text="少女皮肤：粉色 ↔ 薄荷", font=("Arial",12))
        self.footer.pack(pady=5)
        self.skin_button = tk.Button(self.root,text="切换皮肤",command=self.toggle_skin)
        self.skin_button.pack(pady=3)
        self.buttons.append(self.skin_button)

if __name__=="__main__":
    root=tk.Tk()
    app=SkinCalculator(root)
    root.mainloop()
