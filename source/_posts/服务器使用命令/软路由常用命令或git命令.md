---
title: 软路由常用命令或git命令
categories:
  - 服务器使用命令
tags:
  - git命令
date: 2024-09-28 12:09:24
---

# 软路由常用命令或git合令

## 自动优选ip]

[cloudflare] 注册：(https://dash.cloudflare.com)

[worker vless 搭建脚本：](https://github.com/3Kmfi6HP/EDtunnel/blob/main/_worker.js)

[域名注册：][www.namesilo.com](http://www.namesilo.com/)

[美国地址生成器：](https://www.haoweichi.com/)

[下载速度解决方案下载测速地址：](https://github.com/XIU2/CloudflareSpeedTest/issues/168)

[finashell下载地址：](http://www.hostbuf.com/)

[openwrtx86下载：](https://www.123pan.com/s/csfUVv-Ayffd.html)

##  查看软路由型号
```
uname -m
```

[对应型号下载对应cloudflareST版本](https://github.com/XIU2/CloudflareSpeedTest/releases/tag/v2.0.3)

[自动优选脚本下载](https://github.com/lee1080/CloudflareSpeedTestDDNS/releases/tag/v2.1.1)

然后在root目录下新建一个名称 yxip，把下载好的所有文件拖到目录下

## 到目录下

```
cd /root/yxip
```
* 如果电脑win10上用的git软件，要切换目录，可以参考这样的命令
例如你所在目录操作想cd切换到这目录 /g/bk/2024bk 
可以用

```
cd /g/bk/2024bk
```
上面是假如



## 给予文件权限：

```
chmod +x CloudflareST
```

运行代码

```
bash ip.sh
```

## 定时任务：这就是每天05点自动执行一次

```
00 05 * * * cd /root/auto/ && bash ip.sh
```

#