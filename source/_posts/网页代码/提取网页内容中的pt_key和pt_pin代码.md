---
title: 提取网页内容中的pt_key和pt_pin代码
categories:
  - 网页代码
tags:
  - null
date: 2024-10-31 19:45:58
---

# 提取网页内容中的pt_key和pt_pin代码
在这篇博文中，我们将学习如何提取 `pt_key` 和 `pt_pin` 的值。
这是一个演示，也是一个能用的工具

 {% raw %}
<!DOCTYPE html>
<html lang="zh-CN">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>提取 pt_key 和 pt_pin</title>
</head>
<body>

<h1>提取 pt_key 和 pt_pin</h1>
<p>请在下面的文本框中输入内容，然后点击“提取”按钮。</p>

<!-- 输入框 -->
<textarea id="inputContent" rows="10" cols="50" placeholder="在此输入包含 pt_key 和 pt_pin 的文本"></textarea>
<br>
<button onclick="extractPtKeyAndPtPin()">提取</button>

<!-- 显示结果 -->
<div id="result"></div>

<script>
// Function to extract pt_key and pt_pin values from the input content
function extractPtKeyAndPtPin() {
    // Get the content from the textarea
    const content = document.getElementById("inputContent").value;

    // Regular expressions to match pt_key and pt_pin values
    const ptKeyRegex = /pt_key=([^;]*)/;
    const ptPinRegex = /pt_pin=([^;]*)/;
    
    // Extract pt_key
    const ptKeyMatch = content.match(ptKeyRegex);
    const ptKey = ptKeyMatch ? ptKeyMatch[1] : "未找到 pt_key";
    
    // Extract pt_pin
    const ptPinMatch = content.match(ptPinRegex);
    const ptPin = ptPinMatch ? ptPinMatch[1] : "未找到 pt_pin";
    
    // Display the extracted values in the result div
    const resultDiv = document.getElementById("result");
    resultDiv.innerHTML = `<p>pt_key: ${ptKey}</p><p>pt_pin: ${ptPin}</p>`;
}
</script>

</body>
</html>
{% endraw %}


---
## 下面是讲解
在 Markdown 文件中嵌入 JavaScript 代码

使用 `<script>` 标签将 JavaScript 代码嵌入 HTML 中，以下是一个示例这是一个index.html文件的所有代码：

```

<!-- HTML 和 JavaScript 代码 -->
<textarea id="inputContent" rows="10" cols="50" placeholder="在此输入包含 pt_key 和 pt_pin 的文本"></textarea>
<br>
<button onclick="extractPtKeyAndPtPin()">提取</button>
<div id="result"></div>

<script>
// 提取 pt_key 和 pt_pin 的 JavaScript 函数
function extractPtKeyAndPtPin() {
这里是代码........
}
</script>

```

### 禁用代码转义

Hexo 默认会对内容进行转义，可以通过 `{% raw %}...{% endraw %}` 标签包裹 JavaScript 代码，防止转义：

```
<!-- HTML 和 JavaScript 代码 -->
<textarea id="inputContent" rows="10" cols="50" placeholder="在此输入包含 pt_key 和 pt_pin 的文本"></textarea>
<br>
<button onclick="extractPtKeyAndPtPin()">提取</button>
<div id="result"></div>

{% raw %}
<script>
// 提取 pt_key 和 pt_pin 的 JavaScript 函数
function extractPtKeyAndPtPin() {
这里是代码........
}
</script>
{% endraw %}

```

上面这个方法也是可以的

 也可以通过 `{% raw %}...{% endraw %}包括所有代码例如：

```
{% raw %}
<!-- HTML 和 JavaScript 代码 -->
<textarea id="inputContent" rows="10" cols="50" placeholder="在此输入包含 pt_key 和 pt_pin 的文本"></textarea>
<br>
<button onclick="extractPtKeyAndPtPin()">提取</button>
<div id="result"></div>

<script>
// 提取 pt_key 和 pt_pin 的 JavaScript 函数
function extractPtKeyAndPtPin() {
这里是代码........
}
</script>
{% endraw %}
```

理论上都是可以的！

我就是用下面的方法这就是上面工具用到的所有代码：

```
{% raw %}
<!DOCTYPE html>
<html lang="zh-CN">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>提取 pt_key 和 pt_pin</title>
</head>
<body>

<h1>提取 pt_key 和 pt_pin</h1>
<p>请在下面的文本框中输入内容，然后点击“提取”按钮。</p>

<!-- 输入框 -->
<textarea id="inputContent" rows="10" cols="50" placeholder="在此输入包含 pt_key 和 pt_pin 的文本"></textarea>
<br>
<button onclick="extractPtKeyAndPtPin()">提取</button>

<!-- 显示结果 -->
<div id="result"></div>

<script>
// Function to extract pt_key and pt_pin values from the input content
function extractPtKeyAndPtPin() {
    // Get the content from the textarea
    const content = document.getElementById("inputContent").value;

    // Regular expressions to match pt_key and pt_pin values
    const ptKeyRegex = /pt_key=([^;]*)/;
    const ptPinRegex = /pt_pin=([^;]*)/;

    // Extract pt_key
    const ptKeyMatch = content.match(ptKeyRegex);
    const ptKey = ptKeyMatch ? ptKeyMatch[1] : "未找到 pt_key";

    // Extract pt_pin
    const ptPinMatch = content.match(ptPinRegex);
    const ptPin = ptPinMatch ? ptPinMatch[1] : "未找到 pt_pin";

    // Display the extracted values in the result div
    const resultDiv = document.getElementById("result");
    resultDiv.innerHTML = `<p>pt_key: ${ptKey}</p><p>pt_pin: ${ptPin}</p>`;
}
</script>

</body>
</html>
{% endraw %}
```

详细能用吧！直接复去创建一个html文件即可用了！
