---
layout: post
title:  怎么避开第三者的“胡搅蛮缠”？丨区块链必备密码学知识
date:   2018-07-27 8:00:00 +0800
author: 梁爽——冰河魔法师
categories: guide
---

hello大家好，上期更新了我的区块链教程的第一个章节，主要介绍了我的整个教程规划，并<span style="color: rgb(255, 76, 0);">介绍了比特币的历史及发展</span>。

接下来几天我将为大家解说区块链系统。（虽然我已经迫不及待想要上代码了，但是基础知识还是不能跳过啊~~）

<span style="color: rgb(255, 76, 0);">**狭义来讲，**</span>区块链是一种按照时间顺序将数据区块以顺序相连的方式组合成的一种链式数据结构，并以密码学方式保证的不可篡改和不可伪造的分布式账本。

<span style="color: rgb(255, 76, 0);">**广义来讲，**</span>区块链技术是利用块链式数据结构来验证与存储数据、利用分布式节点共识算法来生成和更新数据、利用密码学的方式保证数据传输和访问的安全、利用由自动化脚本代码组成的智能合约来编程和操作数据的一种全新的分布式基础架构与计算方式。

<span style="color: rgb(255, 76, 0);">区块链系统概述这一章节，我会分好几期来更新，主要包括几部分：</span>  

1、用密码学保护区块（包括：哈希计算、数字签名、对交易签名。）

2、把区块连成链状（用哈希标记区块、单向链表的区块链）

3、用分布式网络把区块共享出去

4、保存少量数据的轻量客户端

5、用智能合约对数据上锁

6、重要基础概念（软分叉、硬分叉、拜占庭将军问题、授权区块链）

{% include image name="640.jpg" %}

<span style="color: rgb(178, 178, 178);font-size: 15px;">集齐6颗就能召唤神龙（误）</span>

<span style="color: rgb(178, 178, 178);font-size: 15px;">  
</span>

我并没有打算深入到每一个细节，只是希望能给读者以区块链的全局观，方便后续做程序实现的时候，可以更加明白自己正在做的是区块链的哪个部分，而技术细节和一些关于细节方面的疑问都会在后续的具体代码实现的章节中得到解答。

* * *

<span style="color: rgb(0, 122, 170);">~到这里是正文的分割线~</span>

* * *

<span style="color: rgb(0, 122, 170);font-size: 20px;">**用密码学保护区块**</span>

<span style="color: rgb(0, 122, 170);font-size: 20px;"></span>

<span style="color: rgb(0, 122, 170);font-size: 20px;"></span>

{% include image name="640(1).jpg" %}

<span style="color: rgb(0, 122, 170);font-size: 20px;"></span><span style="color: rgb(178, 178, 178);">开始战斗！</span>

<span style="color: rgb(0, 122, 170);font-size: 20px;"></span>

**1、哈希计算**  

密码学上的哈希算法一般需要具有以下的性质：

*   函数的输入可以是任意长的字符串；

*   函数的输出是固定长度的；

*   函数的计算过程应该是高效的。

<span style="color: rgb(255, 76, 0);">哈希计算，即通过一个算法将任意一段输入字符串计算出一个固定长度的数值。</span>通过哈希算法计算出的结果，是无法再通过任何算法还原出原始数据的。即哈希计算是单向的，因此可以用于判断数据的完整性，哪怕再小的一点数据变化，都会导致重新计算的哈希结果与之前的结果会大不一样。

如下图所示，无论原始内容改动是多么的小，或者变化多么的大，其通过哈希函数后的输出都会非常的不一样。

{% include image name="640(2).jpg" %}

由于哈希算法的输出值是固定长度的，而原始数据的长度却是任意，在理论上存在不同的原始数据对应同一哈希值的可能，如下图所示情况。

{% include image name="640(3).jpg" %}

这种情况在原始数据的数量极其庞大的时候就会出现。然而由于哈希计算的抗冲突性，即找到有冲突的两个输入的代价非常大，所以人为的想要持续找到两个冲突的哈希值的可能性接近于零。

<span style="font-size: 20px;color: rgb(0, 122, 170);">**2、**</span>**数字签名**  

我们从一个故事讲起，Alice想要发送消息给Bob，但是通讯通道并不安全，Eve在通讯通道中将消息截获并将Alice发送的内容修改后发送给Bob。如下图，Alice原本想要将“8”这个消息发送给Bob，但是Eve在通讯通道中悄悄的把“8”改成了“9”，并告诉Bob这个消息就是Alice发送给他的。

{% include image name="640(4).jpg" %}

我们现在需要一种机制，<span style="color: rgb(255, 76, 0);">使得Bob可以确认他所收到的消息确实是Alice所想要传达的，并明确这个消息并没有被任何人修改过，</span>这种机制就是数字签名机制。

以下我们用一些非常简单的数字来做数字签名的演算，读者朋友们可以亲自动手计算起来，计算过程中只会用到乘法运算、幂运算（乘积运算）和取余运算而已，但是因为有幂运算，即便数字已经非常小了，你应该需要一个计算器。

此处将步骤列为表格形式

{% include image name="640(5).jpg" %}

以上表格中“只有Alice知道的信息”列中的信息及计算过程，是只有Alice才知道的，不应该被泄漏的，一旦泄漏了，那整个签名的可靠性便无从谈起了；而“所有人都知道的信息”列中的信息及计算过程，可以被Bob或者Eve知道，而对于Eve即便知道了这些信息，但是如果没有得到仅有Alice知道的信息d，Eve也是无法方便的篡改和伪造信息的。

以上整体过程如下图所示：

{% include image name="640(6).jpg" %}

在本例中，私钥即只有Alice知道的d，而公钥就是公开的n。

如果Eve试图篡改信息“8”为“9”，会使得2^3=8<span style="font-size: 16px;">≠ 9mod15 ，等式不成立，即说明信息被修改了，为此，Eve必须试图一同篡改签名s，于是Eve必须做以下一系列的运算：</span>

{% include image name="640(7).jpg" %}

Eve总共做了9次运算才找到一个有效的签名，以此来篡改和伪造数据，在本例中我们使用了非常小的数字，所以Eve才能在相对较短的时间完成篡改和伪造数据，但如果我们使用以下稍微大一点的数字呢？

<span style="color: rgb(0, 122, 170);">假设d=29, p=7, q=13,n=pq=91, e=5，</span>

<span style="color: rgb(0, 122, 170);">当m=8时，</span>

{% include image name="640(8).jpg" %}

<span style="color: rgb(0, 122, 170);">做验证的时候只需要做：</span>

{% include image name="640(9).jpg" %}

<span style="color: rgb(0, 122, 170);">便可以轻松的通过签名验证信息，但如果Eve试图伪造，不得不做以下一系列的艰难运算：</span>

{% include image name="640(10).jpg" %}

<span style="color: rgb(0, 122, 170);">而随着我们选取的数字越大，Eve在有限时间内可以伪造的可能性就越小。  
</span>

<span style="color: rgb(255, 76, 0);">**注意1：**</span>该签名过程是为了帮助读者在短时间内理解数字签名的基本原理和特性，故在很多方面都做了简化处理，若使用以上步骤在实际生产环境中会出现致命的漏洞，故有兴趣深入研究的读者应该继续学习RSA密码体系，我就不在这方面深入了；

<span style="color: rgb(255, 76, 0);">**注意2：**</span>本例旨在帮助读者快速理解数字签名的不可逆和不易伪造的原理和特点，并没有暗指比特币或者区块链应该或使用了该例中的原理过程，实际上有相当多一部分的区块链均选择了椭圆曲线加密体系，本节也并不在这方面深入，在后续章节中，实现区块链的非对称加密算法时会详细讲解；

**<span style="font-size: 20px;color: rgb(0, 122, 170);">3、对交易签名</span>**  

**<span style="font-size: 20px;color: rgb(0, 122, 170);">  
</span>**

要想发起一笔交易，我们需要按以下步骤：

*   准备交易的详情内容，包含从哪里转账到哪里，以及转账多少的信息；

*   将这些详情打包并使用哈希计算方法，计算出该交易详情的哈希值；

*   使用仅有发起该笔交易的用户拥有的私钥对该哈希值进行签名；

*   将交易详情、交易哈希和交易签名打包在一起成为一笔交易包；

*   将这个交易包发送到区块链网络；

以上步骤形成的示意图如下：

{% include image name="640(11).jpg" %}

<span style="color: rgb(61, 167, 66);">**<span style="font-size: 20px;">>>扩展（八卦）知识</span>**</span>

<span style="color: rgb(61, 167, 66);">**<span style="font-size: 20px;">  
</span>**</span>

<span style="color: rgb(61, 167, 66);">**<span style="font-size: 20px;"></span>**</span>

{% include image name="640(12).jpg" %}

**<span style="color: rgb(61, 167, 66);">1、为什么是Alice和Bob？</span>**

RSA密码体系的三位作者Rivest、Shamir、Adleman，在其于1978年2月发表的论文《一种实现数字签名和公钥密码系统的方法》（A Method of Obtaining Digital Signatures and Public-KeyCryptosystems）中首次使用了Alice和Bob，在此之前，通信领域论文中一般用A表示数据发送方，用B表示数据接收方。使用Alice和Bob后，一方面不但避免使用普通的字母A和B，而且这两个名字的英文首字母仍维持A和B不变；另一方面是因为Alice和Bob分别为女性名字和男性名字，这样在论文后面的部分中就可以使用英语的她和他分别指代Alice和Bob，让论文更加清晰。

**<span style="color: rgb(61, 167, 66);">2、为什么是Eve？</span>**

后来人按照Alice和Bob的命名规则，用单词窃听者（Eavesdrop，/ˈiːvzdrɒp/）的读音第一个音节选出了一个常用名字。

**3、密码学常用的哈希算法**

<span style="font-size: 18px;"></span>

密码学中常用的哈希算法有MD5、SHA1、SHA2、SHA256、SHA512、SHA3、RIPEMD160，下面简单介绍一下。

*   <span style="color: rgb(61, 167, 66);">**MD5（Message Digest Algorithm 5）**</span>。MD5是输入不定长度信息，输出固定长度128bits的算法。经过程序流程，生成4个32位数据，最后联合起来成为一个128bits哈希。基本方式为求余、取余、调整长度、与链接变量进行循环运算，得出结果。MD5算法曾被广泛使用，然而目前该算法已被证明是一种不安全的算法。

*   <span style="color: rgb(61, 167, 66);">**SHA1（Secure Hash Algorithm 1）**</span>。SHA1在许多安全协议中广为使用，包括TLS和SSL。2017年2月，Google宣布已攻破了SHA1，并准备在其Chrome浏览器产品中逐渐降低SHA1证书的安全指数，逐步停止对使用SHA1哈希算法证书的支持。

*   <span style="color: rgb(61, 167, 66);">**SHA2。**</span>这是SHA算法家族的第二代，支持了更长的摘要信息输出，主要有SHA224、SHA256、SHA384和SHA512，数字后缀表示它们生成的哈希摘要结果长度。SHA256在比特币中扮演了非常重要的角色，它既是挖矿的主要算法，也是比特币地址创建中必要算法。

*   <span style="color: rgb(61, 167, 66);">**SHA3**</span>。这是SHA算法家族的第三代，之前名为Keccak算法，SHA3并不是要取代SHA2，因为目前SHA2并没有出现明显的弱点。需要注意的是，以太坊使用的Keccak-256，在部分文档中也写作SHA3，与美国国家标准与技术研究院（NIST）发布的SHA3-256标准是不一样的。

*   <span style="color: rgb(61, 167, 66);">**RIPEMD-160**</span>（RACE Integrity Primitives Evaluation Message Digest 160）RIPEMD160是一个160位加密哈希函数。它旨在替代128位哈希函数MD4、MD5和RIPEMD-128。RIPEMD160在比特币中用来生成比特币地址，相比使用SHA256来说，可以使得地址在保证不重复的基础上更加简短。

<span style="color: rgb(0, 122, 170);">下节预告：</span>

##### **<span style="color: rgb(0, 122, 170);">把区块连成链状（用哈希标记区块、单向链表的区块链）</span>**

**<span style="color: rgb(0, 122, 170);">  
</span>**

**<span style="color: rgb(0, 122, 170);"></span>**

{% include image name="640(13).jpg" %}

**<span style="color: rgb(0, 122, 170);"></span>**  
