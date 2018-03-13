From: "Gustavo A. R. Silva" <gustavo@embeddedor.com>
Subject: Re: linux-next: build warning after merge of the net-next tree
Date: Tue, 13 Mar 2018 06:46:24 -0500
Message-ID: <67db5ac6-9816-4bf1-c594-72697c426466@embeddedor.com>
References: <20180313171153.1614c11e@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180313171153.1614c11e@canb.auug.org.au>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>, David Miller <davem@davemloft.net>, Networking <netdev@vger.kernel.org>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
List-Id: linux-next.vger.kernel.org

Hi Stephen,

On 03/13/2018 01:11 AM, Stephen Rothwell wrote:
> Hi all,
> 
> After merging the net-next tree, today's linux-next build (sparc
> defconfig) produced this warning:
> 
> net/core/pktgen.c: In function 'pktgen_if_write':
> net/core/pktgen.c:1710:1: warning: the frame size of 1048 bytes is larger than 1024 bytes [-Wframe-larger-than=]
>   }
>   ^
> 
> Introduced by commit
> 
>    35951393bbff ("pktgen: Remove VLA usage")
> 

Thanks for the report.

David:

If this code is not going to be executed very often [1], then I think it 
is safe to use dynamic memory allocation instead, as this is not going 
to impact the performance.

What do you think?

[1] https://lkml.org/lkml/2018/3/9/630

Thanks
--
Gustavo
