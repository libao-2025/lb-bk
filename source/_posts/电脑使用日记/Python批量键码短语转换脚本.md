---
title: Python批量键码短语转换脚本
categories:
  - 电脑使用日记
tags:
  - md命令
date: 2025-08-27 14:09:45
---

# Python 批量键码短语转换脚本

在使用五笔输入法或者自定义短语时，经常需要把“短语 + 键码 + 数量”的格式，批量转换成“键码,数量=短语”的格式，或者反向还原。本文提供一款 **双向批量转换 Python 脚本**，适合处理大量短语记录。

---

## 功能说明

1. **正向转换（Forward）**

原始格式：

```
短语    键码    数量
```

转换后格式：

```
键码,数量=短语
```

2. **反向转换（Reverse）**

原始格式：

```
键码,数量=短语
```

转换后格式：

```
短语    键码    数量
```

---

## 脚本内容

```python
# -*- coding: utf-8 -*-
"""
双向批量转换脚本
支持：
1. 正向转换：短语+键码+数量 -> 键码,数量=短语
2. 反向转换：键码,数量=短语 -> 短语+键码+数量
"""

import os

# ===== 配置 =====
input_file = "input.txt"   # 输入文件路径
output_file = "output.txt" # 输出文件路径
mode = "forward"           # 模式: "forward" 或 "reverse"

# ===== 处理 =====
with open(input_file, "r", encoding="utf-8") as f:
    lines = f.readlines()

with open(output_file, "w", encoding="utf-8") as f:
    for line in lines:
        line = line.strip()
        if not line:
            continue
        try:
            if mode == "forward":
                # 正向转换
                parts = line.rsplit("\t", 2)
                if len(parts) < 3:
                    print(f"警告：无法解析此行 -> {line}")
                    continue
                short_phrase = parts[0]
                key_code = parts[1]
                number = parts[2]
                f.write(f"{key_code},{number}={short_phrase}\n")
            elif mode == "reverse":
                # 反向转换
                key_num, short_phrase = line.split("=", 1)
                key_code, number = key_num.split(",", 1)
                f.write(f"{short_phrase}\t{key_code}\t{number}\n")
            else:
                raise ValueError("模式错误，请使用 'forward' 或 'reverse'")
        except Exception as e:
            print(f"处理行出错: {line}\n错误: {e}")

print(f"转换完成，结果已保存到 {output_file}")
```

---

## 使用说明

1. **准备输入文件**

- 正向转换：`input.txt` 每行格式为：

```
短语1    键码1    数量1
短语2    键码2    数量2
...
```

- 反向转换：`input.txt` 每行格式为：

```
键码1,数量1=短语1
键码2,数量2=短语2
...
```

2. **修改模式**

```python
mode = "forward"   # 正向转换
mode = "reverse"   # 反向转换
```

3. **运行脚本**

- Windows：
```bash
python batch_convert.py
```

- Mac / Linux：
```bash
python3 batch_convert.py
```

4. **查看输出**

- 输出文件为 `output.txt`，根据模式生成对应内容。

5. **准备文件**

- 脚本仅使用 Python 标准库，无需安装额外库。
- 将 `batch_convert.py` 和 `input.txt` 放在同一个目录下。
- 修改模式 `mode = "forward"` 或 `mode = "reverse"`。

---

## 示例

**原始短语示例（正向）：**

```
高级蓝牙加按键版（全国版，可按键操作）    trww    3
特价款（单城市）    twwffi    3
```

**正向转换后输出：**

```
trww,3=高级蓝牙加按键版（全国版，可按键操作）
twwffi,3=特价款（单城市）
```

**反向转换后输出：**

```
高级蓝牙加按键版（全国版，可按键操作）    trww    3
特价款（单城市）    twwffi    3
```

---

## 新电脑运行环境与依赖

1. **安装 Python**

- 下载：[Python 官网](https://www.python.org/downloads/)
- 建议安装 Python 3.10+
- Windows：勾选 “Add Python to PATH”
- Mac：用 Homebrew 安装 `brew install python`
- Linux：使用系统包管理器 `sudo apt install python3 python3-pip`

验证安装：
```bash
python --version
# 或
python3 --version
```

2. **安装依赖**

- 脚本仅使用 Python 标准库，无需安装额外库。

3. **准备文件**

- 将 `batch_convert.py` 和 `input.txt` 放在同一个目录下。
- 修改模式 `mode = "forward"` 或 `mode = "reverse"`。

4. **运行脚本**

```bash
python batch_convert.py   # Windows
python3 batch_convert.py  # Mac / Linux
```

5. **查看输出**

- 输出文件为 `output.txt`，根据模式生成对应内容。

6. **小技巧**

- Windows 可创建 `.bat` 文件一键运行：
```bat
@echo off
python batch_convert.py
pause
```

- 可批量处理多文件，只需修改 `input_file` 即可。
- Python 3.6+ 都可以运行。

---

## 小技巧（Tips）

1. Windows：直接把输入文件拖到脚本同目录，运行即可。
2. Mac/Linux：终端进入脚本目录，运行 `python3 batch_convert.py`。
3. 支持批量处理上百行甚至上千行短语记录，非常适合自定义输入法或整理键码短语。
