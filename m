From: Santosh Shilimkar <santosh.shilimkar@ti.com>
Subject: Re: linux-next: build failure after merge of the akpm-current tree
Date: Mon, 6 Jan 2014 10:06:15 -0500
Message-ID: <52CAC667.1030308@ti.com>
References: <20140106200758.a76bbd94508614b4decabdcd@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from arroyo.ext.ti.com ([192.94.94.40]:41732 "EHLO arroyo.ext.ti.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751470AbaAFPG3 (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Mon, 6 Jan 2014 10:06:29 -0500
In-Reply-To: <20140106200758.a76bbd94508614b4decabdcd@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>, Russell King <rmk@arm.linux.org.uk>
Cc: Andrew Morton <akpm@linux-foundation.org>, "linux-next@vger.kernel.org" <linux-next@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Nicolas Pitre <nico@fluxnic.net>, Rob Herring <rob.herring@calxeda.com>

Stephen,

On Monday 06 January 2014 04:07 AM, Stephen Rothwell wrote:
> Hi Andrew,
> 
> After merging the akpm-current tree, today's linux-next build (arm
> multi_v7_defconfig) failed like this:
> 
> arch/arm/mm/init.c:199:13: error: conflicting types for 'arm_dma_zone_size'
> include/linux/bootmem.h:259:11: note: previous declaration of 'arm_dma_zone_size' was here
> 
> Caused by commit a3ae9362fafe ("mm/memblock: add memblock memory
> allocation apis").
>
> For this build, BOOTMEM_LOW_LIMIT is defined as __pa(MAX_DMA_ADDRESS) and
> MAX_DMA_ADDRESS is defined as:
> 
> #define MAX_DMA_ADDRESS ({ \
>         extern unsigned long arm_dma_zone_size; \
>         arm_dma_zone_size ? \
>                 (PAGE_OFFSET + arm_dma_zone_size) : 0xffffffffUL; })
> 
> and in arch/arm/mm/init.c, arm_dma_zone_size is declared as:
> 
> phys_addr_t arm_dma_zone_size __read_mostly;
> 
> Urk!  :-(
> 
> OK, so commit 364230b995214 ("ARM: use phys_addr_t for DMA zone sizes")
> changed the definition of arm_dma_zone_size except it missed the one in
> arch/arm/include/asm/dma.h.
> 
> I have applied this merge fix patch for today:
> 
The issue was detected earlier and similar patch to yours
was proposed here [1]. But the fix isn't right as rightly
commented by Russell because the DMA_MAX_ADDRESS is a virtual
address which can't be more than 4 GB. Need to figure out
the right fix though.

Regards,
Santosh
[1] http://www.spinics.net/lists/arm-kernel/msg292905.html
