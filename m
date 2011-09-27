From: Tixy <tixy@yxit.co.uk>
Subject: Re: linux-next: manual merge of the arm-soc tree with the arm tree
Date: Tue, 27 Sep 2011 07:20:57 +0100
Message-ID: <1317104457.2238.16.camel@computer2>
References: <20110927112524.fd0b8f1fe69bc63855ead2d7@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20110927112524.fd0b8f1fe69bc63855ead2d7@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Arnd Bergmann <arnd@arndb.de>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Catalin Marinas <catalin.marinas@arm.com>, Russell King <rmk@arm.linux.org.uk>
List-Id: linux-next.vger.kernel.org

On Tue, 2011-09-27 at 11:25 +1000, Stephen Rothwell wrote:
> Hi Arnd,
> 
> [I have a feeling that I may have reported this previously]
> 
> Today's linux-next merge of the arm-soc tree got a conflict in
> arch/arm/mm/dma-mapping.c between commit e73fc88e19d7 ("ARM: 7059/1:
> LPAE: Use PMD_(SHIFT|SIZE|MASK) instead of PGDIR_*") from the arm tree
> and commit 99d1717dd7fe ("ARM: Add init_consistent_dma_size()") from
> the
> arm-soc tree.
> 
> I fixed it up (I think - see below) and can carry the fix as
> necessary.

The fixup looks correct to me.

-- 
Jon Medhurst (usually known as Tixy)

> -- 
> Cheers,
> Stephen Rothwell                    sfr@canb.auug.org.au
> 
> diff --cc arch/arm/mm/dma-mapping.c
> index 235eb77,50be842..0000000
> --- a/arch/arm/mm/dma-mapping.c
> +++ b/arch/arm/mm/dma-mapping.c
> @@@ -117,14 -119,10 +119,9 @@@ static void __dma_free_buffer(struct pa
>   }
>   
>   #ifdef CONFIG_MMU
> - /* Sanity check size */
> - #if (CONSISTENT_DMA_SIZE % SZ_2M)
> - #error "CONSISTENT_DMA_SIZE must be multiple of 2MiB"
> - #endif
>   
> - #define CONSISTENT_OFFSET(x)  (((unsigned long)(x) - CONSISTENT_BASE) >> PAGE_SHIFT)
> - #define CONSISTENT_PTE_INDEX(x) (((unsigned long)(x) - CONSISTENT_BASE) >> PMD_SHIFT)
> - #define NUM_CONSISTENT_PTES (CONSISTENT_DMA_SIZE >> PMD_SHIFT)
>  -
> + #define CONSISTENT_OFFSET(x)  (((unsigned long)(x) - consistent_base) >> PAGE_SHIFT)
>  -#define CONSISTENT_PTE_INDEX(x) (((unsigned long)(x) - consistent_base) >> PGDIR_SHIFT)
> ++#define CONSISTENT_PTE_INDEX(x) (((unsigned long)(x) - consistent_base) >> PMD_SHIFT)
>   
>   /*
>    * These are the page tables (2MB each) covering uncached, DMA consistent allocations 
