From: Ira Weiny <ira.weiny@intel.com>
Subject: Re: linux-next: manual merge of the akpm-current tree with the
 powerpc-fixes tree
Date: Tue, 23 Apr 2019 10:00:44 -0700
Message-ID: <20190423170044.GA30084@iweiny-DESK2.sc.intel.com>
References: <20190423190606.0fefb856@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190423190606.0fefb856@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Andrew Morton <akpm@linux-foundation.org>, Michael Ellerman <mpe@ellerman.id.au>, PowerPC <linuxppc-dev@lists.ozlabs.org>, Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Alexey Kardashevskiy <aik@ozlabs.ru>
List-Id: linux-next.vger.kernel.org

On Tue, Apr 23, 2019 at 07:06:06PM +1000, Stephen Rothwell wrote:
> Hi all,
> 
> Today's linux-next merge of the akpm-current tree got a conflict in:
> 
>   arch/powerpc/mm/mmu_context_iommu.c
> 
> between commits:
> 
>   eb9d7a62c386 ("powerpc/mm_iommu: Fix potential deadlock")
>   7a3a4d763837 ("powerpc/mm_iommu: Allow pinning large regions")
> 
> from the powerpc-fixes tree and commit:
> 
>   02f506bad7af ("mm/gup: replace get_user_pages_longterm() with FOLL_LONGTERM")
> 
> from the akpm-current tree.
> 
> I fixed it up (see below) and can carry the fix as necessary. This

Thanks Stephen

Looks good for my changes.

Acked-by: Ira Weiny <ira.weiny@intel.com>

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
> diff --cc arch/powerpc/mm/mmu_context_iommu.c
> index 8330f135294f,755fe7adc0d8..000000000000
> --- a/arch/powerpc/mm/mmu_context_iommu.c
> +++ b/arch/powerpc/mm/mmu_context_iommu.c
> @@@ -135,27 -144,18 +131,28 @@@ static long mm_iommu_do_alloc(struct mm
>   	}
>   
>   	down_read(&mm->mmap_sem);
>  -	ret = get_user_pages(ua, entries, FOLL_WRITE | FOLL_LONGTERM,
>  -			     mem->hpages, NULL);
>  +	chunk = (1UL << (PAGE_SHIFT + MAX_ORDER - 1)) /
>  +			sizeof(struct vm_area_struct *);
>  +	chunk = min(chunk, entries);
>  +	for (entry = 0; entry < entries; entry += chunk) {
>  +		unsigned long n = min(entries - entry, chunk);
>  +
> - 		ret = get_user_pages_longterm(ua + (entry << PAGE_SHIFT), n,
> - 				FOLL_WRITE, mem->hpages + entry, NULL);
> ++		ret = get_user_pages(ua + (entry << PAGE_SHIFT), n,
> ++				     FOLL_WRITE | FOLL_LONGTERM,
> ++				     mem->hpages + entry, NULL);
>  +		if (ret == n) {
>  +			pinned += n;
>  +			continue;
>  +		}
>  +		if (ret > 0)
>  +			pinned += ret;
>  +		break;
>  +	}
>   	up_read(&mm->mmap_sem);
>  -	if (ret != entries) {
>  -		/* free the reference taken */
>  -		for (i = 0; i < ret; i++)
>  -			put_page(mem->hpages[i]);
>  -
>  -		vfree(mem->hpas);
>  -		kfree(mem);
>  -		ret = -EFAULT;
>  -		goto unlock_exit;
>  +	if (pinned != entries) {
>  +		if (!ret)
>  +			ret = -EFAULT;
>  +		goto free_exit;
>   	}
>   
>   	pageshift = PAGE_SHIFT;
