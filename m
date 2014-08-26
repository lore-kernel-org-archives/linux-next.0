From: Xishi Qiu <qiuxishi@huawei.com>
Subject: Re: linux-next: build warnings after merge of the akpm-current tree
Date: Tue, 26 Aug 2014 18:19:30 +0800
Message-ID: <53FC5F32.6060807@huawei.com>
References: <20140826172208.1dbc37db@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from szxga03-in.huawei.com ([119.145.14.66]:3307 "EHLO
	szxga03-in.huawei.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932901AbaHZKTs (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Tue, 26 Aug 2014 06:19:48 -0400
In-Reply-To: <20140826172208.1dbc37db@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>, Tang Chen <tangchen@cn.fujitsu.com>
Cc: Andrew Morton <akpm@linux-foundation.org>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org

On 2014/8/26 15:22, Stephen Rothwell wrote:

> Hi Andrew,
> 
> After merging the akpm-current tree, today's linux-next build (arm
> defconfig) produced these warnings:
> 
> In file included from /scratch/sfr/next/include/asm-generic/bug.h:13:0,
>                  from /scratch/sfr/next/arch/arm/include/asm/bug.h:61,
>                  from /scratch/sfr/next/include/linux/bug.h:4,
>                  from /scratch/sfr/next/include/linux/thread_info.h:11,
>                  from /scratch/sfr/next/include/asm-generic/preempt.h:4,
>                  from arch/arm/include/generated/asm/preempt.h:1,
>                  from /scratch/sfr/next/include/linux/preempt.h:18,
>                  from /scratch/sfr/next/include/linux/spinlock.h:50,
>                  from /scratch/sfr/next/include/linux/mmzone.h:7,
>                  from /scratch/sfr/next/include/linux/gfp.h:5,
>                  from /scratch/sfr/next/include/linux/slab.h:14,
>                  from /scratch/sfr/next/mm/nobootmem.c:13:
> /scratch/sfr/next/mm/nobootmem.c: In function 'free_low_memory_core_early':
> /scratch/sfr/next/include/linux/kernel.h:29:20: warning: large integer implicitly truncated to unsigned type [-Woverflow]
>  #define ULLONG_MAX (~0ULL)
>                     ^
> /scratch/sfr/next/mm/nobootmem.c:122:28: note: in expansion of macro 'ULLONG_MAX'
>   memblock_clear_hotplug(0, ULLONG_MAX);
>                             ^
> 
> Introduced by commit 6e162b4c49f7 ("mem-hotplug: let memblock skip the
> hotpluggable memory regions in __next_mem_range()").  The second
> argument to memblock_clear_hotplug() is a phys_addr_t, which varies in
> size between architectures/platforms.
> 

/arch/x86/mm/numa.c
numa_init()
	...
	WARN_ON(memblock_clear_hotplug(0, ULLONG_MAX));
	...
This function has the same problem too, right?

#define ULLONG_MAX	(~0ULL)  -> always 64 bit, right?

#ifdef CONFIG_PHYS_ADDR_T_64BIT -> phys_addr_t is 32 or 64 bit
typedef u64 phys_addr_t;
#else
typedef u32 phys_addr_t;
#endif

Thanks,
Xishi Qiu
