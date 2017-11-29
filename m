From: Hanjun Guo <guohanjun@huawei.com>
Subject: Re: linux-next: Signed-off-by missing for commit in the rcu tree
Date: Wed, 29 Nov 2017 11:14:34 +0800
Message-ID: <5A1E261A.30302@huawei.com>
References: <20171129115151.40b72764@canb.auug.org.au>
 <20171129011429.GB3624@linux.vnet.ibm.com>
 <0d3da4c4-1eb3-bcdc-690b-7f864ab35073@huawei.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from szxga04-in.huawei.com ([45.249.212.190]:11446 "EHLO
        szxga04-in.huawei.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751867AbdK2DP0 (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 28 Nov 2017 22:15:26 -0500
In-Reply-To: <0d3da4c4-1eb3-bcdc-690b-7f864ab35073@huawei.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Lihao Liang <lianglihao@huawei.com>, paulmck@linux.vnet.ibm.com, Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>

Hi Lihao,

On 2017/11/29 10:48, Lihao Liang wrote:
> Hi Paul,
>
> Signed-off-by: Lihao Liang <lihao.liang@gmail.com>

...

>
> Many thanks,
> Lihao.
>
> On 2017/11/29 9:14, Paul E. McKenney wrote:
>> On Wed, Nov 29, 2017 at 11:51:51AM +1100, Stephen Rothwell wrote:
>>> Hi Paul,
>>>
>>> Commit
>>>
>>>   d7e182c9c324 ("rcu: Remove unnecessary spinlock in rcu_boot_init_percpu_data()")
>>>
>>> is missing a Signed-off-by from its author.
>> Good catch, Stephen!
>>
>> Lihao, would you please get me you Signed-off-by?  The patch is below.
>>
>> 							Thanx, Paul
>>
>> ------------------------------------------------------------------------
>>
>> commit d7e182c9c32480c1f579dd888ac50e88bfb39596
>> Author: Liang Lihao <lianglihao@huawei.com>

So it's better to keep the author and Signed-off-by the same :)

Thanks
Hanjun
