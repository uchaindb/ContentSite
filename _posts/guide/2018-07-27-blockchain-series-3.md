---
layout: post
title:  区块链为什么会有很高的防篡改性？
date:   2018-07-27 8:00:00 +0800
author: 梁爽——冰河魔法师
categories: guide
---

上期给大家讲解了区块链必备的密码学知识，今天我们将继续区块链系统概述的第二部分——把区块连成链状。这一节将为大家解释：<span style="color: rgb(255, 76, 0);">为什么区块链会有很高的防篡改性？</span>  

#### <span style="color: rgb(0, 122, 170);">**<span style="color: rgb(0, 122, 170);font-size: 20px;">把区块连成链状</span>**</span>

<span style="color: rgb(0, 122, 170);">**<span style="color: rgb(0, 122, 170);font-size: 20px;">  
</span>**</span>

区块链是由许多区块按照时间顺序链接而成的，而每个区块中则存储有交易数据。我们可以这样理解，区块就是交易账本当中的每一页，而每页上面记录了所有交易的变更情况。所有交易都会放入交易池，而矿工负责选出适量的交易并打包成区块，最终添加到现有区块链的末尾。鉴于区块链上早先的区块会由于链条的变成而变得在链条上越来越深，因此会变得越来越难以修改<span style="color: rgb(0, 122, 170);">。</span><span style="color: rgb(255, 76, 0);">也正因如此，使得区块链具有很高的防篡改性。</span>

{% include image name="640.jpg" %}

<span style="color: rgb(255, 76, 0);"></span>

##### **<span style="color: rgb(61, 167, 66);">1、用哈希标记区块</span>**

区块中包含许多交易，而将包含所有交易在内的内容统一计算出哈希值，鉴于哈希值的抗冲突特性，任何一个哈希值便可以代表整个区块，对于两个相同哈希值的区块，即便我们不用对比里面每一个字段，我们也可以信心满满的认为他们区块中的每个字段是相同的。

比较特别的<span style="color: rgb(255, 76, 0);">，在比特币网络中会要求这个哈希值的数值小于指定的难度系数，直观的感觉便是在该哈希值的十六进制表示中的前面一定位数的字符为0时，才是有效的哈希值，即该区块有效，可以被视为区块链中的一个区块。</span>这个便是比特币中的工作量证明，因为寻找符合这样的要求的哈希值是非常困难的，而无法取巧的，必须通过一定的工作量才能完成的。  

{% include image name="640(1).jpg" %}

如上表，就是一个典型的区块的样子，所有深色部分的字段汇总在一起计算出了本区块的哈希值，而该哈希值是几乎不可能通过伪造另外一个区块来获取的，故该哈希值便可以完全代表这个区块。

##### **<span style="color: rgb(61, 167, 66);">2、 单向链表的区块链</span>**

如下图，<span style="color: rgb(255, 76, 0);">将前一区块的哈希值记录在区块的头部，使得区块之间形成链状，也是因此使得前一区块的任意修改，会导致后续链接的所有区块的哈希值的变化，使得原区块链断链，</span>这会导致由于有计算量的存在，使得修改较早区块后变短的区块链在共识（共识将在后续章节中详细讲解）中失去竞争优势，最终不被区块链网络所认可而被抛弃，这也是区块链之所以成为链状结果，并能够防篡改的核心所在。

{% include image name="640(2).jpg" %}

区块通过前一区块哈希值的方式形成的是单向链表，即我们无法通过一个较早的区块了解到哪一个区块是链接在他后面的。实际情况，正是由于单向链表的特性，才会出现分叉的情况，即有多个区块链接到同一个前一区块。

* * *

**区块链系统概述章节目录：**

<span style="letter-spacing: 0.544px;">1、用密码学保护区块（包括：哈希计算、数字签名、对交易签名。）</span>  

2、把区块连成链状（用哈希标记区块、单向链表的区块链）

<span style="color: rgb(255, 76, 0);">3、用分布式网络把区块共享出去  【请见下期~】 </span>

4、保存少量数据的轻量客户端

5、用智能合约对数据上锁

6、重要基础概念（软分叉、硬分叉、拜占庭将军问题、授权区块链）

* * *

<span style="font-size: 14px;color: rgb(0, 122, 170);">这里是碎碎念的分割线</span>

* * *

今天更新到第3期了，说实话，真正的知识，看起来是很枯燥无味的，这也是我在写作中一直很纠结的问题：究竟只讲重点干货，还是写得更为通俗易懂？最后我觉得还是先按干货版走一遍。对于真正有需要的人来说，这样子上手其实更快速。

另外为了方便大家，我把自定义菜单开上了，以后每更新一期我也会放到菜单里，方便大家翻阅往期文章。

**<span style="color: rgb(0, 122, 170);">  
</span>**

**<span style="color: rgb(0, 122, 170);"></span>**

{% include image name="640(3).jpg" %}

**<span style="color: rgb(0, 122, 170);"></span>**  

