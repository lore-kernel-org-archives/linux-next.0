From: Jerome Glisse <jglisse@redhat.com>
Subject: Re: linux-next: manual merge of the akpm-current tree with Linus'
 tree
Date: Fri, 11 Jan 2019 10:08:53 -0500
Message-ID: <20190111150852.GA3190@redhat.com>
References: <20190111135100.487a1896@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190111135100.487a1896@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Andrew Morton <akpm@linux-foundation.org>, Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Sean Christopherson <sean.j.christopherson@intel.com>
List-Id: linux-next.vger.kernel.org

On Fri, Jan 11, 2019 at 01:51:00PM +1100, Stephen Rothwell wrote:
> Hi all,
> 
> Today's linux-next merge of the akpm-current tree got a conflict in:
> 
>   mm/rmap.c
> 
> between commit:
> 
>   ba422731316d ("mm/mmu_notifier: mm/rmap.c: Fix a mmu_notifier range bug in try_to_unmap_one")
> 
> from Linus' tree and commit:
> 
>   f955d5dda846 ("mm/mmu_notifier: contextual information for event triggering invalidation v2")
> 
> from the akpm-current tree.
> 
> I fixed it up (see below) and can carry the fix as necessary. This
> is now fixed as far as linux-next is concerned, but any non trivial
> conflicts should be mentioned to your upstream maintainer when your tree
> is submitted for merging.  You may also want to consider cooperating
> with the maintainer of the conflicting tree to minimise any particularly
> complex conflicts.

This looks good to me.

Thank you,
Jérôme

> 
> -- 
> Cheers,
> Stephen Rothwell
> 
> diff --cc mm/rmap.c
> index 0454ecc29537,62e47f3462cf..000000000000
> --- a/mm/rmap.c
> +++ b/mm/rmap.c
> @@@ -1371,9 -1372,10 +1372,10 @@@ static bool try_to_unmap_one(struct pag
>   	 * Note that the page can not be free in this function as call of
>   	 * try_to_unmap() must hold a reference on the page.
>   	 */
>  -	mmu_notifier_range_init(&range, vma->vm_mm, vma->vm_start,
>  -				min(vma->vm_end, vma->vm_start +
>  +	mmu_notifier_range_init(&range, vma->vm_mm, address,
>  +				min(vma->vm_end, address +
> - 				    (PAGE_SIZE << compound_order(page))));
> + 				    (PAGE_SIZE << compound_order(page))),
> + 				MMU_NOTIFY_CLEAR);
>   	if (PageHuge(page)) {
>   		/*
>   		 * If sharing is possible, start and end will be adjusted
