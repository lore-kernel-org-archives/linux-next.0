From: David Miller <davem@davemloft.net>
Subject: Re: linux-next: build failure after merge of the tip tree
Date: Fri, 12 Jun 2015 14:22:49 -0700 (PDT)
Message-ID: <20150612.142249.755232253520109286.davem@davemloft.net>
References: <1434106289.20648.2.camel@ellerman.id.au>
	<BY1PR0701MB17063C25D627AF725A9E0D46FEBB0@BY1PR0701MB1706.namprd07.prod.outlook.com>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from shards.monkeyblade.net ([149.20.54.216]:47469 "EHLO
	shards.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750840AbbFLVWu (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Fri, 12 Jun 2015 17:22:50 -0400
In-Reply-To: <BY1PR0701MB17063C25D627AF725A9E0D46FEBB0@BY1PR0701MB1706.namprd07.prod.outlook.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Derek.Chickles@caviumnetworks.com
Cc: mpe@ellerman.id.au, tglx@linutronix.de, mingo@elte.hu, hpa@zytor.com, peterz@infradead.org, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, sfr@canb.auug.org.au, Satananda.Burla@caviumnetworks.com, Felix.Manlunas@caviumnetworks.com, Robert.Richter@caviumnetworks.com, Aleksey.Makarov@caviumnetworks.com, Raghu.Vatsavayi@caviumnetworks.com

From: "Chickles, Derek" <Derek.Chickles@caviumnetworks.com>
Date: Fri, 12 Jun 2015 15:59:54 +0000

>> -----Original Message-----
>> From: Michael Ellerman [mailto:mpe@ellerman.id.au]
>> Sent: Friday, June 12, 2015 3:51 AM
>> To: Thomas Gleixner; Ingo Molnar; H. Peter Anvin; Peter Zijlstra; David
>> S.Miller
>> Cc: linux-next@vger.kernel.org; linux-kernel@vger.kernel.org;
>> sfr@canb.auug.org.au; Chickles, Derek; Burla, Satananda; Manlunas, Felix;
>> Richter, Robert; Makarov, Aleksey; Vatsavayi, Raghu
>> Subject: linux-next: build failure after merge of the tip tree
>> 
>> Hi all,
>> 
>> After merging the tip tree, today's linux-next build (x86_allmodconfig)
>> failed like this:
 ...
>> And so on.
>> 
>> Caused by the interaction of commit d6472302f242 "x86/mm: Decouple
>> <linux/vmalloc.h> from <asm/io.h>" from the tip tree with commit
>> f21fb3ed364b
>> "Add support of Cavium Liquidio ethernet adapters" from the net-next tree.
>> 
>> I applied the following fix for today:
 ...
> Thanks. Much appreciated.

This doesn't work, neither of these emails are a formal proper submission
of a fix for this build failure.

One of you has to do the work to formally submit the patch to netdev
with a full signoff and commit log message so that it gets fixed in my
tree.

Thanks.
