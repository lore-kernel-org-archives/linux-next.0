From: Santosh Shilimkar <santosh.shilimkar@ti.com>
Subject: Re: linux-next: build failure after merge of the akpm-current tree
Date: Mon, 6 Jan 2014 14:40:11 -0500
Message-ID: <52CB069B.9050302@ti.com>
References: <20140106200758.a76bbd94508614b4decabdcd@canb.auug.org.au> <20140106172848.GA9162@flint.arm.linux.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from devils.ext.ti.com ([198.47.26.153]:58199 "EHLO
	devils.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755567AbaAFTkX (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Mon, 6 Jan 2014 14:40:23 -0500
In-Reply-To: <20140106172848.GA9162@flint.arm.linux.org.uk>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Russell King <rmk@arm.linux.org.uk>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, Andrew Morton <akpm@linux-foundation.org>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Nicolas Pitre <nico@fluxnic.net>, Rob Herring <rob.herring@calxeda.com>

On Monday 06 January 2014 12:28 PM, Russell King wrote:
> On Mon, Jan 06, 2014 at 08:07:58PM +1100, Stephen Rothwell wrote:
>> Hi Andrew,
>>
>> After merging the akpm-current tree, today's linux-next build (arm
>> multi_v7_defconfig) failed like this:
>>
>> arch/arm/mm/init.c:199:13: error: conflicting types for 'arm_dma_zone_size'
>> include/linux/bootmem.h:259:11: note: previous declaration of 'arm_dma_zone_size' was here
>>
>> Caused by commit a3ae9362fafe ("mm/memblock: add memblock memory
>> allocation apis").
>>
>> For this build, BOOTMEM_LOW_LIMIT is defined as __pa(MAX_DMA_ADDRESS) and
>> MAX_DMA_ADDRESS is defined as:
>>
>> #define MAX_DMA_ADDRESS ({ \
>>         extern unsigned long arm_dma_zone_size; \
>>         arm_dma_zone_size ? \
>>                 (PAGE_OFFSET + arm_dma_zone_size) : 0xffffffffUL; })
>>
>> and in arch/arm/mm/init.c, arm_dma_zone_size is declared as:
>>
>> phys_addr_t arm_dma_zone_size __read_mostly;
>>
>> Urk!  :-(
>>
>> OK, so commit 364230b995214 ("ARM: use phys_addr_t for DMA zone sizes")
>> changed the definition of arm_dma_zone_size except it missed the one in
>> arch/arm/include/asm/dma.h.
>>
>> I have applied this merge fix patch for today:
> 
> There's more here than just this change required here.  We also need to
> limit it if PAGE_OFFSET + arm_dma_zone_size is greater than 4GB, as
> MAX_DMA_ADDRESS is a virtual address - we really don't want the 32-bit
> value of this wrapping.
> 
> Exactly how we go about this, I'm not sure at the moment, but maybe
> something like this:
> 
> #define MAX_DMA_ADDRESS ({ \
>         extern phys_addr_t arm_dma_zone_size; \
>         arm_dma_zone_size && arm_dma_zone_size < (0x10000000 - PAGE_OFFSET) ? \
>                 (PAGE_OFFSET + arm_dma_zone_size) : 0xffffffffUL; })
> 
Looks good to me. Will you create a patch or you want me to create based
on above ?

Regards,
Santosh
