From: "Aneesh Kumar K.V" <aneesh.kumar@linux.vnet.ibm.com>
Subject: Re: linux-next: manual merge of the akpm-current tree with the powerpc tree
Date: Tue, 15 Dec 2015 15:07:43 +0530
Message-ID: <87poy8uk60.fsf@linux.vnet.ibm.com>
References: <20151215165342.15bb4526@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-next-owner@vger.kernel.org>
Received: from e28smtp04.in.ibm.com ([125.16.236.4]:44148 "EHLO
	e28smtp04.in.ibm.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S933255AbbLOJhy (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Tue, 15 Dec 2015 04:37:54 -0500
Received: from localhost
	by e28smtp04.in.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only! Violators will be prosecuted
	for <linux-next@vger.kernel.org> from <aneesh.kumar@linux.vnet.ibm.com>;
	Tue, 15 Dec 2015 15:07:50 +0530
In-Reply-To: <20151215165342.15bb4526@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>, Andrew Morton <akpm@linux-foundation.org>, Michael Ellerman <mpe@ellerman.id.au>, Benjamin Herrenschmidt <benh@kernel.crashing.org>, linuxppc-dev@lists.ozlabs.org
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>

Stephen Rothwell <sfr@canb.auug.org.au> writes:

> Hi Andrew,
>
> Today's linux-next merge of the akpm-current tree got conflicts in:
>
>   arch/powerpc/include/asm/nohash/64/pgtable.h
>   arch/powerpc/mm/pgtable_64.c
>
> between various commits from the powerpc tree and commits:
>
>   e56ebae0dd4c ("powerpc, thp: remove infrastructure for handling splitting PMDs")


For reference the web url for the patch

http://article.gmane.org/gmane.linux.kernel.mm/139654


>
> from the akpm-current tree.
>
> I used the powerpc tree version of the first and the akpm-current tree
> version of the second and then I applied the following merge fix patch:
>
> From: Stephen Rothwell <sfr@canb.auug.org.au>
> Date: Tue, 15 Dec 2015 16:50:42 +1100
> Subject: [PATCH] merge fix for "powerpc, thp: remove infrastructure for
>  handling splitting PMDs"
>
> Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>


Looks good.
Reviewed-by: Aneesh Kumar K.V <aneesh.kumar@linux.vnet.ibm.com>



> ---
>  arch/powerpc/include/asm/book3s/64/hash-64k.h | 12 ------------
>  arch/powerpc/include/asm/book3s/64/hash.h     | 10 ++--------
>  arch/powerpc/include/asm/book3s/64/pgtable.h  |  4 ----
>  3 files changed, 2 insertions(+), 24 deletions(-)
>
> diff --git a/arch/powerpc/include/asm/book3s/64/hash-64k.h b/arch/powerpc/include/asm/book3s/64/hash-64k.h
> index 9f9942998587..f2072a4ca9e3 100644
> --- a/arch/powerpc/include/asm/book3s/64/hash-64k.h
> +++ b/arch/powerpc/include/asm/book3s/64/hash-64k.h
> @@ -256,13 +256,6 @@ static inline int pmd_trans_huge(pmd_t pmd)
>  		  (_PAGE_PTE | _PAGE_THP_HUGE));
>  }
>
> -static inline int pmd_trans_splitting(pmd_t pmd)
> -{
> -	if (pmd_trans_huge(pmd))
> -		return pmd_val(pmd) & _PAGE_SPLITTING;
> -	return 0;
> -}
> -
>  static inline int pmd_large(pmd_t pmd)
>  {
>  	return !!(pmd_val(pmd) & _PAGE_PTE);
> @@ -273,11 +266,6 @@ static inline pmd_t pmd_mknotpresent(pmd_t pmd)
>  	return __pmd(pmd_val(pmd) & ~_PAGE_PRESENT);
>  }
>
> -static inline pmd_t pmd_mksplitting(pmd_t pmd)
> -{
> -	return __pmd(pmd_val(pmd) | _PAGE_SPLITTING);
> -}
> -
>  #define __HAVE_ARCH_PMD_SAME
>  static inline int pmd_same(pmd_t pmd_a, pmd_t pmd_b)
>  {
> diff --git a/arch/powerpc/include/asm/book3s/64/hash.h b/arch/powerpc/include/asm/book3s/64/hash.h
> index 8b929e531758..4e69d9a273ed 100644
> --- a/arch/powerpc/include/asm/book3s/64/hash.h
> +++ b/arch/powerpc/include/asm/book3s/64/hash.h
> @@ -35,11 +35,6 @@
>  #define _PAGE_SPECIAL		0x10000 /* software: special page */
>
>  /*
> - * THP pages can't be special. So use the _PAGE_SPECIAL
> - */
> -#define _PAGE_SPLITTING _PAGE_SPECIAL
> -
> -/*
>   * We need to differentiate between explicit huge page and THP huge
>   * page, since THP huge page also need to track real subpage details
>   */
> @@ -48,9 +43,8 @@
>  /*
>   * set of bits not changed in pmd_modify.
>   */
> -#define _HPAGE_CHG_MASK (PTE_RPN_MASK | _PAGE_HPTEFLAGS |		\
> -			 _PAGE_DIRTY | _PAGE_ACCESSED | _PAGE_SPLITTING | \
> -			 _PAGE_THP_HUGE | _PAGE_PTE)
> +#define _HPAGE_CHG_MASK (PTE_RPN_MASK | _PAGE_HPTEFLAGS | _PAGE_DIRTY |
> +			 _PAGE_ACCESSED | _PAGE_THP_HUGE | _PAGE_PTE)
>
>  #ifdef CONFIG_PPC_64K_PAGES
>  #include <asm/book3s/64/hash-64k.h>
> diff --git a/arch/powerpc/include/asm/book3s/64/pgtable.h b/arch/powerpc/include/asm/book3s/64/pgtable.h
> index a2d4e0e37067..6306d6565ee0 100644
> --- a/arch/powerpc/include/asm/book3s/64/pgtable.h
> +++ b/arch/powerpc/include/asm/book3s/64/pgtable.h
> @@ -232,10 +232,6 @@ extern int pmdp_clear_flush_young(struct vm_area_struct *vma,
>  extern pmd_t pmdp_huge_get_and_clear(struct mm_struct *mm,
>  				     unsigned long addr, pmd_t *pmdp);
>
> -#define __HAVE_ARCH_PMDP_SPLITTING_FLUSH
> -extern void pmdp_splitting_flush(struct vm_area_struct *vma,
> -				 unsigned long address, pmd_t *pmdp);
> -
>  extern pmd_t pmdp_collapse_flush(struct vm_area_struct *vma,
>  				 unsigned long address, pmd_t *pmdp);
>  #define pmdp_collapse_flush pmdp_collapse_flush
> -- 
> 2.6.2
>
> -- 
> Cheers,
> Stephen Rothwell                    sfr@canb.auug.org.au
