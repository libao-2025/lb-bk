---
title: CloudFlare-R2-搭建个人图床
categories:
  - 网页代码
  - CloudFlare学习
tags:
  - 图床
  - 免费图床
  - R2
date: 2024-09-30 17:01:29
---





# CloudFlare R2 搭建个人图床教程



![](https://app.fekepj.com/list-tu/2024/09/30/d45b3e3f5717ae9a959c9306832817d3.png) 本文探讨了为何选择CloudFlareR2作为自建图床解决方案，强调了其免费额度、无需备案、易于设置的优点，以及与国内厂商如七牛云、腾讯云和阿里云的对比。作者提供了详细的步骤，包括创建R2存储桶、绑定域名和使用PicGo工具上传图片。

<img src="https://app.fekepj.com/list-tu/2024/09/30/6b3c3369b8e27ca0193c4ba13ebe4962.jpg" alt="112233" style="zoom:50%;" />

### 为什么搭建自己的图床

* 平时写博客都是使用 md 格式，要在多个平台发布时，图片需要有外链
* 后续如果博客迁移时，国内的博客网站，比如掘金，简书，语雀等都做了防盗链，图片不好迁移

### 为什么是[CloudFlare R2](https://dash.cloudflare.com/ "CloudFlare R2")

* 有白嫖额度
  
* 免费 [CDN](https://so.csdn.net/so/search?q=CDN&spm=1001.2101.3001.7020)
  
* 绑定域名不需要备案
  

[![image-20230329134100207](https://app.fekepj.com/list-tu/2024/09/30/34fe79ce575c841124cb10620e2623d2.png)](https://img.huacai.one/huacai-blog/image-20230329134100207.webp)

|          | 永久免费     | 超出部分/月费    |
| -------- | ------------ | ---------------- |
| 存储     | 10 GB/月     | 0.015 美元/GB    |
| A 类操作 | 100 万次/月  | 4.50 美元/百万次 |
| B 类操作 | 1000 万次/月 | 0.36 美元/百万次 |

> 免费额度足矣支撑[个人博客](https://lifu.us.kg)使用，即使超出之后，费用也是相当便宜  
> <br/>详细定价 [Pricing · Cloudflare R2 docs](https://developers.cloudflare.com/r2/pricing/ "Pricing · Cloudflare R2 docs")

### 为什么不是国内厂商

### 七牛云

* 有免费额度，但需要绑定国内已经备案的域名。但我不想备案，手续啰嗦，以后每年还要审核

### 腾讯云

* 没有免费额度，不符合白嫖教义
  
* 计费项目太多，看不懂
  

[![image-20230329135741344](https://app.fekepj.com/list-tu/2024/09/30/2d29e151ec3c0bef847f29e5cf0bf770.png)](https://img.huacai.one/huacai-blog/image-20230329135741344.webp)

### 阿里云

* 没有免费额度，不符合教义
  
* 收费贵，这个是一年的大陆下行流量包
  

[![image-20230329140520368](https://app.fekepj.com/list-tu/2024/09/30/f96fc4416b6a1356a87a2eeb981b976d.png)](https://img.huacai.one/huacai-blog/image-20230329140520368.webp)

### R2 存储桶

### 购买 R2 计划

> 需要信用卡，支持银联卡
>
> 
>
> 不需要预先付费，验证通过就行

[![image-20230329141037103](https://app.fekepj.com/list-tu/2024/09/30/4cd27e775f7a9a5a92086fc6024cb44d.png)](https://img.huacai.one/huacai-blog/image-20230329141037103.webp)

#### 创建存储桶

[![image-20230329140956155](https://app.fekepj.com/list-tu/2024/09/30/94d59f0d8e32b6a8c463c6c5b5ad1df8.png)](https://img.huacai.one/huacai-blog/image-20230329140956155.webp)

[![image-20230329141509927](https://app.fekepj.com/list-tu/2024/09/30/749336f20cad406a33cd5363c7e44468.png)

#### 给存储桶绑定域名

> 这一步的作用：使用自己的域名来访问文件

[![image-20230329145129395](https://app.fekepj.com/list-tu/2024/09/30/0b9ae30ffa58f8d0764fa234dac4eddf.png)

#### 设置允许公开访问

> 这一步很重要，如果不设置，上传图片后，是不能直接在公网访问的

> 没有设置之前会看到这样

[![image-20230329155051016](https://app.fekepj.com/list-tu/2024/09/30/982e96f85392d1d54d449c77826856a1.png)

设置之后可以看到，已经允许公共访问，到这一步，桶的配置已经完成

![image-20230329143329508](https://app.fekepj.com/list-tu/2024/09/30/bc8a4c2e7eac21d8591b7aa416744740.png)

### 使用 PicGo 上传图片到 R2

### 创建 R2 API 令牌

[![image-20230329143642364](https://app.fekepj.com/list-tu/2024/09/30/34f60d520f8a4da364d4d0ba91580c76.png)](https://img.huacai.one/huacai-blog/image-20230329143642364.webp)

[![image-20230329143706922](https://app.fekepj.com/list-tu/2024/09/30/6483961c17d341b9beb06e053a804fb1.png)](https://img.huacai.one/huacai-blog/image-20230329143706922.webp)

[![image-20230329143847902](https://app.fekepj.com/list-tu/2024/09/30/04fd053ec4dedf3064c0a93687c9b34c.png)

[![image-20230329143925030](https://app.fekepj.com/list-tu/2024/09/30/1d39820ab04f014004d4e0c5c0fd65ab.png)

> 务必保存好这两个，下面用到

### 配置 PicGo

> 安装 PicGo 详细步骤，[看着里](https://picgo.github.io/PicGo-Doc/zh/guide/#picgo-is-here "看着里")

#### 安装 S3 插件

![image-20230329144107915](https://app.fekepj.com/list-tu/2024/09/30/279a6956b204d46a543d6b413dbe2a45.png)

#### 这是别人的设置方法



![](https://app.fekepj.com/list-tu/2024/09/30/daf4dd91509028bc24af7f970d279f44.webp)



#### 下面这个是我的设置方法:

![](https://app.fekepj.com/list-tu/2024/09/30/e57975eeeac43cd124bbbf7c359b78b3.png)

如果要上传在根目录下的list-tu/......下面的

要在自定义域名后面也加上这个list-tu





配置完成这里，就能愉快的上传图片啦!



#### 路径的解释

- `{year}`: 表示年份，替换为四位数字的年份。
- `{month}`: 表示月份，替换为两位数字的月份，例如 `01` 到 `12`。
- `{day}`: 表示日期，替换为两位数字的日期，例如 `01` 到 `31`。
- `{md5}`: 表示文件的MD5哈希值，替换为32位十六进制数字。
- `{extName}`: 表示文件的扩展名，替换为原始文件的扩展名，如 `.txt`, `.jpg`, `.pdf` 等。

好啦，希望你的博客玩得痛快！！！！！！

