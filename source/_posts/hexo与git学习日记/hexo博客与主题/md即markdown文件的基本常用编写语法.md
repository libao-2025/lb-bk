---
title: md即markdown文件的基本常用编写语法
categories:
  - hexo与git学习日记
  - hexo博客与主题
tags:
  - markdown
date: 2024-09-24 11:31:48
---


## X.md即markdown文件的基本常用编写语法



## 

## 序言:

很久没有写博客了，感觉只要是不写博客，人就很变得很懒，学的知识点感觉还是记不住，渐渐地让我明白，看的越多，懂的越少（你这话不是有毛病吗？应该是看的越多，懂的越多才对），此话怎讲，当你在茫茫的前端知识库里面东看看，西看看的时候，很快就被海量的知识给淹没了，根本就不知道哪些是对的，哪些是错的，感觉好像这个也懂了，那个也懂了，但是真正写起来，脑子又一片空白，又好像什么都不懂，这种状态时有发生，这就叫不懂装懂，最根本的原因就是看的太多，写的太少，所以为了改掉这样毛病，把被动学习变成主动学习，接下来的日子，多写写，即使是写一些学习工作中遇到的坑也是好的，没事翻出来看看，还可以加深印象，好了，废话到处！

起因：

因为现在的前端基本上都用上了前端构建工具，那就难免要写一些readme等等的说明性文件，但是这样的文件一般都是.md的文件，编写的语法自然跟其他格式的文件有所区别，置于为什么要用这种格式的文件，不要问我，我也不知道，大家都这么用，跟着用就对了，如果有大神知道的，不妨告知小弟，本文也是我学习写markdown文件的一个笔记吧，仅供参考！

正文：

1、标题的几种写法：

第一种：

![](https://app.fekepj.com/tu/bkt001/f2ed5a631625906b7789b609731a4193.png)

&nbsp;  

![](https://app.fekepj.com/tu/bkt001/41ece93bad17e726b03ac58e66ca20a0.png)

前面带#号，后面带文字，分别表示h1-h6,上图可以看出，只到h6，而且h1下面会有一条横线，注意，#号后面有空格

第二种：

![](https://app.fekepj.com/tu/bkt001/f59a2283bc30cb04713b87370e3adabf.png)

&nbsp;   

![](https://app.fekepj.com/tu/bkt001/cb584b1ee202c0c92e6aff95ec6f659e.png)

这种方式好像只能表示一级和二级标题，而且=和-的数量没有限制，只要大于一个就行

第三种：

![](https://app.fekepj.com/tu/bkt001/a22993be2a7baf921902c317cd8e9517.png)

&nbsp;  

![](https://app.fekepj.com/tu/bkt001/ce069df1d0ce1926515a4789f24cff7a.png)

这里的标题支持h1-h6，为了减少篇幅，我就偷个懒，只写前面二个，这个比较好理解，相当于标签闭合，注意，标题与#号要有空格

那既然3种都可以使用，可不可以混合使用呢？我试了一下，是可以的，但是为了让页面标签的统一性，不建议混合使用，推荐使用第一种，比较简洁，全面

为了搞清楚原理，我特意在网上搜一下在线编写markdown的工具，发现实际上是把这些标签最后转化为html标签，如图：

![](https://app.fekepj.com/tu/bkt001/7e00926e04789aad6164b7da22182fc2.png)

在线地址请看这里： [markdown在线编辑](http://tool.oschina.net/markdown/) （只是想看看背后的转换原理，没有广告之嫌）

2、列表

我们都知道，列表分为有序列表和无序列表，下面直接展示2种列表的写法：

![](https://app.fekepj.com/tu/bkt001/f8b713e274fdc13aa1f55c8c0acf4f5a.png)

&nbsp;  

![](https://app.fekepj.com/tu/bkt001/108786213f67f5d95b811c6cd7375bae.png)

可以看到，无序列表可以用\* ， + ， — 来创建，用在线编辑器看，实际上是转换成了ul>li ，所以使用哪个都可以，推荐使用\*吧

![](https://app.fekepj.com/tu/bkt001/202f862274ba8c00c1fab46df4490ecf.png)

&nbsp;   

![](https://app.fekepj.com/tu/bkt001/084d468e6bc474a01468abbfa4eee6c4.png)

有序列表就相对简单一点，只有这一种方式，注意，数字后面的点只能是英文的点，特别注意，有序列表的序号是根据第一行列表的数字顺序来的，比如说：

![](https://app.fekepj.com/tu/bkt001/be6d8b0c69b10a2f3eae6bb29358a5e6.png)

&nbsp; 

![](https://app.fekepj.com/tu/bkt001/38a5647f4b9a2263d37aba81b70097ca.png)

&nbsp; 

![](https://app.fekepj.com/tu/bkt001/be5baea12cebb58e6e613625565a6ac1.png)

&nbsp; 

![](https://app.fekepj.com/tu/bkt001/cff63f0bcc15d480f890b0b176f07559.png)

第一组本来是3 2 1 倒序，但是现实3 4 5 ，后面一组 序号是乱的， 但是还是显示 3 4 5 ，这点必须注意了

3、区块引用

比如说，你想对某个部分做的内容做一些说明或者引用某某的话等，可以用这个语句

![](https://app.fekepj.com/tu/bkt001/c02cb3524fdc68b8fa151bdc5d3ba678.png)

&nbsp; 

![](https://app.fekepj.com/tu/bkt001/9978ebe3defae1acafb90e9c88e7873b.png)

无序列表下方的便是引用，可以有多种用途，看你的需求了，用法就是在语句前面加一个 > ，注意是英文的那个右尖括号，注意空格

引用因为是一个区块，理论上是应该什么内容都可以放，比如说：标题，列表，引用等等，看看下图：

![](https://app.fekepj.com/tu/bkt001/b2fb89cb4f2346d752b8855a4f3d39cc.png)

&nbsp;  

![](https://app.fekepj.com/tu/bkt001/4de9001ac0a8473b521d2b3bb91f7a64.png)

将上面的代码稍微改一下，全部加上引用标签，就变成了一个大的引用，还有引用里面还有引用，那引用嵌套引用还没有别的写法呢？

![](https://app.fekepj.com/tu/bkt001/b6b963fa427caf6771100d5ae6676bce.png)

&nbsp;   

![](https://app.fekepj.com/tu/bkt001/56b0e28ebd482670b506b23482a1baac.png)

上图可以看出，想要在上一次引用中嵌套一层引用，只需多加一个>，理论上可以无限嵌套，我就不整那么多了，注意：多层嵌套的>是不需要连续在一起的，只要在一行就可以了，中间允许有空格，但是为了好看，还是把排版搞好吧

4、华丽的分割线

分割线可以由\* - \_（星号，减号，底线）这3个符号的至少3个符号表示，注意至少要3个，且不需要连续，有空格也可以

![](https://app.fekepj.com/tu/bkt001/5da3ad04b885755af62e517ca539b530.png)

&nbsp;  

![](https://app.fekepj.com/tu/bkt001/debfb8c6e9aac4fdabf375d2713f3ade.png)

应该看得懂吧，但是为了代码的排版好看，你们自己定规则吧，前面有用到星号，建议用减号

5、链接

支持2种链接方式：行内式和参数式，不管是哪一种，链接文字都是用 \[方括号\] 来标记。

![](https://app.fekepj.com/tu/bkt001/9a4e9492bbd89c77f5f99c1be50401b0.png)

&nbsp;   

![](https://app.fekepj.com/tu/bkt001/c9fd3c5389747e4a56cf53042d292655.png)

上图可知，行内式的链接格式是：链接的文字放在\[\]中，链接地址放在随后的（）中，举一反三，经常出现的列表链接就应该这样写：

![](https://app.fekepj.com/tu/bkt001/396ff21bfee217e0373915f2bf157814.png)

&nbsp; 

![](https://app.fekepj.com/tu/bkt001/6fe7940269e5173036fca7240c98c5e4.png)

链接还可以带title属性，好像也只能带title，带不了其他属性，注意，是链接地址后面空一格，然后用引号引起来

![](https://app.fekepj.com/tu/bkt001/90bdf12741bf16e62188625b58623d8b.png)

这是行内式的写法，参数式的怎么写：

![](https://app.fekepj.com/tu/bkt001/a89f201b6479e1aeaa8231ad5d5ba4d1.png)

&nbsp;   

![](https://app.fekepj.com/tu/bkt001/8d48d25adb822507a527433096afc819.png)

这就好理解了，就是把链接当成参数，适合多出使用相同链接的场景，注意参数的对应关系，参数定义时，这3种写法都可以：

\[foo\]: http://example.com/ "Optional Title Here"

\[foo\]: http://example.com/ 'Optional Title Here'

\[foo\]: http://example.com/ (Optional Title Here)

还支持这种写法，如果你不想混淆的话：

\[foo\]: &lt;http://example.com/&gt; "Optional Title Here"

其实还有一种隐式链接的写法，但是我觉得那种写法不直观，所以就不写了，经常用的一般就上面2种，如果你想了解隐式链接，可以看我文章最后放出的参考地址

6、图片

图片也有2种方式：行内式和参数式，

![](https://app.fekepj.com/tu/bkt001/1ec2474a4caf50708e002c6acd029135.png)

&nbsp;  

![](https://app.fekepj.com/tu/bkt001/e6eb0fd3195f3960e9698078cb4237b8.png)

用法跟链接的基本一样，唯一的不同就是，图片前面要写一个！（这是必须的），没什么好说的

7、代码框

这个就比较重要了，很多时候都需要展示出一些代码

如果代码量比较少，只有单行的话，可以用单反引号包起来，如下：

![](https://app.fekepj.com/tu/bkt001/58e3d1c28f85e315deb0598f2607a407.png)

&nbsp;  

![](https://app.fekepj.com/tu/bkt001/d3ae45387053dd7b74a16756dfa48361.png)

要是多行这个就不行了，多行可以用这个：

![](https://app.fekepj.com/tu/bkt001/b508729c735cdfa8c4935b5608bd2e0e.png)

&nbsp;   

![](https://app.fekepj.com/tu/bkt001/8f56311bc4957f68f0779faf76ae0570.png)

多行用三个反引号，如果要写注释，可以在反引号后面写

8、表格

这个写的有点麻烦，注意看

![](https://app.fekepj.com/tu/bkt001/d8b71364a405fe77fce91765d97ec77a.png)

&nbsp;   

![](https://app.fekepj.com/tu/bkt001/7fa416bf94e020d94bc4369403de4a04.png)

从这3种不同写法看，表格的格式不一定要对的非常起，但是为了好看，对齐肯定是最好的，第一种的分割线后面的冒号表示对齐方式，写在左边表示左对齐，右边为右对齐，两边都写表示居中，还是有点意思的，不过现实出来的结果是，表格外面并没有线框包起来，不知道别人的怎么弄的

9、强调

![](https://app.fekepj.com/tu/bkt001/732a1d4fff9f7227bc613286fcda23b0.png)

&nbsp;    

![](https://app.fekepj.com/tu/bkt001/94ca053916dd2ea61b04b9d741950d91.png)

一个星号或者是一个下划线包起来，会转换为&lt;em&gt;倾斜，如果是2个，会转换为&lt;strong&gt;加粗

10、转义

![](https://app.fekepj.com/tu/bkt001/e05b3a12a4c9f5ff9c1fa9c923cd5a68.png)

&nbsp;    

![](https://app.fekepj.com/tu/bkt001/8013c899aa5512caed302b5576ec7e1d.png)

就不一一列举了，基本上跟js转义是一样的

11、删除线

![](https://app.fekepj.com/tu/bkt001/6f0f09efbe7c3e6043f977b1ad479b5d.png)

&nbsp;  

![](https://app.fekepj.com/tu/bkt001/6c916ef78bdcc46930f921f1ce04f258.png)

常用的基本上就这些了，如果还有一些常用的，可以跟我留言，我补充上去，我觉得图文并茂才是高效学习的正确姿势，但愿为你的学习带来帮助！