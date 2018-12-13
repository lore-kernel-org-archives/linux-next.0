From: Will Deacon <will.deacon@arm.com>
Subject: Re: linux-next: manual merge of the akpm-current tree with the arm64
 tree
Date: Thu, 13 Dec 2018 11:12:22 +0000
Message-ID: <20181213111221.GB31177@edgewater-inn.cambridge.arm.com>
References: <20181213170107.38bd04d6@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20181213170107.38bd04d6@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Andrew Morton <akpm@linux-foundation.org>, Catalin Marinas <catalin.marinas@arm.com>, Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Robin Murphy <robin.murphy@arm.com>
List-Id: linux-next.vger.kernel.org

On Thu, Dec 13, 2018 at 05:01:07PM +1100, Stephen Rothwell wrote:
> Hi all,
> 
> Today's linux-next merge of the akpm-current tree got a conflict in:
> 
>   arch/arm64/mm/mmu.c
> 
> between commit:
> 
>   4ab215061554 ("arm64: Add memory hotplug support")
> 
> from the arm64 tree and commit:
> 
>   232619fcc076 ("lib/ioremap: ensure break-before-make is used for huge p4d mappings")
> 
> from the akpm-current tree.
> 
> I fixed it up (see below) and can carry the fix as necessary. This
> is now fixed as far as linux-next is concerned, but any non trivial
> conflicts should be mentioned to your upstream maintainer when your tree
> is submitted for merging.  You may also want to consider cooperating
> with the maintainer of the conflicting tree to minimise any particularly
> complex conflicts.
> 
> -- 
> Cheers,
> Stephen Rothwell
> 
> diff --cc arch/arm64/mm/mmu.c
> index da513a1facf4,cf9a26d3d7f5..000000000000
> --- a/arch/arm64/mm/mmu.c
> +++ b/arch/arm64/mm/mmu.c
> @@@ -1047,19 -1029,7 +1043,24 @@@ int pud_free_pmd_page(pud_t *pudp, unsi
>   	return 1;
>   }
>   
>  +#ifdef CONFIG_MEMORY_HOTPLUG
>  +int arch_add_memory(int nid, u64 start, u64 size, struct vmem_altmap *altmap,
>  +		    bool want_memblock)
>  +{
>  +	int flags = 0;
>  +
>  +	if (rodata_full || debug_pagealloc_enabled())
>  +		flags = NO_BLOCK_MAPPINGS | NO_CONT_MAPPINGS;
>  +
>  +	__create_pgd_mapping(swapper_pg_dir, start, __phys_to_virt(start),
>  +			     size, PAGE_KERNEL, pgd_pgtable_alloc, flags);
>  +
>  +	return __add_pages(nid, start >> PAGE_SHIFT, size >> PAGE_SHIFT,
>  +			   altmap, want_memblock);
>  +}
>  +#endif
> ++
> + int p4d_free_pud_page(p4d_t *p4d, unsigned long addr)
> + {
> + 	return 0;	/* Don't attempt a block mapping */
> + }

Looks good to me, thanks.

Will
