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
    打印渐变("提示：输入 help 查看帮助，exit/quit 退出，520 彩蛋\n", DELAY_FAST)
    打印渐变("快捷键：? 帮助，p 绘图，c 清屏，h 历史\n", DELAY_FAST)

def 打印分割线():
    print("════════════════════════════════════════════════════")

def 打印欢迎界面():
    打印Logo()

def 绘制函数图像(func_name, func, x_min=-10, x_max=10, width=80, height=24):
    print(f"╔════════════════════════════════════════════════════╗")
    print(f"║  函数图像: y = {func_name:<40} ║")
    print(f"╚════════════════════════════════════════════════════╝")
    print()
    
    # Braille字符映射 (2x8点阵) - 参考plotille和tplot
    BRAILLE_OFFSET = 0x2800
    
    def braille_char(dots):
        return chr(BRAILLE_OFFSET + dots)
    
    # 将2x8点阵转换为Braille字符
    def pixels_to_braille(pixels):
        dots = 0
        for row in range(8):
            for col in range(2):
                if pixels[row][col]:
                    # Braille Unicode: 2列 x 4行 (但实际是2x8点阵)
                    # 上半部分 (0-3): bits 0-7
                    # 下半部分 (4-7): bits 8-15
                    if row < 4:
                        dots |= 1 << (row * 2 + col)
                    else:
                        dots |= 1 << (6 + (row - 4) * 2 + col)
        return braille_char(dots)
    
    # 计算采样点
    braille_width = width // 2
    braille_height = height // 4
    
    x_values = []
    y_values = []
    
    step = (x_max - x_min) / (braille_width * 2)
    for i in range(braille_width * 2 + 1):
        x = x_min + i * step
        try:
            y = func(x)
            if -1e10 <= y <= 1e10:
                y_values.append(y)
                x_values.append(x)
            else:
                y_values.append(None)
                x_values.append(x)
        except:
            y_values.append(None)
            x_values.append(x)
    
    valid_y = [y for y in y_values if y is not None]
    if not valid_y:
        print("无法绘制：函数值超出范围")
        return
    
    y_min = min(valid_y)
    y_max = max(valid_y)
    
    if y_max == y_min:
        y_min -= 1
        y_max += 1
    
    y_range = y_max - y_min
    
    # 使用Braille字符绘制（2x8点阵）
    for row in range(braille_height):
        line = ""
        for col in range(braille_width):
            # 2x8点阵
            pixels = [[False, False] for _ in range(8)]
            
            # 检查每个子像素
            for sub_row in range(8):
                for sub_col in range(2):
                    x_pixel = x_min + (col * 2 + sub_col + 0.5) * step
                    y_pixel = y_min + ((braille_height - row - 1) * 4 + sub_row + 0.5) * y_range / (braille_height * 4)
                    
                    try:
                        y_true = func(x_pixel)
                        # 更精确的阈值检测
                        threshold = y_range / (braille_height * 8)
                        if abs(y_true - y_pixel) < threshold:
                            pixels[sub_row][sub_col] = True
                    except:
                        pass
            
            line += pixels_to_braille(pixels)
        print(f" {line}")
    
    # X轴刻度
    print()
    print(" X轴:", end="")
    for i in range(0, len(x_values), 20):
        print(f" {x_values[i]:7.2f}", end="")
    print()
    print()

def 显示帮助():
    清屏()
    print("╔════════════════════════════════════════════════════╗")
    print("║              阿泠计算器 - 帮助文档                  ║")
    print("╚════════════════════════════════════════════════════╝")
    print()
    print("【基础计算】")
    print("  直接输入算式，例如：1+1, 2*3, math.sqrt(16)")
    print()
    print("【函数绘图】")
    print("  命令格式：plot <函数名> [x最小值] [x最大值]")
    print("  示例：plot sin, plot x^2 -5 5, plot 1/x -10 10")
    print()
    print("【支持的函数】")
    print("  三角函数：sin, cos, tan, cot, sec, csc, asin, acos, atan")
    print("  双曲函数：sinh, cosh, tanh")
    print("  多项式函数：x²(x2), x³(x3), x⁴(x4)")
    print("  反比例函数：1/x, inv")
    print("  指数对数：exp, log, ln, log10, log2")
    print("  其他函数：sqrt, abs, sigmoid, relu, step, sign, floor, ceil, round")
    print()
    print("【快捷命令】")
    print("  help 或 ?   - 显示此帮助")
    print("  p 或 plot   - 绘图模式")
    print("  c 或 clear  - 清屏")
    print("  h 或 history- 显示历史记录")
    print("  exit 或 quit- 退出程序")
    print("  520          - 彩蛋")
    print()
    input("按回车返回...")

def 解析绘图命令(cmd):
    cmd = cmd.strip().lower()
    if cmd.startswith("plot"):
        parts = cmd[4:].strip().split()
        if not parts:
            return None, None
        
        func_expr = parts[0]
        x_min = -10
        x_max = 10
        
        if len(parts) > 1:
            try:
                x_min = float(parts[1])
            except:
                pass
        if len(parts) > 2:
            try:
                x_max = float(parts[2])
            except:
                pass
        
        func_map = {
            'sin': (math.sin, 'sin(x) - 正弦函数'),
            'cos': (math.cos, 'cos(x) - 余弦函数'),
            'tan': (math.tan, 'tan(x) - 正切函数'),
            'cot': (lambda x: 1/math.tan(x) if math.tan(x) != 0 else None, 'cot(x) - 余切函数'),
            'sec': (lambda x: 1/math.cos(x) if math.cos(x) != 0 else None, 'sec(x) - 正割函数'),
            'csc': (lambda x: 1/math.sin(x) if math.sin(x) != 0 else None, 'csc(x) - 余割函数'),
            'asin': (math.asin, 'asin(x) - 反正弦函数'),
            'acos': (math.acos, 'acos(x) - 反余弦函数'),
            'atan': (math.atan, 'atan(x) - 反正切函数'),
            'sinh': (math.sinh, 'sinh(x) - 双曲正弦'),
            'cosh': (math.cosh, 'cosh(x) - 双曲余弦'),
            'tanh': (math.tanh, 'tanh(x) - 双曲正切'),
            'exp': (math.exp, 'exp(x) - 指数函数'),
            'log': (math.log, 'log(x) - 对数函数'),
            'ln': (math.log, 'ln(x) - 自然对数'),
            'log10': (math.log10, 'log10(x) - 常用对数'),
            'log2': (math.log2, 'log2(x) - 以2为底对数'),
            'sqrt': (math.sqrt, 'sqrt(x) - 平方根'),
            'abs': (abs, 'abs(x) - 绝对值'),
            'x2': (lambda x: x**2, 'x² - 一元二次函数'),
            'x^2': (lambda x: x**2, 'x² - 一元二次函数'),
            'x3': (lambda x: x**3, 'x³ - 三次函数'),
            'x^3': (lambda x: x**3, 'x³ - 三次函数'),
            'x4': (lambda x: x**4, 'x⁴ - 四次函数'),
            'x^4': (lambda x: x**4, 'x⁴ - 四次函数'),
            '1/x': (lambda x: 1/x if x != 0 else None, '1/x - 反比例函数'),
            'inv': (lambda x: 1/x if x != 0 else None, '1/x - 反比例函数'),
            'quadratic': (lambda x: x**2, 'x² - 一元二次函数'),
            'cubic': (lambda x: x**3, 'x³ - 三次函数'),
            'quartic': (lambda x: x**4, 'x⁴ - 四次函数'),
            'inverse': (lambda x: 1/x if x != 0 else None, '1/x - 反比例函数'),
            'sigmoid': (lambda x: 1/(1+math.exp(-x)), 'sigmoid(x) - Sigmoid函数'),
            'relu': (lambda x: max(0, x), 'relu(x) - ReLU函数'),
            'step': (lambda x: 1 if x >= 0 else 0, 'step(x) - 阶跃函数'),
            'sign': (lambda x: 1 if x > 0 else (-1 if x < 0 else 0), 'sign(x) - 符号函数'),
            'floor': (math.floor, 'floor(x) - 向下取整'),
            'ceil': (math.ceil, 'ceil(x) - 向上取整'),
            'round': (round, 'round(x) - 四舍五入'),
        }
        
        if func_expr in func_map:
            return func_map[func_expr][1], func_map[func_expr][0], x_min, x_max
    
    return None, None

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
    历史记录 = []
    
    while True:
        表达式 = input("➤ ")
        表达式 = 表达式.strip()
        
        if not 表达式:
            continue
            
        表达式_lower = 表达式.lower()
        
        if 表达式_lower in ("exit", "quit"):
            打印渐变("再见啦！", DELAY_SLOW)
            time.sleep(0.5)
            break
        elif 表达式 == "520":
            彩蛋()
            打印欢迎界面()
        elif 表达式_lower in ("help", "?"):
            显示帮助()
            打印欢迎界面()
        elif 表达式_lower in ("c", "clear"):
            清屏()
            打印欢迎界面()
        elif 表达式_lower in ("h", "history"):
            print()
            print("【历史记录】")
            for i, 记录 in enumerate(历史记录[-10:], 1):
                print(f"  {i}. {记录}")
            print()
            input("按回车继续...")
            打印欢迎界面()
        elif 表达式_lower.startswith("plot") or 表达式_lower.startswith("p "):
            func_name, func, x_min, x_max = 解析绘图命令(表达式)
            if func_name and func:
                清屏()
                绘制函数图像(func_name, func, x_min, x_max)
                input("按回车继续...")
                打印欢迎界面()
            else:
                打印渐变("输入 help 查看绘图帮助", DELAY_FAST)
        else:
            历史记录.append(表达式)
            try:
                结果 = eval(表达式, 安全环境)
                打印渐变(f"= {结果}", DELAY_FAST)
            except Exception:
                打印渐变("出错了，请检查格式和函数名", DELAY_FAST)

if __name__ == "__main__":
    终端计算器()