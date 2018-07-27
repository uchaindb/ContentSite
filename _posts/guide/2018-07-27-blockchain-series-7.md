---
layout: post
title:  软分叉？硬分叉？
date:   2018-07-27 8:00:00 +0800
author: 梁爽——冰河魔法师
categories: guide
---

{% include image name="640" %}

<span style="color: rgb(0, 122, 170);">**<span style="font-size: 20px;"></span>**</span>  

区块链是一条链状，通过一条链将许多区块锁定在这个区块链上，然而因为多种理由，可能是人为的修改共识，也可能是正常共识阶段临时产生的不同步型分叉，使得一条链在某个分叉点后分成互相没有交集的两条链。

{% include image name="640(1)" %}

**<span style="color: rgb(255, 76, 0);">在比特币的百科上有这样的描述：</span>**

*   硬分叉是在修改区块链协议后，使得在老客户端里面认为无效的区块或者交易，在新客户端当中认为是有效的。

*   软分叉是在修改区块链协议后，使得在老客户端里面认为有效的区块或者交易，在新客户端当中变得无效了。

<span style="color: rgb(255, 76, 0);">这个基本定义比较绕口，形成一张表格如下：</span>

<table cellspacing="0" cellpadding="0">

<tbody>

<tr>

<td width="85" valign="top" style="border-width: 1px;border-style: solid;border-color: windowtext;padding: 0px 7px;">  
</td>

<td width="217" valign="top" style="border-top: 1px solid windowtext;border-right: 1px solid windowtext;border-bottom: 1px solid windowtext;border-left: none;padding: 0px 7px;">

老客户端

</td>

<td width="273" valign="top" style="border-top: 1px solid windowtext;border-right: 1px solid windowtext;border-bottom: 1px solid windowtext;border-left: none;padding: 0px 7px;">

新客户端

</td>

</tr>

<tr>

<td width="85" valign="top" style="border-right: 1px solid windowtext;border-bottom: 1px solid windowtext;border-left: 1px solid windowtext;border-top: none;padding: 0px 7px;">

硬分叉

</td>

<td width="217" valign="top" style="border-top: none;border-left: none;border-bottom: 1px solid windowtext;border-right: 1px solid windowtext;padding: 0px 7px;">

识别新客户端产生的区块为无效

</td>

<td width="273" valign="top" style="border-top: none;border-left: none;border-bottom: 1px solid windowtext;border-right: 1px solid windowtext;padding: 0px 7px;">

将产生老客户端无法识别的新区块

</td>

</tr>

<tr>

<td width="85" valign="top" style="border-right: 1px solid windowtext;border-bottom: 1px solid windowtext;border-left: 1px solid windowtext;border-top: none;padding: 0px 7px;">

软分叉

</td>

<td width="217" valign="top" style="border-top: none;border-left: none;border-bottom: 1px solid windowtext;border-right: 1px solid windowtext;padding: 0px 7px;">

识别新客户端产生的区块为有效

</td>

<td width="273" valign="top" style="border-top: none;border-left: none;border-bottom: 1px solid windowtext;border-right: 1px solid windowtext;padding: 0px 7px;">

可能会将老客户端产生的区块识别为无效

</td>

</tr>

</tbody>

</table>

<span style="color: rgb(61, 167, 66);font-size: 18px;">**什么是硬分叉**</span>

<span style="font-size: 16px;color: rgb(61, 167, 66);"></span>

<span style="color: rgb(255, 76, 0);">硬分叉是对协议的修改，启用了新的交易或区块格式，使得老客户端无法识别，因此要求所有客户端都要升级。</span>通常情况下，对区块的结构、难度，共识的规则，或者改变有效的交易类型，都会产生硬分叉。但不是所有新增交易类型都必须使用硬分叉，也可以定义一种特殊的交易，使其对老客户端来看是有效交易（但其实无法真实的识别的交易），来增加新的交易种类。

硬分叉通常都是有意而为之的，通常都是由区块链的开发者煽动的，其通常情况会有两种结果。

*   第一种结果：一大批节点都不支持新的共识规则，继续使用以前老的共识（通常是老客户端）运作，这时候也有一定数量的节点开始使用新的共识规则（通常是新客户端）。那这个时候，两边不同的共识都会拒绝对方共识产生的区块，使得他们分裂成为两种不同的区块链（加密货币）。

{% include image name="640(2)" %}

*   第二种结果：大部分节点都同意更改共识规则，迫使使用老共识规则的节点，不得不改变他们的共识规则，改变成新共识规则，最终由所有节点共同产生一条新的区块链。

{% include image name="640(3)" %}

**<span style="color: rgb(61, 167, 66);font-size: 18px;">什么是软分叉</span>**

**<span style="color: rgb(61, 167, 66);font-size: 18px;">  
</span>**

<span style="color: rgb(255, 76, 0);">软分叉是对协议的修改，使得老客户端可以将新的区块识别为合法的区块，所以说软分叉是向后兼容的。</span>新的交易类型经常是以软分叉的方式添加进来，它只需要发送者和接收者以及对应的新客户端能够识别新的交易类型即可。在过去，P2SH和隔离见证都是通过这种方式添加到比特币当中的。

软分叉不需要所有节点都升级，就可以保持共识，因为由新客户端产生的所有区块，也都是符合老规则的，因此老客户端是可以接受这些区块的。

注意，网络上流传着另外一种解释，即软分叉的老客户端依旧可以产生新客户端可以识别的区块，以此使得老客户端能够在一段时间内不升级**，这个说法不完全正确，**因为老客户端无法识别新客户端新添加的功能，当然也无法将含有新功能的新交易或区块正确的打包，即有可能打包出老客户端认为是有效的区块，但是新客户端认为是无效的区块，长期来看，老客户端产生的区块可能会被新客户端拒绝而丧失获取奖励的机会。

举例来说，2017年8月启用的隔离见证功能，因为修改交易的结构，使得老客户端虽然能继续识别其新的数据结构，但没有对应的逻辑对新的交易进行验证，

便可能出现将无效的交易当作有效的交易进行打包，并执行挖矿操作，但该区块广播到新客户端后，由于新客户端可以对新的交易进行验证，并发现其不合法，便拒绝该区块，使得老客户端辛苦的挖矿操作变得无意义。

因此在软分叉发生后，是有可能产生如下图所示的情况，即新老客户端均能产生互相识别为合法的区块，但随着该次分叉修改的程度高低，出现该种情况的几率呈负增长。

{% include image name="640(4)" %}

* * *

**区块链系统概述章节目录：**

<span style="letter-spacing: 0.544px;">1、用密码学保护区块（包括：哈希计算、数字签名、对交易签名。）</span>  

2、把区块连成链状（用哈希标记区块、单向链表的区块链）

3、用分布式网络把区块共享出去  

4、保存少量数据的轻量客户端

5、用智能合约对数据上锁

6、<span style="color: rgb(255, 76, 0);">重要基础概念（软分叉、硬分叉、拜占庭将军问题、授权区块链）</span><span style="color: rgb(255, 76, 0);">【请见下期~】 </span>

* * *

{% include image name="640(5)" %}

**<span style="color: rgb(0, 122, 170);"></span>**  

