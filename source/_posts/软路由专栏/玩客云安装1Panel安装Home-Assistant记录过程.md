---
title: 玩客云安装1Panel安装Home-Assistant记录过程
categories:
  - 软路由专栏
tags:
  - 玩客云
date: 2024-12-17 20:15:51
---

# 玩客云安装1Panel安装Home-Assistant记录过程

原文地址
https://www.right.com.cn/forum/thread-8344722-1-1.html

## 【****SSH连接玩客云登录armbian****】
刷机后，给玩客云接上网线，通上电。进入路由器查看玩客云的IP，注意要等玩客云通电长一点时间，大概3-5分钟再去路由器查看IP，无法找到IP的话，尝试重启路由器，或者电脑运行cmd中执行arp -a查看，再或者重启玩客云。通过SSH客户端（推荐NxShell：[https://nxshell.github.io](https://nxshell.github.io/)），连接玩客云的IP，登录armbian。**用户名root，密码1234**，登录后提示需要更改密root的初始密码，自行设置。更改完密码后，会提示创建账户，我们直接Ctrl+C取消。

## 【****设置armbian****】

- **检查时间**

1.执行以下命令，一键更换国内源。
```
date -R
```
2.如果时区及时间不对，输入命令。

```
cp /usr/share/zoneinfo/Asia/Shanghai  /etc/localtime
```

3.再次检查时间。
```
date -R
```

## 一键更换国内源

1.执行以下命令，一键更换国内源。

```
bash <(curl -sSL https://linuxmirrors.cn/main.sh)
```

参考LinuxMirrors：https://github.com/SuperManito/LinuxMirrors
使用方法：https://linuxmirrors.cn/use/



## **灯光控制**

1.黑色电工胶带直接粘住，也是一个办法。或者执行以下命令，关闭所有灯。
```
echo 0 >/sys/class/leds/onecloud\:blue\:alive/brightness
echo 0 >/sys/class/leds/onecloud\:green\:alive/brightness
echo 0 >/sys/class/leds/onecloud\:red\:alive/brightness
```

2.执行以下命令，蓝灯常亮；绿灯常亮和红灯常亮的方法类推。
```
echo "default-on" >/sys/class/leds/onecloud\:blue\:alive/trigger
echo "none" >/sys/class/leds/onecloud\:green\:alive/trigger
echo "none" >/sys/class/leds/onecloud\:red\:alive/trigger
```


参考论坛用户“lanwairen123”在《玩客云灯光问题》中的回复：https://www.right.com.cn/forum/forum.php?mod=viewthread&tid=8253350

## 安装1panel（为了更加方便的控制容器，以及设置定时任务重启小雅alist进行更新，如果不需要的话可以跳过）
```
curl -sSL https://resource.fit2cloud.com/1panel/package/quick_start.sh -o quick_start.sh && bash quick_start.sh
```
全部回车确定即可快速配置

等待安装完成即可，根据给出的内网访问地址、面板账号、面板密码进行登录。检查安装是非完成。
原文链接：https://blog.csdn.net/bingganzhen/article/details/140609250
【******登陆1panel安装Home-Assistant】
————————————————

## 安装Samba（文件共享）


CasaOS的文件共享不能设置密码，故而安装Samba，按需食用。

1.执行以下命令，更新软件包列表，并通过APT安装Samba应用。
```
sudo apt update
sudo apt install samba
```

2.执行以下命令，打开Samba的配置文件。

```
sudo nano /etc/samba/smb.conf

```

3.在文件的末尾添加以下内容（配置信息）后，Ctrl+X保存，以创建共享。
```
#######################################################
#[共享显示的名称，可自定义]
[libao-tb]
#自定义备注信息
comment = 16G
#路径，下列是我的共享路径，要设置成你的，怎么查询路径，CasaOS主页,文件夹图标打开，左侧位置>下面会列出挂载的U盘，点击目标U盘进入，鼠标移到目标文件夹出现3个点点，点击选择拷贝路径，再粘贴到path
path = /mnt/libao
#共享用户名
valid users = root
#只读 yes=是 no=否
read only = no
#来宾
guest ok = no
#创建文件时权限，权限按需设置
create maks = 0777
#创建目录时权限，权限按需设置
directory mask = 0777
#是否可被看见
browseable = yes
available = yes
writable = yes
#######################################################
```
这里是我的[smb.conf-打开文件](https://app.lifu.us.kg/%E5%85%B6%E5%AE%83%E8%84%9A%E6%9C%AC%E6%96%87%E4%BB%B6%E5%A4%87%E4%BB%BD/Samba%E9%85%8D%E7%BD%AE%E8%84%9A%E6%9C%AC%E4%B8%AD%E6%96%87%E6%B3%A8%E9%87%8A/%E4%B8%AD%E6%96%87%E5%A4%87%E4%BB%BD%E6%96%87%E4%BB%B6smb.conf)，中文翻译注释，可以[下载本文件压缩包](https://app.lifu.us.kg/%E5%85%B6%E5%AE%83%E8%84%9A%E6%9C%AC%E6%96%87%E4%BB%B6%E5%A4%87%E4%BB%BD/Samba%E9%85%8D%E7%BD%AE%E8%84%9A%E6%9C%AC%E4%B8%AD%E6%96%87%E6%B3%A8%E9%87%8A/smb.rar)
4.上述设置会默认共享root目录，如不想显示root目录，可以增加在[homes]节点中，“comment = Home Directories”，“browseable = no”的下面增加下列配置信息。

```
#是否可被看见
browseable = no
available = no
writable = no
```

5.创建用户密码，注意用户名是否是第2步骤用户名。

```
sudo smbpasswd -a lifuaini
```
6.执行以下命令，重启Samba服务以应用配置更改。
```
sudo systemctl restart smbd
```
每次重启也只要上面这行

7.执行以下命令，设置Samba开机自启。
```
sudo systemctl start smbd
```
两条单独执行


---
## 安装Cpolar（内网穿透）  

**1.执行以下代码，安装Cpolar。  

```
curl -L https://www.cpolar.com/static/downloads/install-release-cpolar.sh | sudo bash
```

2.查看版本号，有正常显示版本号即为安装成功。  
3.登录cpolar官网后台，点击左侧的验证，查看自己的认证token，之后将token贴在命令行里。

```
cpolar authtoken xxxxxxx
```


4.向系统添加服务。

```
sudo systemctl enable cpolar
```

5.启动cpolar服务

```
sudo systemctl start cpolar
```

6.在浏览器上访问本地端口http://玩客云IP:9200,使用cpolar邮箱账号登录Cpolar web UI管理界面，即可开始使用cpolar。  
7.登录完cpolar本地管理界面后，在“隧道管理”-“创建隧道”中，可以给SSH、CasaOS、qBittorrent、青龙等创建隧道，这样就可以实现远程访问了。但是要注意最好是先更改它们的默认端口和默认的账号密码再来创建才比较安全。  
8.常见的默认端口：  
`

- CasaOS：8181
- Cpolar：9200
- qBittorrent ：8080
- FAST OS DOCKER：8081
- 青龙：5700
- Home Assistant：8123  
`