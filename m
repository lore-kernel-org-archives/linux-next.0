From: Jeremy Fitzhardinge <jeremy@goop.org>
Subject: Re: linux-next:  build failure
Date: Thu, 16 Oct 2008 09:11:49 -0700
Message-ID: <48F767C5.8000207@goop.org>
References: <20081016202907.978d00b1.sfr@canb.auug.org.au> <20081016103916.GA30745@elte.hu>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from gw.goop.org ([64.81.55.164]:49282 "EHLO mail.goop.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751719AbYJPQLw (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Thu, 16 Oct 2008 12:11:52 -0400
In-Reply-To: <20081016103916.GA30745@elte.hu>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Ingo Molnar <mingo@elte.hu>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, ppc-dev <linuxppc-dev@ozlabs.org>, Andrew Morton <akpm@linux-foundation.org>

Ingo Molnar wrote:
> * Stephen Rothwell <sfr@canb.auug.org.au> wrote:
>
>   
>> Hi all,
>>
>> Today's linux-next build (powerpc allyesconfig) failed like this:
>>
>> In file included from arch/powerpc/include/asm/mmu-hash64.h:17,
>>                  from arch/powerpc/include/asm/mmu.h:8,
>>                  from arch/powerpc/include/asm/pgtable.h:8,
>>                  from arch/powerpc/mm/slb.c:20:
>> arch/powerpc/include/asm/page.h:76: error: expected '=', ',', ';', 'asm' or '__attribute__' before 'memstart_addr'
>> arch/powerpc/include/asm/page.h:77: error: expected '=', ',', ';', 'asm' or '__attribute__' before 'kernstart_addr'
>>
>> Caused by commit 600715dcdf567c86f8b2c6173fcfb4b873e25a19 ("generic: add
>> phys_addr_t for holding physical addresses") from the tip-core tree.
>> This only fails if CONFIG_RELOCATABLE is set.
>>
>> I have applied the patch below.
>>     
>
> applied to tip/core/urgent, thanks Stephen!
>   

Shouldn't this go via a ppc tree?  Won't having ppc changes in tip.git 
make people grumpy?

    J
