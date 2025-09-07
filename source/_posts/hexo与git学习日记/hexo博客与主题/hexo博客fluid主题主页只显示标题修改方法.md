---
title: hexo博客fluid主题主页只显示标题修改方法
categories:
  - hexo与git学习日记
  - hexo博客与主题
tags:
  - fluid主题
  - hexo主页
date: 2024-09-26 16:11:37
---


# hexo博客fluid主题主页只显示标题修改方法
只要更改一个文件即可
博客根目录下的\themes\fluid\layout\index.ejs
把上面的代码改成以下的即可
## 只显示标题：
```
<%
if (theme.index.slogan.enable) {
  page.subtitle = theme.index.slogan.text || config.subtitle || ''
}
page.banner_img = theme.index.banner_img
page.banner_img_height = theme.index.banner_img_height
page.banner_mask_alpha = theme.index.banner_mask_alpha
%>

<% page.posts.each(function (post) { %>
  <div class="row mx-auto index-card">
    <% var post_url = url_for(post.path), index_img = post.index_img || theme.post.default_index_img %>
    <% if (index_img) { %>
      <div class="col-12 col-md-4 m-auto index-img">
        <a href="<%= post_url %>" target="<%- theme.index.post_url_target %>">
          <img src="<%= url_for(index_img) %>" alt="<%= post.title %>">
        </a>
      </div>
    <% } %>
    <article class="col-12 col-md-<%= index_img ? '8' : '12' %> mx-auto index-info">
      <h2 class="index-header">
        <% if (theme.index.post_sticky && theme.index.post_sticky.enable && post.sticky > 0) { %>
          <i class="index-pin <%= theme.index.post_sticky && theme.index.post_sticky.icon %>" title="Pin on top"></i>
        <% } %>
        <a href="<%= post_url %>" target="<%- theme.index.post_url_target %>">
          <%= post.title %>
        </a>
      </h2>

    </article>
  </div>
<% }) %>

<%- partial('_partials/paginator') %>

```


改了上面即可了！！！
如果想更详细可以看下面从 `</article>`前面加入即可


## 摘要显示(这份没注释)

```
 <a class="index-excerpt" href="<%= post.url %>" target="<%- theme.index.post_url_target %>"> <div> <%- strip_html(excerpt).substring(0, 200).trim().replace(/\n/g, ' ') %> </div> </a> 

```

## 日期、分类、标签等元数据显示（这份是注释的）


```

<!-- 
<div class="index-btm post-metas"> <% if (theme.index.post_meta.date) { %> <div class="post-meta mr-3"> <i class="iconfont icon-date"></i> <time datetime="<%= full_date(post.date, 'YYYY-MM-DD HH:mm') %>" pubdate> <%- date(post.date, config.date_format) %> </time> </div> <% } %> <% if (theme.index.post_meta.category && post.categories.length > 0) { %> <div class="post-meta mr-3 d-flex align-items-center"> <i class="iconfont icon-category"></i> <%- partial('_partials/category-chains', { categories: post.categories, limit: 1 }) %> </div> <% } %> <% if (theme.index.post_meta.tag && post.tags.length > 0) { %> <div class="post-meta"> <i class="iconfont icon-tags"></i> <% post.tags.each(function(tag){ %> <a href="<%= url_for(tag.path) %>">#<%- tag.name %></a> <% }) %> </div> <% } %> </div> 
-->

```

注意，如果要注释，在代码前一行加入, 上面两段一份一注释，一份没注释的！

```
<!-- 
```

代码后下一行加入

```
-->
```

即可！！！


## 还有这两种种设置方法：
### 第一种方法

* 用文本编辑器打开 themes/ 目录下的对应的主题的theme文件夹下的 _config.yml 文件，找到这段代码，如果没有则新建，可能不同的主题会不支持这种方法：

```
# Automatically Excerpt. Not recommend.  
# Please use <!-- more --> in the post to control excerpt accurately.  
auto_excerpt:  
  enable: false  
  length: 150
 
```

把 enable 的 false 改成 true 就行了，然后 length 是设定文章预览的文本长度。
修改后重启 hexo 就ok了。

* 
### 第二种方法

* 在你写 md 文章的时候，可以在内容中加上 `<!--more-->`，这样首页和列表页展示的文章内容就是 `<!--more-->` 之前的文字，而之后的就不会显示了。

效果上面两种方式展示出来的效果是不一样的。

第一种修改 _config.yml 文件的效果是会格式化你文章的样式，直接把文字挤在一起显示，最后会有 …。

而第二种加上 `<!--more-->`展示出来的就是你原本文章的样式，最后不会有…。


### 第三种方式

* 在文章的 `front-matter` 中添加 `description`，并提供文章摘录


```
---  
title: 让hexo的首页只显示文章的部分内容而不是全部  
id: set-hexo-show-more-button-on-index  
categories:  
- WEB开发  
date: 2017-09-30 11:01:40  
tags:  
- blog  
- hexo  
description: Hexo 的 Next 主题默认是首页显示你每篇文章的全文内容，那么要如何设置只显示部分呢？正如你现在看到的本篇文章，只显示到这里。  
---

```


但是使用这种方式生成的描述信息在文章的详情页是不再显示的。


## 总结

各种方式展示的效果各有好处，第二种方法保留了样式而且可以自行选择显示哪些内容来预览，推荐使用此方法，第一种方法显示的每篇文章的预览都是一样的高度，第三种则需要在文章的[front-matter]里面添加。
综合考虑的话还是建议使用第二种方法，毕竟以后各种插件也能准确的获取到你想要输出的本篇的描述信息。

