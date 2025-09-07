---
title: 将 HEIC 格式的图片批量转换为 JPG 格式
categories:
  - GPT问答类
tags:
  - GPT学习
  - 图床
date: 2024-11-21 17:49:04
---

# 将 HEIC 格式的图片批量转换为 JPG 格式



---

有多种开源免费工具可以将 HEIC 格式的图片批量转换为 JPG 格式。以下是一些推荐的工具和方法：

---

### 1\. **ImageMagick**

**支持平台**：Windows、macOS、Linux  
**特点**：功能强大，支持批量处理。

#### 安装：

* 在系统中安装 ImageMagick（[官网下载](https://imagemagick.org/)）。
* 确保安装时勾选 HEIC 支持模块。

#### 转换命令：

在终端或命令提示符中运行以下命令将 HEIC 批量转换为 JPG：

```none
bashmagick mogrify -format jpg *.heic
```

* 该命令会将当前文件夹中所有的 `.heic` 文件转换为 `.jpg` 文件，并覆盖原始文件。

---

### 2\. **libheif + ffmpeg**

**支持平台**：Windows、macOS、Linux  
**特点**：灵活适配 HEIC，使用 ffmpeg 脚本可实现批量处理。

#### 安装：

* 安装 libheif（[GitHub地址](https://github.com/strukturag/libheif)）以支持 HEIC 格式。
* 安装 ffmpeg（[官网下载](https://ffmpeg.org/)）。

#### 转换命令：

运行以下脚本：

```none
bashfor file in *.heic; do
    ffmpeg -i "$file" "${file%.heic}.jpg"
done
```

---

### 3\. **XnConvert**

**支持平台**：Windows、macOS、Linux  
**特点**：图形化界面，易用且支持批量操作。

#### 下载：

* [官网下载]()

#### 操作步骤：

1. 打开 XnConvert。
2. 将 HEIC 文件批量拖入窗口。
3. 设置输出格式为 JPG。
4. 点击“转换”即可。

---

### 4\. **heic2jpg（Python脚本）**

**支持平台**：Windows、macOS、Linux  
**特点**：开源轻量，通过 Python 实现批量转换。

#### 安装：

1. 安装 Python 和 pip。
2. 安装依赖：
   ```none
   bashpip install pillow pyheif
   ```
3. 下载脚本：[GitHub地址](https://github.com/TacticalTechHeicToJpg)

#### 使用脚本：

```none
pythonimport os
from PIL import Image
import pyheif

def convert_heic_to_jpg(input_dir, output_dir):
    os.makedirs(output_dir, exist_ok=True)
    for file in os.listdir(input_dir):
        if file.endswith(".heic"):
            heif_file = pyheif.read(os.path.join(input_dir, file))
            image = Image.frombytes(
                heif_file.mode, 
                heif_file.size, 
                heif_file.data,
                "raw",
                heif_file.mode,
                heif_file.stride,
            )
            jpg_file = os.path.splitext(file)[0] + ".jpg"
            image.save(os.path.join(output_dir, jpg_file), "JPEG")

convert_heic_to_jpg("path/to/input", "path/to/output")
```

---

### 5\. **Online Tools**

如果文件量较少，也可以使用一些免费的在线工具（例如 CloudConvert 或 Zamzar）。但需要注意隐私安全性。

---

### 总结

* 如果需要命令行工具，推荐 **ImageMagick** 或 **libheif+ffmpeg**。
* 如果需要 GUI 界面工具，推荐 **XnConvert**。
* 如果想完全定制，可以选择 Python 脚本实现。

你可以根据使用场景选择最适合自己的工具！如果需要安装指导，欢迎继续询问。

Export