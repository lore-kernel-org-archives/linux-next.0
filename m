From: Tejun Heo <tj@kernel.org>
Subject: Re: [PATCH 14/17] input: update gfp/slab.h includes
Date: Tue, 30 Mar 2010 21:17:24 +0900
Message-ID: <4BB1EBD4.9030707@kernel.org>
References: <1269885165-18617-1-git-send-email-tj@kernel.org>	<1269885165-18617-15-git-send-email-tj@kernel.org> <20100330142148.2ac3fc0e.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from hera.kernel.org ([140.211.167.34]:34633 "EHLO hera.kernel.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1756543Ab0C3MOR (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Tue, 30 Mar 2010 08:14:17 -0400
In-Reply-To: <20100330142148.2ac3fc0e.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Dmitry Torokhov <dmitry.torokhov@gmail.com>

Hello,

On 03/30/2010 12:21 PM, Stephen Rothwell wrote:
>> diff --git a/drivers/char/sysrq.c b/drivers/char/sysrq.c
>> index 532c56c..593562d 100644
>> --- a/drivers/char/sysrq.c
>> +++ b/drivers/char/sysrq.c
>> @@ -41,7 +41,7 @@
>>  #include <linux/hrtimer.h>
>>  #include <linux/oom.h>
>>  #include <linux/input.h>
>> -#include <linux/gfp.h>
>> +#include <linux/slab.h>
>>  
>>  #include <asm/ptrace.h>
>>  #include <asm/irq_regs.h>
> 
> This patch does not apply to the input tree.  That tree does not have the 
> #include <linux/gfp.h>
> line (your tree (slabh) adds that later in the linux-next cycle).

Ah, I see.  sysrq.c's requirement changed between mainline and
linux-next.  I'll update slabh tree such that it includes slab.h from
there.

Thanks.

-- 
tejun
