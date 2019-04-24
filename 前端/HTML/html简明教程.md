# HTML基本结构

## 认识HTML：

`html`不是一种编程语言，是一种标志语言。标记语言是由一套标识标签组成的。`html`使用标签来描述网页。

## HTML结构：

```html
<html>
    <head></head>
    <body></body>
</html>
```

## 不成对出现的标签:

`<br>` `<hr>` `<meta>` `<img>` `<input..>` `<option..>` `<link>`

## HTML 基本标签的讲解：

- `<html>` `<head>` `<body>` 标签
- `<h1>`—-`<h6>` 仅仅用于标题文本，不要为了产生粗体文本使用它们
- `<p>` 标签 段落标签
- `<strong>` `<b>` 标签都会让文字产生加粗效果
- - a. `<strong>` 用于强调文本，强度更深，表示重要文本 —> 用于SEO优化
- - b. `<b>` 只是视觉加粗效果—>单纯为了产生加粗
- `<em>` `<i>` 标签
- - a. `em` 用于强调文本
- - b. `i` 只是视觉斜体效果
- - c. `<strong>` 比 `<em>` 强调更强
- 特殊符号：
- - `&nbsp;` —-> 空格
- - `&gt;`   —-> 大于号
- - `&lt;`   —-> 小于号
- - `&quot;` —-> 引号
- - `&copy;` —-> 版权号

# HTML 基本标签

`HTMl`基本标签：

- `span` 标签 被用来组合文档中的行内元素。注意：`span` 没有固定的格式表现，当对它应用样式时，才会产生视觉上的变化
- `<pre>` 标签 文字的格式按源码的排版来显示，我们称之为预处理格式
- `<a>` 标签 他有一个必不可少的属性 `href`
- - `target`属性：`_self`(在原来页面打开)、`_blank`（新窗口打开）、`_top`（打开时忽略所有的框架）、`_parent`（在父窗口中打开）
- 创建锚点和锚链接
- - 锚点也是一种超链接，是页面内进行跳转的超链接
- - 第一步：创建锚点 `<a name="锚点名称"></a>`
- - 第二步：使用创建好的锚点名称 `<a href="#锚点名称">内容</a>`
- `marquee` 标签 可以创建一个内容滚动效果

```html
<marquee direction="down" loop="4" onmouseover=this.stop() onmouseout=this.start()></marquee>
```
- `direction` 表示滚动方向，取值有（left,right,up,down,默认left）
- `loop` 表示滚动循环的次数，默认为无限循环
- `onmouseover` 表示当鼠标移上区域的时候停止滚动，`onmouseout` 鼠标移开继续滚动

# img图片标签与路径

## 图片标签与路径：

常见图片格式 `jpg` `png` `gif`
- `Gif`（只支持全透明）
- `Jpeg/jpg`
- `Png` 半/全透明都支持

## 图片标签写法 ：

`<img src="" alt="" width="" height="" />`

## 图片四要素：

- `src=""` 图片路径
- `alt=""` 图片含义
- `width=""` 图片宽度 和图片大小保持一致
- `height=""` 图片高度 和图片大小保持一致
- `title=""`

## 路径知识：

相对路径、绝对路径：
 - 相对路径：(Relative Path) 相对于该文件的路径；
 - 绝对路径：(Absolute Path) 从磁盘出发的路径；

`<img src="" …… align="" />` `align` 属性–设置图片与前后面文字的位置关系。值-`top`、`bottom`、`middle`、`absmiddle`、`left`、`right`

## 在静态页面中：

- `/` 开头表示根目录；
- `./` 表示当前目录；（斜画线前面一个点）
- `../` 上级目录；（斜画线前面两个点）

直接用文件名不带`/`也表示同一目录。些都是相对于当前文件的位置来说的，如果用绝对路径的话就是写全了。

# 三种列表的讲解

- `<ul>` 无序列表

无序列表是一个没有顺序项目的列表，此列表项默认粗体圆点进行标识

```html
<ul>
   <li></li>
   <li></li>
   <li></li>
</ul>
```

- `<ol>` 有序列表

有序列表也是一列项目，只是列表项目使用的是数字进行标记。 有序列表始于 `<ol>` 标签。每个列表项始于 `<li>` 标签。

```html
<ol>
   <li>内容一</li>
   <li>内容二</li>
   <li>内容三</li>
</ol>
```

- 列表符号
- - 无序列表-列表符号: `type="circle"` 空心圆 `type=“disc”` 实心圆 默认值 `type="square"` 方块符
- - 有序列表-列表符号: `type="A"` A B C D `type="a"` a b c d `type="1"` 1 2 3 4 默认值 `type=”I”` I II III `type=”i”` i ii iii

- 列表嵌套
- - 无序列表-嵌套
```html
<ul>
 <li>柚子
  <ul>
   <li>沙田柚</li>
   <li>蜜柚</li>
  </ul>
 </li>
 <li>荔枝</li>
 <li>苹果</li>
</ul>
```
- - 有序列表-嵌套
```html
<ol>
 <li>茶
  <ul>
   <li>红茶</li>
   <li>绿茶</li>
  </ul>
 </li>
 <li>果汁</li>
 <li>牛奶</li>
</ol>
```

- 定义列表

定义列表不仅仅是一列项目，而是项目及其注释的组合。定义列表以 `<dl>` 标签开始。每个定义列表项以 `<dt>` 开始。每个自定义列表项的定义以 `<dd>` 开始。

```html
<dl>
     <dt>pc网页制作</dt>
     <dd>学习DIV+CSS JS JQ 项目实战</dd>
     <dt>手机网页制作</dt>
     <dd>手机网页制作实战</dd>
</dl>
```

`dd` 是对 `dt` 的解释:
- `<dl></dl>` 用来创建一个普通的列表,
- `<dt></dt>` 用来创建列表中的上层项目，
- `<dd></dd>` 用来创建列表中最下层项目，
- `<dt></dt>` 和 `<dd></dd>` 都必须放在 `<dl></dl>` 标志对之间。

# 表单元素(上)

- `<form>` 表单标签：

`<form>` 表单是一个包含表单元素的区域，包括起来的都是表单的内容

```html
<form>
 <input type="text"/>
</form>
```

- HTML标签 - `Action`和确认按钮：

当用户单击确认按钮时，表单的内容会被传送到另一个文件。表单的动作属性定义了目的文件的文件名。由动作属性定义的这个文件通常会对接收到的输入数据进行相关的处理。

```html
<form action="html.do" method="get">
        username:  <input type="text" name="user" />
        <input type="submit" value="提  交" />
</form>
```

- HTML标签 - 隐藏域隐藏标签：

隐藏域在页面中对于用户是不可见的，在表单中插入隐藏域的目的在于收集或发送信息，以利于被处理表单的程序所使用。浏览者单击发送按钮发送表单的时候，隐藏域的信息也被一起发送到服务器

```html
<form>
     <input type="hidden" name="hid" value="value">
</form>
```

- `<input> `标签的掌握

常用type类型： `<input type="" name="" value="" />`

- - `type="text"` 单行文本输入框
- - `type="password"` 密码（`maxlength=""`）
- - `type="radio"` 单项选择（`checked="checked"`）
- - `type="checkbox"` 多项选择
- - `type="button"` 按钮
- - `type="submit"` 提交
- - `type="image"` 图片
- - `type="file"` 上传文件
- - `type="reset"` 重置
- - `type="hidden"` 隐藏

- 关于表单中的设置默认值：

```html
<input type="text" name="" value="今天心情不错" />
<input type="radio" name="" value="" checked="checked">
<input type="checkbox" name="" value="" checked="checked">
<select name="" >
 <option value=""></option>
 <option value="" selected="selected"></option>
<select>
```

`textarea` 没有默认值

- `<label>` 标签的使用

`<label></label>` label 元素不会向用户呈现任何特殊效果。不过，它为鼠标用户改进了可用性。如果您在 `label` 元素内点击文本，就会触发此控件。就是说，当用户选择该标签时，浏览器就会自动将焦点转到和标签相关的表单控件上。

`<label>` 标签的`for`属性应当与相关元素的`id`属性相同

例子：（重要—注册表单–用户体验–必做）

```html
<p>单向选择</p>
<label for="male">男：</label><input type="radio" name="sex" id="male"/>
<label for="nv">女：</label><input type="radio" name="sex" checked="check"/>
```

# 表单和表格(下)

- `<textarea>` 文本域标签: `<textarea></textarea>`是文本域标签，可以在其中插入一段文字内容，它有两个常用属性`rows`和`cols`
- - `rows` 表示这个文本域有多少行
- - `cols` 表示这个文本域有多少列

除了这两个属性它还有`readonly`（只读，文本域的内容无法改变，相当于协议）和 `title`（鼠标放上提示）

- `<select>` 标签的掌握

注：当提交表单时，浏览器会提交选定的项目，或者收集用逗号分隔的多个选项，将其合成一个单独的参数列表，并且在将 `<select>` 表单数据提交给服务器时包括 `name` 属性

```html
<form>
    <select name=""  id="">
         <option value="1">1月</option>
          <option value="2">2月</option>
</select>
</form>
```

常用到的属性：`disabled=“disabled” name="sel" size="2"`

- `<table>` 表格标签

`<table>` 是表格标签，可以用它定义一个表格。

```html
<table border="1">
    <tr>
    <td>姓名</td>
    <td>性别</td>
    </tr>
</table>
```

注意：`<table>` 的 `border` 属性不能少

- - `<tr>` 可以定义表格中的一行，一个`<tr></tr>`表示一行。

- - `<td>`可以定义表格中的一个单元格，`<td></td>`表示一个单元格。

`border-collapse` 属性设置是否将表格边框折叠为单一边框： `colspan`左右合并; `rowspan` 上下合并

# 第一部分总结：

- 非可视化标签：`head` `meta` `style` `scrpit...`
- 可视化标签：`img` `div` `span` `a` `ul` `li…`
- 只有可视化标签，才能用css改变它
- 单标签：`meta` `link` `base` `img` `input` `br` `hr`
- 双标签：`html` `head` `body` `div` `a` `p` `span` `ul` `li` `ol` `dl ….`

常用可视化标签

- `div` 一般用它来布局
- `a` 超链接标签
- - `href*` 属性：设置跳转的网页地址
- - `target` 属性：设置跳转的目标
- - 结论：凡事页面可以点击跳转或者表单提交的文字，都用a标签
- `img`
- `ul li` 只要将来设计页面中有固定样式的列表，就用ul和li
- `table caption tr td (th)`

- [HTML5标签含义之元素周期表](http://www.html5star.com/manual/html5label-meaning/)
- [HTML5标签含义大全](http://www.html5star.com/manual/html5/html5_comment.htm)