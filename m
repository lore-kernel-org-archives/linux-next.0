From: Ingo Molnar <mingo@elte.hu>
Subject: Re: linux-next:  build failure
Date: Thu, 16 Oct 2008 18:14:05 +0200
Message-ID: <20081016161405.GA14440@elte.hu>
References: <20081016202907.978d00b1.sfr@canb.auug.org.au> <20081016103916.GA30745@elte.hu> <48F767C5.8000207@goop.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mx3.mail.elte.hu ([157.181.1.138]:50850 "EHLO mx3.mail.elte.hu"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751226AbYJPQOo (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Thu, 16 Oct 2008 12:14:44 -0400
Content-Disposition: inline
In-Reply-To: <48F767C5.8000207@goop.org>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Jeremy Fitzhardinge <jeremy@goop.org>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, ppc-dev <linuxppc-dev@ozlabs.org>, Andrew Morton <akpm@linux-foundation.org>


* Jeremy Fitzhardinge <jeremy@goop.org> wrote:

> Ingo Molnar wrote:
>> * Stephen Rothwell <sfr@canb.auug.org.au> wrote:
>>
>>   
>>> Hi all,
>>>
>>> Today's linux-next build (powerpc allyesconfig) failed like this:
>>>
>>> In file included from arch/powerpc/include/asm/mmu-hash64.h:17,
>>>                  from arch/powerpc/include/asm/mmu.h:8,
>>>                  from arch/powerpc/include/asm/pgtable.h:8,
>>>                  from arch/powerpc/mm/slb.c:20:
>>> arch/powerpc/include/asm/page.h:76: error: expected '=', ',', ';', 'asm' or '__attribute__' before 'memstart_addr'
>>> arch/powerpc/include/asm/page.h:77: error: expected '=', ',', ';', 'asm' or '__attribute__' before 'kernstart_addr'
>>>
>>> Caused by commit 600715dcdf567c86f8b2c6173fcfb4b873e25a19 ("generic: add
>>> phys_addr_t for holding physical addresses") from the tip-core tree.
>>> This only fails if CONFIG_RELOCATABLE is set.
>>>
>>> I have applied the patch below.
>>>     
>>
>> applied to tip/core/urgent, thanks Stephen!
>>   
>
> Shouldn't this go via a ppc tree?  Won't having ppc changes in tip.git  
> make people grumpy?

it was broken via a generic topic: tip/core/resources, not the x86 tree.

	Ingo
