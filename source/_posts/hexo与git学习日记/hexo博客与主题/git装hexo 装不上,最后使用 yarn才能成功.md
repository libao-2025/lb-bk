---
title: '装hexo 装不上,最后使用 yarn才能成功'
type: example
categories:
  - hexo与git学习日记
  - hexo博客与主题
sticky: 100
date: 2023-09-23 10:00:00
---

# 装hexo 装不上,最后使用 yarn才能成功

## **切换回默认 npm 注册表**：

在命令行中，使用以下命令切换回默认的 npm 注册表：

```
npm config set registry https://registry.npmjs.org
```

然后再次尝试全局安装 Hexo：

```
npm install -g hexo-cli
```



## ** npm 官方镜像的国内镜像**：

```
npm config set registry https://registry.npmmirror.com
```



然后再次尝试全局安装 Hexo。


### 安装 Hexo

1. **创建一个文件夹用于存放你的博客**：
- 打开命令提示符或终端，切换到你想存放 Hexo 博客的目录，然后创建一个新的文件夹，例如：

```
mkdir my-hexo-blog
cd my-hexo-blog
```

或者

```
mkdir my-hexo-blog
cd my-hexo-blog
```

2. **全局安装 Hexo**：
- 在你的博客文件夹中，使用 npm 安装 Hexo：

```
npm install -g hexo-cli
```

或者

```
sudo npm install -g hexo-cli
```

3. **初始化 Hexo 博客**：
- 使用 Hexo 初始化你的博客文件夹：

```
hexo init
```

4. **安装依赖**：
- 进入博客文件夹，然后安装项目依赖：

```
npm install
```


### 开始写作

1. **生成静态文件**：
- 在你的博客文件夹中，运行以下命令来生成静态文件：

```
 hexo generate
```

2. **启动本地服务器**：
- 运行以下命令来启动本地服务器并预览你的博客：

```
 hexo server
```

- 打开浏览器并访问 `http://localhost:4000`。

### 部署到远程服务器

1. *配置 `_config.yml`*：
- 在你的博客文件夹中，编辑 `_config.yml` 文件来配置部署信息。
2. **安装部署插件**：
- 安装一个部署插件，比如 `hexo-deployer-git`：

```
 npm install hexo-deployer-git --save
```

3. **部署到远程服务器**：
- 运行以下命令来部署你的博客：

```
 hexo deploy
```


这样，你就完成了 Hexo 的安装和配置。你可以按照 Hexo 的官方文档来进一步学习如何使用它，包括主题定制、插件使用等。祝你写作愉快！

用了上面方法都不好用，最后用了阿里云的源，接下来改用这个软件安装才能成功

### 使用 yarn

如果你遇到的问题持续存在，可以考虑使用 yarn 来代替 npm，因为 yarn 通常使用 HTTPS 代理而不是直接连接到 npm 注册表：

```
npm install -g yarn
yarn global add hexo-cli
```

尝试上述方法之一，应该能够解决你的问题并允许你安装 Hexo。如果问题依旧，你可能需要检查你的网络设置，确保你的网络可以访问外部资源。

最后再全局安装

```jsx
npm install -g hexo-cli
```

# 记录一下写文章的名字
这是在文章根目录下_posts建一个文章
```
hexo new "我的新文章"
```

这是在文章根目录下_posts建一个文章,再移动到 :技术文章/我的新文章5.md
```
hexo new "我的新文章5" -s -p 技术文章/我的新文章5.md
```

最后才成功

如果用hexo init安装失败可以删除原来的再用下面这行
```
hexo init --clone https://github.com.cnpmjs.org/hexojs/hexo-starter.git
```

最后更新博客时出现：
`
Run

  git config --global user.email "you@example.com"
  git config --global user.name "Your Name"
`
类似上面这样的话，必须执行下面的
全局设置用户名和邮箱：
```
git config --global user.name "lifuaini2019"
git config --global user.email "lifuaini2019@gmail.com"
```
---
如果只在当前仓库设置用户名和邮箱：

```
git config user.name "lifuaini2019"
git config user.email "lifuaini2019@gmail.com"
```
