---
title: 通过cpolar内网穿透实现远程访问内网飞牛OS-NAS
categories:
  - 软路由专栏
tags:
  - NAS
date: 2024-10-24 13:28:24
---



## 前言

随着数字化时代的到来，家庭和企业对于数据存储和远程访问的需求日益增加。网络附加存储（NAS）作为数据中心的重要组成部分，凭借其高扩展性、高可靠性和便捷性，已成为众多用户首选的数据存储解决方案。然而，传统的NAS设备在远程访问方面往往受限于网络环境，特别是在没有公网IP的情况下，如何实现远程访问成为了一个亟待解决的问题。

飞牛私有云fnOS NAS以其卓越的性能、强大的兼容性和智能化的管理界面，在NAS市场中脱颖而出。fnOS基于最新的Linux内核（Debian发行版）深度开发，不仅兼容主流x86硬件，还支持自由拓展和灵活扩容，为用户提供了前所未有的数据存储体验。然而，仅仅拥有优秀的NAS设备还不足以满足所有需求，特别是当需要在不同网络环境下进行远程访问时，内网穿透技术显得尤为重要。

Cpolar作为一款高效、稳定且易于使用的内网穿透工具，能够将本地服务暴露给外网用户访问。它支持https、tcp、等协议，且配置简单，使用方便。尤为重要的是，Cpolar提供了永久免费版，虽然带宽有限且域名随机变化，但对于日常远程访问和数据传输已足够应对。对于需要更高稳定性和更多功能的用户，Cpolar也提供了付费版本，以满足不同需求。

本文将详细介绍如何在飞牛私有云fnOS NAS上安装Cpolar穿透工具，并实现远程访问。通过本文的指导，您将能够轻松突破网络限制，随时随地访问您的NAS设备。无论您是家庭用户还是企业用户，本文都将为您提供有价值的参考和实用的解决方案。

接下来，我们将逐步介绍Cpolar的安装、配置和使用过程，帮助您快速上手并成功实现远程访问。请跟随我们的步伐，一起探索飞牛私有云fnOS NAS与Cpolar的无限可能。



## 1. 安装Cpolar工具

打开飞牛云NAS设置界面,开启ssh 连接,端口默认为22即可,开启后,我们就可以ssh 连接飞牛云NAS执行命令.

![image-20240904140930405](https://app.fekepj.com/list-tu/2024/10/24/2845afa50932e874686fce69913d68a4.png)

然后我们通过局域网IP ssh远程连接进去,因为该NAS是基于Linux 内核开发的,所以我们可以按照cpolar的Linux安装方法进行安装

![image-20240904142047011](https://app.fekepj.com/list-tu/2024/10/24/a3cebecf1d8ab9ba97e0b59cc5f15a79.png)

连接后执行下面cpolar Linux 安装命令

```shell
curl -L https://www.cpolar.com/static/downloads/install-release-cpolar.sh | sudo bash
```

Bash

Copy

执行这个命令后可能会出现卡主,可以看到这个位置是提示需要输入NAS用户名对应的密码,直接输入密码回车即可,期间没有报错表示安装成功

![image-20240904142640620](https://app.fekepj.com/list-tu/2024/10/24/cc0332a9bb13f795a7d6e38f5fe97be9.png)

然后执行下面系列命令来操作cpolar 服务

```shell
# 加入系统服务设置开机启动
sudo systemctl enable cpolar

# 启动cpolar服务
sudo systemctl start cpolar

# 重启cpolar服务
sudo systemctl restart cpolar

# 查看cpolar服务状态
sudo systemctl status cpolar

# 停止cpolar服务
sudo systemctl stop cpolar
```

Bash

Copy

启动cpolar服务后,我们通过NAS局域网IP访问9200端口,即可看到cpolar的web ui 管理界面,一切操作在管理界面操作即可,如果没有账号,可以进入下面cpolar官网注册,或者点击登陆按钮下面免费注册也可以跳转去免费注册,注册后登录即可,这样cpolar在飞牛云安装就完成了,下面我们通过cpolar设置远程访问飞牛云NAS.

> cpolar官网地址: [https://www.cpolar.com](https://www.cpolar.com/)

![image-20240904143832209](https://app.fekepj.com/list-tu/2024/10/24/3f1d0dbdb4b785be2801d619ad97e507.png)



## 2. 配置远程访问地址

登录后,在管理界面点击左侧仪表盘的隧道管理——创建隧道，创建一个飞牛云NAS 的公网http地址隧道!

- 隧道名称：可自定义命名，注意不要与已有的隧道名称重复
- 协议：选择http
- 本地地址：8000 (访问飞牛云界面的端口)
- 域名类型：免费选择随机域名
- 地区：选择China vip

点击`创建`(点击一次创建按钮即可,不要重复点击!)

![image-20240904144842844](https://app.fekepj.com/list-tu/2024/10/24/9da335da16620235460224629a4e97d9.png)

隧道创建成功后，点击左侧的状态——在线隧道列表,查看所生成的公网访问地址，有两种访问方式,一种是http 和https,两种都可以访问

![image-20240904144923655](https://app.fekepj.com/list-tu/2024/10/24/ba99764b8d010f095afeb2e710972040.png)



## 3. 远程访问飞牛云NAS

在浏览器输入上面我们创建的Cpolar 公网域名,可以看到成功访问了我们飞牛云NAS界面

![image-20240904145035277](https://app.fekepj.com/list-tu/2024/10/24/cc10b712926e6d2ef4f6127111231e2e.png)

同样我们输入账号密码,即可成功登录,这样一个远程访问的公网地址就设置好了,使用该地址可以在任意浏览器进行访问.

![image-20240904145157480](https://app.fekepj.com/list-tu/2024/10/24/b34b528bc1425a011db4d68e719ebc91.png)

**小结**

为了更好地演示，我们在前述过程中使用了cpolar生成的隧道，其公网地址是随机生成的。

这种随机地址的优势在于建立速度快，可以立即使用。然而，它的缺点是网址由随机字符生成，不太容易记忆（例如：7ff0466b.r12.vip.cpolar.cn）。另外，这个地址在24小时内会发生随机变化，更适合于临时使用。

我一般会使用固定二级子域名，原因是我希望将网址发送给同事或客户时，它是一个固定、易记的公网地址（例如：fnostest.cpolar.cn），这样更显正式，便于流交协作。



## 4. 固定远程访问地址

由于以上使用Cpolar所创建的隧道使用的是随机公网地址，24小时内会随机变化，不利于长期远程访问。因此我们可以为其配置二级子域名，该地址为固定地址，不会随机变化【ps：cpolar.cn已备案】

> 注意需要将cpolar套餐升级至基础套餐或以上，且每个套餐对应的带宽不一样。【cpolar.cn已备案】

[点击进入和登录Cpolar官网](https://dashboard.cpolar.com/)，点击左侧的预留，选择保留二级子域名，设置一个二级子域名名称，点击保留

![image-20240904150257232](https://app.fekepj.com/list-tu/2024/10/24/032c6de7c3edaa5a6580be29e3f3ca56.png)

保留成功后复制保留成功的二级子域名的名称

![image-20240904150447612](https://app.fekepj.com/list-tu/2024/10/24/be8f9750430528189ded55c50f3807e0.png)

返回登录cpolar web UI管理界面，点击左侧仪表盘的隧道管理——隧道列表，找到所要配置的隧道，点击右侧的编辑

![image-20240904150526977](https://app.fekepj.com/list-tu/2024/10/24/d162478b5468ead7232603a980b33f51.png)

修改隧道信息，将保留成功的二级子域名配置到隧道中

- 域名类型：选择二级子域名
- Sub Domain：填写保留成功的二级子域名

点击`更新`(注意,点击一次更新即可,不需要重复提交)

![image-20240904150553677](https://app.fekepj.com/list-tu/2024/10/24/df5c54ac981939ba401e3a0cd4a20793.png)

更新完成后,打开在线隧道列表,此时可以看到公网地址已经发生变化,地址二级名称变成了我们自己设置的二级子域名名称

![image-20240904150619186](https://app.fekepj.com/list-tu/2024/10/24/65a235d06017580703b5434396fd0a63.png)

再次打开浏览器,输入我们固定的cpolar公网地址,新地址访问可能需要登陆,登录后,可以看到同样访问成功了,这样一个固定的地址就设置好了,不用再担心地址会变化!

![image-20240904150712856](https://app.fekepj.com/list-tu/2024/10/24/e2a5bb915457140004092a0a70055d25.png)