From: Yang Hongyang <yanghy@cn.fujitsu.com>
Subject: Re: linux-next: wireless tree build failure
Date: Mon, 23 Mar 2009 13:01:08 +0800
Message-ID: <49C71794.4090000@cn.fujitsu.com>
References: <20090323153954.95094b80.sfr@canb.auug.org.au> <20090322.215326.125372497.davem@davemloft.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from cn.fujitsu.com ([222.73.24.84]:49929 "EHLO song.cn.fujitsu.com"
	rhost-flags-OK-FAIL-OK-OK) by vger.kernel.org with ESMTP
	id S1751036AbZCWFB5 (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Mon, 23 Mar 2009 01:01:57 -0400
In-Reply-To: <20090322.215326.125372497.davem@davemloft.net>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: David Miller <davem@davemloft.net>
Cc: sfr@canb.auug.org.au, linux-next@vger.kernel.org

David Miller wrote:
> From: Stephen Rothwell <sfr@canb.auug.org.au>
> Date: Mon, 23 Mar 2009 15:39:54 +1100
> 
>> Today's linux-next build (powerpc ppc64_defconfig) failed like this:
>>
>> drivers/net/spider_net.c:2263: error: expected '}' before ';' token
>>
>> Caused by commit 6e06cb626229567629e1dc6eed9399bec549f3cf ("spider_net:
>> Convert to net_device_ops").
>>
>> Clearly never even build tested (or looked at very hard).
>>
>> I have used the version of the net tree from next-20090320 for today
> 
> Sorry about that Stephen, I'll fix it up.
> 
> Yang, don't send me patches you don't even build test.

Dave,I'm terribly sorry for the mistake.I won't send patches that
don't pass build test any more.It's my fault.

> 
> 
> 


-- 
Regards
Yang Hongyang
