---
title: GPT学习修改Workers网页内容显示
categories:
  - GPT问答类
tags:
  - GPT学习
date: 2024-10-16 16:19:18
---


# GPT学习修改Workers网页内容显示
你好，我想和你聊一下这份代码
`
const html404 = `<!DOCTYPE html> `<body>  <h1>404 Not Found.</h1>  <p>The url you visit is not found.</p> </body>` ` const statichtml = "https://www.fekepj.com/"  async function randomString (len) {    len = len || 6    let $chars = 'ABCDEFGHJKMNPQRSTWXYZabcdefhijkmnprstwxyz2345678'    /****默认去掉了容易混淆的字符oOLl,9gq,Vv,Uu,I1****/    let maxPos = $chars.length    let result = ''    for (let i = 0; i < len; i++) {        result += $chars.charAt(Math.floor(Math.random() * maxPos))    }    return result } async function checkURL (URL) {    let str = URL    let Expression = /http(s)?:\/\/([\w-]+\.)+[\w-]+(\/[\w- .\/?%&=]*)?/    let objExp = new RegExp(Expression)    return objExp.test(str) && str[0] === 'h' } async function save_url (URL, shortStr) {    console.log("shortStr:", shortStr)    let random_key    if (!shortStr) {        random_key = await randomString()    } else {        random_key = shortStr    }    let is_exist = await tz.get(random_key)    console.log(is_exist)    if (is_exist == null) {        // 正常，直接放入        let stat = await tz.put(random_key, URL)        if (typeof (stat) === "undefined") return random_key        else return stat    } else if (!shortStr) {        // 生成的random_key重复了，递归调用        return save_url(URL, null)    } else        // 自定义的路径已经存在了        return -1 } async function handleRequest (request) {    console.log(request)    if (request.method === "POST") {        let req = await request.json()        console.log(req["url"])        if (!await checkURL(req["url"]))            return new Response(`{"msg":"URL错误"}`, { status: 400, headers: { "Content-Type": "application/json" } })        let random_key = await save_url(req["url"], req["shortStr"])        console.log(random_key)        // 放成功了        if (Object.prototype.toString.call(random_key) === "[object String]")            return new Response(`{"data":{"shortUrl":"${random_key}"}}`, { status: 200, headers: { "Content-Type": "application/json" } })        // 自定义的路径重复了        else if (random_key === -1)            return new Response(`{"msg":"自定义路径已重复"}`, { status: 400, headers: { "Content-Type": "application/json" } })        // 没测试k-v满了之后会怎么样，如果有错的话put时应该会有返回（猜测（懒        else return new Response(`{"msg":"k-v限额已满，求放过别刷啦"}`, { status: 500, headers: { "Content-Type": "application/json" } })    }    const requestURL = new URL(request.url)    // todo 规范路径的'/'    const path = requestURL.pathname.toString().substring(1);    console.log(path)    if (!path) {         const html = await fetch(statichtml)         return new Response(await html.text(), {            headers: {                "content-type": "text/html;charset=UTF-8",            },        })    }    const value = await tz.get(path)    console.log(value)     const location = value    if (location) {        return Response.redirect(location, 302)     }    // If request not in kv, return 404    return new Response(html404, {        headers: {            "content-type": "text/html;charset=UTF-8",        },        status: 404    }) }  addEventListener("fetch", async event => {    event.respondWith(handleRequest(event.request)) }) `
这份代码打开跳到https://www.fekepj.com  ,现在我不想跳到这个网页，取消跳转，直接打开一段文本介绍内容：例如，我是爱国的人！这几个文字，要怎样改



###### ChatGPT 说：



要取消网页跳转并显示一段文本内容（例如“我是爱国的人！”），你可以修改代码中处理根路径请求部分的逻辑。具体修改如下：

找到以下代码部分：

```
javascript复制代码const html = await fetch(statichtml)

return new Response(await html.text(), {
    headers: {
        "content-type": "text/html;charset=UTF-8",
    },
})
```

将其替换为直接返回你想展示的文本：

```
javascript复制代码const html = "<html><body><h1>我是爱国的人！</h1></body></html>";

return new Response(html, {
    headers: {
        "content-type": "text/html;charset=UTF-8",
    },
})
```

这样，当访问根路径时，页面将不再跳转，而是显示“我是爱国的人！”这段文本内容。

完整修改后的部分代码如下：

```
javascript复制代码if (!path) {
    const html = "<html><body><h1>我是爱国的人！</h1></body></html>";
    return new Response(html, {
        headers: {
            "content-type": "text/html;charset=UTF-8",
        },
    });
}
```

这样即可达到你的需求。







##### 您说：

你说得很复杂，要改几个地方？我看不懂



###### ChatGPT 说：

ChatGPT

要实现你的需求，其实只需要修改 **1个地方**。下面是具体修改步骤：

1. 找到这段代码：

   ```
   javascript复制代码const html = await fetch(statichtml)
   
   return new Response(await html.text(), {
       headers: {
           "content-type": "text/html;charset=UTF-8",
       },
   })
   ```

2. 修改为：

   ```
   javascript复制代码const html = "<html><body><h1>我是爱国的人！</h1></body></html>";
   
   return new Response(html, {
       headers: {
           "content-type": "text/html;charset=UTF-8",
       },
   })
   ```

就只需要修改**这一处**代码。







##### 您说：

如果把：我是爱国的人！改成这段文字：如果你想找到我的更多订阅，可以这样做        libao.us.kg/??        这两个问号可以用SS        或者S1        或者S2        或者S3        或者S4        或者S5        等等来代替，我会不定时更新更多订阅！   要怎样修改



###### ChatGPT 说：

ChatGPT

要将文本替换为你提供的这段内容，你可以按以下方式修改：

1. 找到这段代码：

   ```
   javascript
   
   
   复制代码
   const html = "<html><body><h1>我是爱国的人！</h1></body></html>";
   ```

2. 将其替换为：

   ```
   javascript复制代码const html = `
   <html>
     <body>
       <h1>如果你想找到我的更多订阅，可以这样做</h1>
       <p>libao.us.kg/??</p>
       <p>这两个问号可以用SS</p>
       <p>或者S1</p>
       <p>或者S2</p>
       <p>或者S3</p>
       <p>或者S4</p>
       <p>或者S5</p>
       <p>等等来代替，我会不定时更新更多订阅！</p>
     </body>
   </html>
   `;
   ```

这样修改后，页面会显示你提供的这段文字。完整修改后的部分代码如下：

```
javascript复制代码if (!path) {
    const html = `
    <html>
      <body>
        <h1>如果你想找到我的更多订阅，可以这样做</h1>
        <p>libao.us.kg/??</p>
        <p>这两个问号可以用SS</p>
        <p>或者S1</p>
        <p>或者S2</p>
        <p>或者S3</p>
        <p>或者S4</p>
        <p>或者S5</p>
        <p>等等来代替，我会不定时更新更多订阅！</p>
      </body>
    </html>
    `;
    return new Response(html, {
        headers: {
            "content-type": "text/html;charset=UTF-8",
        },
    });
}
```

这段代码会展示你需要的订阅信息和说明。
