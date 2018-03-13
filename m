From: "Gustavo A. R. Silva" <gustavo@embeddedor.com>
Subject: Re: linux-next: build warning after merge of the net-next tree
Date: Tue, 13 Mar 2018 15:28:16 -0500
Message-ID: <f69bb910-23c8-0354-d78b-db097194048d@embeddedor.com>
References: <20180313171153.1614c11e@canb.auug.org.au>
 <67db5ac6-9816-4bf1-c594-72697c426466@embeddedor.com>
 <20180313.113313.629581257230548483.davem@davemloft.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180313.113313.629581257230548483.davem@davemloft.net>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: David Miller <davem@davemloft.net>
Cc: sfr@canb.auug.org.au, netdev@vger.kernel.org, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-next.vger.kernel.org



On 03/13/2018 10:33 AM, David Miller wrote:
> From: "Gustavo A. R. Silva" <gustavo@embeddedor.com>
> Date: Tue, 13 Mar 2018 06:46:24 -0500
> 
>> Hi Stephen,
>>
>> On 03/13/2018 01:11 AM, Stephen Rothwell wrote:
>>> Hi all,
>>> After merging the net-next tree, today's linux-next build (sparc
>>> defconfig) produced this warning:
>>> net/core/pktgen.c: In function 'pktgen_if_write':
>>> net/core/pktgen.c:1710:1: warning: the frame size of 1048 bytes is
>>> larger than 1024 bytes [-Wframe-larger-than=]
>>>    }
>>>    ^
>>> Introduced by commit
>>>     35951393bbff ("pktgen: Remove VLA usage")
>>>
>>
>> Thanks for the report.
>>
>> David:
>>
>> If this code is not going to be executed very often [1], then I think
>> it is safe to use dynamic memory allocation instead, as this is not
>> going to impact the performance.
>>
>> What do you think?
>>
>> [1] https://lkml.org/lkml/2018/3/9/630
> 
> Sure, that works.
> 
> It is only invoked when pktgen configuration changes are made.
> 

OK. I'll send a new patch for this.

Thanks
--
Gustavo
