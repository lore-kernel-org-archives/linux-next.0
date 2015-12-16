From: Will Deacon <will.deacon@arm.com>
Subject: Re: linux-next: manual merge of the akpm-current tree with the arm64
 tree
Date: Wed, 16 Dec 2015 10:14:20 +0000
Message-ID: <20151216101420.GA4308@arm.com>
References: <20151216160143.5d1a8d1e@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from foss.arm.com ([217.140.101.70]:54322 "EHLO foss.arm.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S932751AbbLPKO1 (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Wed, 16 Dec 2015 05:14:27 -0500
Content-Disposition: inline
In-Reply-To: <20151216160143.5d1a8d1e@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Andrew Morton <akpm@linux-foundation.org>, Catalin Marinas <catalin.marinas@arm.com>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Ard Biesheuvel <ard.biesheuvel@linaro.org>, Yaowei Bai <baiyaowei@cmss.chinamobile.com>

On Wed, Dec 16, 2015 at 04:01:43PM +1100, Stephen Rothwell wrote:
> Hi Andrew,
> 
> Today's linux-next merge of the akpm-current tree got a conflict in:
> 
>   include/linux/memblock.h
> 
> between commit:
> 
>   bf3d3cc580f9 ("mm/memblock: add MEMBLOCK_NOMAP attribute to memblock memory table")
> 
> from the arm64 tree and commit:
> 
>   f7e2bc7d46e9 ("mm/memblock.c: memblock_is_memory()/reserved() can be boolean")
> 
> from the akpm-current tree.
> 
> I fixed it up (see below) and can carry the fix as necessary (no action
> is required).
> 
> -- 
> Cheers,
> Stephen Rothwell                    sfr@canb.auug.org.au
> 
> diff --cc include/linux/memblock.h
> index fec66f86eeff,359871f2fedd..000000000000
> --- a/include/linux/memblock.h
> +++ b/include/linux/memblock.h
> @@@ -325,10 -318,9 +325,10 @@@ phys_addr_t memblock_mem_size(unsigned 
>   phys_addr_t memblock_start_of_DRAM(void);
>   phys_addr_t memblock_end_of_DRAM(void);
>   void memblock_enforce_memory_limit(phys_addr_t memory_limit);
> - int memblock_is_memory(phys_addr_t addr);
> + bool memblock_is_memory(phys_addr_t addr);
>  +int memblock_is_map_memory(phys_addr_t addr);
>   int memblock_is_region_memory(phys_addr_t base, phys_addr_t size);
> - int memblock_is_reserved(phys_addr_t addr);
> + bool memblock_is_reserved(phys_addr_t addr);
>   bool memblock_is_region_reserved(phys_addr_t base, phys_addr_t size);

Thanks, Steven. I guess we should apply similar int->bool treatment to
memblock_is_map_memory and memblock_is_region_memory, but it's all
cosmetic really.

Will
