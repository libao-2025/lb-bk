---
title: OneDrive无法打开的原因
categories:
  - 电脑使用日记
tags:
  - null
date: 2024-10-11 12:32:16
---

# OneDrive无法打开的原因



从[下载 OneDrive - Microsoft OneDrive](https://link.zhihu.com/?target=https%3A//www.microsoft.com/zh-cn/microsoft-365/onedrive/download)下载OneDrive并正常安装后，点击OneDrive的快捷方式没有任何反应，无法打开OneDrive，可以尝试下面的方法看是否可行：

## 1.  同时按Win+R（同时键盘上的Windows图标键和R键），输入gpedit.msc：

![](https://app.fekepj.com/list-tu/2024/10/11/e7de7403578fb8941da3d6511367bb5f.webp)

## 2.在本地组策略中依次点击：计算机配置-管理模板-Windows组件-OneDrive，双击右侧“禁止使用OneDrive进行文件存储”。

![](https://app.fekepj.com/list-tu/2024/10/11/7ee5d9abc4e1772324c382631bb02733.webp)

## 3.点击“未配置”或“已禁用”，重启电脑。

![](https://app.fekepj.com/list-tu/2024/10/11/ff14aeba4fdf0a3e19d0f32999d59927.webp)

## 4.如果上述步骤不行，试试修改[注册表](https://zhida.zhihu.com/search?content_id=164426236&content_type=Article&match_order=1&q=%E6%B3%A8%E5%86%8C%E8%A1%A8&zhida_source=entity)：同时按Win+R（同时键盘上的Windows图标键和R键），输入regedit，找到HKEY_LOCAL_MACHINE\\Software\\Policies\\Microsoft\\Windows\\OneDrive 路径。



![](https://app.fekepj.com/list-tu/2024/10/11/c56d52b720227517d1345090d8776cec.webp)

## 5.点开DisableFileSyncNGSC文件并将其值设置成“0”，关闭，重启计算机。

然后看看OneDrive是否可以启动了。



#  最后我用了下面这个方法才能解决:



onedrive 无法启动，没有任何反应
window10 64+， onedrive无法启动，右下角没有标志，文件管理器中也没有标志，onedrive无法启动，点击没有任何反应
点击 C:\Users\username\AppData\Local\Microsoft\OneDrive\OneDrive.exe 没有任何反应（管理员账户）

卸载重装数次没有作用；


官方回答

请您在键盘上点击 【Windows 按键 + R】 ；

请您在弹出的运行/ Run视窗输入：
```
%localappdata%\Microsoft\OneDrive\onedrive.exe /reset
```
然后请点击【OK】；

此刻OneDrive的图标会消失一至两分钟；

若OneDrive的图标仍未出现，请您在Run视窗输入:

```
%localappdata%\Microsoft\OneDrive\onedrive.exe
```

执行这行代码后，就自动打开了