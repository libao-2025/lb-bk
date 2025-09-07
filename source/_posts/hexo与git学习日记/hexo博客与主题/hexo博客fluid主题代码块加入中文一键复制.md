---
title: hexo博客fluid主题代码块加入中文一键复制
categories:
  - hexo与git学习日记
  - hexo博客与主题
tags:
  - hexo
  - 网页代码
date: 2024-09-26 21:33:29
---

# hexo博客fluid主题代码块加入中文一键复制！

## 本次讲的是fluid主题
*每个主题可能修改方法不一样，但可以作为参考
找到这个文件用文件编器打开
`博客根目录下\themes\fluid\source\js\plugins.js`

键复制按钮旁边出现不同的英文字母（如 PERL、MIPSASM、AVRASM），这是因为代码块检测到的编程语言在每个代码块中会有所不同。通过这段代码，按钮会显示代码块中指定的语言。

要在按钮旁边加入中文 “一键复制”，你可以修改如下部分代码：


``` 
copyTmpl += 'LANG';
```

可以改为：


```
copyTmpl += '<span>一键复制</span>';
```

这会在在右边的复制按钮后面添加 “一键复制” 文本。
这样点击一键复制如果复制成功就会出现一个打钩！

## 打钩改成：复制成功

上面的代码的复制成功是一个打钩，修改成：复制成功，4个中文字？

要修改“复制成功”的提示为“复制成功”四个中文字，你需要找到复制成功的反馈逻辑，并替换显示的图标或文字。
在你的代码中，`ClipboardJS` 负责处理复制成功事件，这一段代码处理成功后的反馈：

```javascript
clipboard.on('success', function(e) {
  e.clearSelection();
  e.trigger.innerHTML = e.trigger.innerHTML.replace('icon-copy', 'icon-success');
  setTimeout(function() {
    e.trigger.innerHTML = e.trigger.innerHTML.replace('icon-success', 'icon-copy');
  }, 2000);
});
```
其中 `icon-copy` 和 `icon-success` 是表示复制按钮状态的图标。在这里，你可以直接用文字代替图标。你可以把 `e.trigger.innerHTML` 替换为你想要显示的 “复制成功” 字符串。
修改为以下代码即可：


```javascript
clipboard.on('success', function(e) {
  e.clearSelection();
  e.trigger.innerHTML = '复制成功';  // 复制成功后显示的文字
  setTimeout(function() {
    e.trigger.innerHTML = '<i class="iconfont icon-copy"></i>一键复制';  // 恢复成原始的复制按钮
  }, 2000);
});
```

### 解释： 
 
1. `e.trigger.innerHTML = '复制成功';` 将复制成功时的反馈修改为“复制成功”四个中文字。
 
2. `setTimeout` 过2秒后恢复按钮的状态为原来的 "一键复制" 和复制图标。

这样，你在每次复制成功时，会看到 “复制成功” 四个字，而不是打钩的图标。

