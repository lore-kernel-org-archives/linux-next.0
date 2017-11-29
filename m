From: Lihao Liang <lianglihao@huawei.com>
Subject: Re: linux-next: Signed-off-by missing for commit in the rcu tree
Date: Wed, 29 Nov 2017 11:29:03 +0800
Message-ID: <10748b8a-a3a4-c4c0-b476-3afd4e0e4499@huawei.com>
References: <20171129115151.40b72764@canb.auug.org.au>
 <20171129011429.GB3624@linux.vnet.ibm.com>
 <0d3da4c4-1eb3-bcdc-690b-7f864ab35073@huawei.com> <5A1E261A.30302@huawei.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <5A1E261A.30302@huawei.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Hanjun Guo <guohanjun@huawei.com>, paulmck@linux.vnet.ibm.com, Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, lihao.liang@gmail.com
List-Id: linux-next.vger.kernel.org



On 2017/11/29 11:14, Hanjun Guo wrote:
> Hi Lihao,
> 
> On 2017/11/29 10:48, Lihao Liang wrote:
>> Hi Paul,
>>
>> Signed-off-by: Lihao Liang <lihao.liang@gmail.com>
> 
> ...
> 
>>
>> Many thanks,
>> Lihao.
>>
>> On 2017/11/29 9:14, Paul E. McKenney wrote:
>>> On Wed, Nov 29, 2017 at 11:51:51AM +1100, Stephen Rothwell wrote:
>>>> Hi Paul,
>>>>
>>>> Commit
>>>>
>>>>   d7e182c9c324 ("rcu: Remove unnecessary spinlock in rcu_boot_init_percpu_data()")
>>>>
>>>> is missing a Signed-off-by from its author.
>>> Good catch, Stephen!
>>>
>>> Lihao, would you please get me you Signed-off-by?  The patch is below.
>>>
>>> 							Thanx, Paul
>>>
>>> ------------------------------------------------------------------------
>>>
>>> commit d7e182c9c32480c1f579dd888ac50e88bfb39596
>>> Author: Liang Lihao <lianglihao@huawei.com>
> 
> So it's better to keep the author and Signed-off-by the same :)
> 

Sure. Paul and Stephen, please use

Signed-off-by: Lihao Liang <lianglihao@huawei.com>

Many thanks,
Lihao.

> Thanks
> Hanjun
> 
> 
> .
> 
