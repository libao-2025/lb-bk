---
title: 20元的玩客云刷CasaOS加装jellyfin
categories:
  - 软路由专栏
tags:
  - 玩客云
  - 玩客云刷机
date: 2024-10-19 11:31:27
---

# 20元的玩客云刷CasaOS加装jellyfin

## 20块的NAS，支持海报墙？xiaoya+alist+内网穿透+jellyfin硬解



视频地址： [20块的NAS，支持docker xiaoya alist 内网穿透 jellyfin 解码部署教程](https://www.bilibili.com/video/BV1dM4m1f7t9)



**理论上支持所有 armhf 架构的各类盒子**，至于硬解嘛，要看机器性能了~



**一、拆机**

重点讲一下：

吹热把胶软化后，从SD卡口横向插入摆动下，慢慢来，就像对待你的女朋友一样~

![img](https://app.fekepj.com/list-tu/2024/10/19/115a9463ec5a7ac52f86fb4ba9a779d5.avif)吹热软化胶板

![img](https://app.fekepj.com/list-tu/2024/10/19/7a189e08a78a59e510134f736b80678e.avif)从SD卡处插入





**二、刷机**

烧录最新armbian底包到eMMC，你可以在GitHub的armbian官网上找到它，并下载下来，当然我也在分享里也提供给了大家。

需要注意的是，第一次刷机的时候请先连接号USB数据线，然后选择img底包，勾选擦除flash和bootloader，点击开始后，短接刷机触点，然后接通电源。





**
**

**三、安装CasaOS（面板管理工具）**

**1、finashell（或其他远程终端）连接到设备后，修改系统时区：**

输入timedatectl                        #可以看到当前时区信息

输入timedatectl list-timezones             #可查看可选时区

输入timedatectl set-timezone Asia/Shanghai #将时区设置为中国标准时间

**2、终端输入：**

nano /etc/apt/sources.list

用#注释掉自带的软件源，在文件最后添加清华大学镜像源地址

deb https://mirrors.tuna.tsinghua.edu.cn/ubuntu-ports/ jammy main restricted universe multiverse

\# deb-src https://mirrors.tuna.tsinghua.edu.cn/ubuntu-ports/ jammy main restricted universe multiverse

deb https://mirrors.tuna.tsinghua.edu.cn/ubuntu-ports/ jammy-updates main restricted universe multiverse

\# deb-src https://mirrors.tuna.tsinghua.edu.cn/ubuntu-ports/ jammy-updates main restricted universe multiverse

deb https://mirrors.tuna.tsinghua.edu.cn/ubuntu-ports/ jammy-backports main restricted universe multiverse

\# deb-src https://mirrors.tuna.tsinghua.edu.cn/ubuntu-ports/ jammy-backports main restricted universe multiverse

deb http://ports.ubuntu.com/ubuntu-ports/ jammy-security main restricted universe multiverse

\# deb-src http://ports.ubuntu.com/ubuntu-ports/ jammy-security main restricted universe multiverse

按ctrl+x键退出编辑，输入y保存，回车

**3、更新软件源数据：**

apt-get update

**4、更新完成后使用casaos一键安装命令，完成部署：**

curl -fsSL https://get.casaos.io | sudo bash

![img](https://app.fekepj.com/list-tu/2024/10/19/1e41b6f9ca8a549a6d29f9391bda477c.avif)CasaOS系统（管理面板）



**
**

**四、xiaoya影音超集部署**

**1、新建/mnt/docker/xiaoya文件夹；**

**2、根据mytoken.txt、myopentoken.txt、temp_transfer_folder_id.txt 内的连接，用手机扫码获得到对应的配置数据，覆盖掉原来的txt文档内容保存，docker_address.txt不用变动，然后上传到新建好的xiaoya文件夹内；**

![img](https://app.fekepj.com/list-tu/2024/10/19/abf250318837c782ab1a44b08869e0d6.avif)配置文件

**3、终端输入命令对docker文件夹提权：**

chmod -R 777 /mnt/docker

**4、执行xiaoya-alist一键安装命令完成安装：**

docker run -d --restart=always --name="xiaoya" -p 5678:80 -p 2345:2345 -p 2346:2346 -v /mnt/docker/xiaoya:/data xiaoyaliu/alist:latest

**5、xiaoya启动情况查看：**

docker logs -f xiaoya   #查看xiaoya容器运行日志，等待日志显示xx@版本后以后说明加载完成，就可以通过设备IP:5678 访问xiaoya-alist了，此时已经可以在网页上进行播放了。

![img](https://app.fekepj.com/list-tu/2024/10/19/a683be7dad7e69a03434197eb5d9fd30.avif)xiaoya-alist网页端

![img](https://app.fekepj.com/list-tu/2024/10/19/5ae56fbcc2dc071cf41175a936e4ea15.avif)播放测速

模式0：每天自动清理一次。如果系统重启需要手动重新运行或把命令加入系统启动

bash -c "$(curl -s https://xiaoyahelper.ddsrem.com/aliyun_clear.sh | tail -n +2)" -s 0

模式1：一次性清理，一般用于测试效果

bash -c "$(curl -s https://xiaoyahelper.ddsrem.com/aliyun_clear.sh | tail -n +2)" -s 1

模式2：已废弃，不再支持

模式3：创建一个名为 xiaoyakeeper 的docker定时运行小雅转存清理并升级小雅镜像

bash -c "$(curl -s https://xiaoyahelper.ddsrem.com/aliyun_clear.sh | tail -n +2)" -s 3

模式4：同模式3

模式5：与模式3的区别是实时清理，只要产生了播放缓存一分钟内立即清理。签到和定时升级同模式3

bash -c "$(curl -s https://xiaoyahelper.ddsrem.com/aliyun_clear.sh | tail -n +2)" -s 5

**7、在CasaOS中，使用Appstore中安装alist，并根据视频操作完成xiaoya的套娃挂载。**

![img](https://app.fekepj.com/list-tu/2024/10/19/ed9aae3e03c9f8f234f3a8f11f67c25c.avif)alist挂载xiaoya-alist





**五、免费内网穿透，实现外网访问设备**

**1、访问cpolar官网：**

https://www.cpolar.com/  注册账号并登录

**2、下载linux arm的安装程序，并解压缩的到cpolar；**

**3、上传 cpolar到 /mnt 目录；**

**4、终端依次执行：**

cd /mnt

chmod -R 777 cpolar

**5、回到colar个人页面，获得带有账号密钥的执行命令，并在SSH终端执行该命令；**

**6、将内cpolar加入到系统自启：**

systemctl start cpolar    #cpolar添加到系统

systemctl enable cpolar  #cpolar添加到系统启动项







**六、TV-box挂载xiaoya-alist**

1、安装影视仓.apk（tvbox二次开发版本）

2、配置地址

小雅：http://设备IP:5678/tvbox/my.json

多仓聚合：http://设备IP:5678/tvbox/my_ext.json

！xiaoya-alist内置了多条线路，大家按需使用~

守护进程的的运行除了会清楚网盘缓存外，还会自动更新很多配置地址

![img](https://app.fekepj.com/list-tu/2024/10/19/7cefed91ad34d982a7285c6aa7f9001c.avif)tvbox挂载xiaoya-alist





**七、jellyfin挂载xiaoya影视库**

**1、浏览访问xiaoya网页，将 /元数据/jellyfin/all_if.mp4 影视库数据下载下来（也可以是/元数据all.mp4）;**

**2、用7z解压缩工具根据自己的需求解压缩影视文件；**

**3、SSH格式化硬盘（U盘）：**

fdisk -l            #查看硬盘系统路径，我这里是在/dev/sda

mkfs.ext4 /dev/sda  #将硬盘格式化为linux系统的Ext4格式

**4、格式化完成后，将硬盘（U盘）插入PC，打开diskgenius，依次新建/xiaoya/media文件夹，并将解压好的数据文件夹复制到/xiaoya/media文件夹内后，插回设备；**

**5、硬盘开启自动挂载：**

新建 /mnt/devdata 文件夹

ssh输入

blkid           #查看硬盘UUID号

nano /etc/fstab   #编辑开机挂载文件

UUID=你设备的UUID号 /mnt/devdata ext4 noatime,acl,user_xattr 0 2   #将开机挂载命令填入文件底部

ctrl+x y 回车

mount -a       #挂载所有硬盘设备

nano /etc/hosts  #编辑hosts文件

127.0.0.1   xiaoya.host  #填入文件底部

ctrl+x y 回车

**6、jellyfin部署准备**

新建 /mnt/devdata/docker/jellyfin 文件夹，并在jellyfin文件夹下新建 config cache 两个文件夹，上传assfonts和fonts文件夹，再上传ffmpeg的arm解码包

**7、解码包安装：**

chmod -R 777 /mnt/devdata/docker   #提权

chmod -R 777 /dev/dri             #提权

apt-get install -f                   #依赖修复命令

执行命令，安装解码依赖：

apt-get install libbluray2 libdrm2 libmp3lame0 libopenmpt0 libopus0 libtheora0 libvorbis0a libvorbisenc2 libvpx7 libwebp7 libwebpmux3 libx264-163 libx265-199 libzvbi0 ocl-icd-libopencl1 libopencl1 libopencl-1.2-1

转到ffmpeg安装文件在路径

cd /mnt/docker/jellyfin

dpkg -i jellyfin-ffmpeg6_6.0.1-6-jammy_armhf.deb  #安装ffmpeg解码包

**8、部署官方jellyfin：**

docker run -d --name=jellyfin \

--device /dev/dri/renderD128:/dev/dri/renderD128 \

-v /mnt/devdata/docker/jellyfin/config:/config:rw \

-v /mnt/devdata/docker/jellyfin/cache:/cache:rw \

-v /mnt/devdata/docker/jellyfin/fonts:/usr/share/fonts/truetype/dejavu \

-v /mnt/devdata/docker/jellyfin/assfonts:/assfont \

-v /mnt:/mnt \

--net=host \

--restart=always \

jellyfin/jellyfin

![a](https://app.fekepj.com/list-tu/2024/10/19/b27f756ee77c1cb98d6a09eb046a8743.avif)jellyfin部署完成



相关软件包和工具详见：[20块的NAS，支持docker xiaoya alist 内网穿透 jellyfin 解码部署教程](https://www.bilibili.com/video/BV1dM4m1f7t9/?spm_id_from=333.976.0.0) 置顶评论

**感谢你的一键三连+关注哦**
