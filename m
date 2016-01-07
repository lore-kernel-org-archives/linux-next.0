From: "Aneesh Kumar K.V" <aneesh.kumar@linux.vnet.ibm.com>
Subject: Re: linux-next: manual merge of the akpm-current tree with the powerpc tree
Date: Thu, 07 Jan 2016 22:45:19 +0530
Message-ID: <87ziwhpazc.fsf@linux.vnet.ibm.com>
References: <20151218163351.5bfd2def@canb.auug.org.au> <20160107201503.6d5ec159@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-next-owner@vger.kernel.org>
Received: from e28smtp03.in.ibm.com ([125.16.236.3]:43930 "EHLO
	e28smtp03.in.ibm.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751920AbcAGRPb (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Thu, 7 Jan 2016 12:15:31 -0500
Received: from localhost
	by e28smtp03.in.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only! Violators will be prosecuted
	for <linux-next@vger.kernel.org> from <aneesh.kumar@linux.vnet.ibm.com>;
	Thu, 7 Jan 2016 22:45:28 +0530
In-Reply-To: <20160107201503.6d5ec159@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>, Andrew Morton <akpm@linux-foundation.org>, Michael Ellerman <mpe@ellerman.id.au>, Benjamin Herrenschmidt <benh@kernel.crashing.org>, linuxppc-dev@lists.ozlabs.org
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org

Stephen Rothwell <sfr@canb.auug.org.au> writes:

> This merge fix up patch now looks like this:


What about the #define pfn_pte part ? We don't need that now ?

>
> From: Stephen Rothwell <sfr@canb.auug.org.au>
> Date: Tue, 15 Dec 2015 16:50:42 +1100
> Subject: [PATCH] merge fix for "powerpc, thp: remove infrastructure for handling splitting PMDs"
>
> Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
> ---
>  arch/powerpc/include/asm/book3s/64/hash-64k.h | 12 ------------
>  arch/powerpc/include/asm/book3s/64/hash.h     | 11 +++--------
>  arch/powerpc/include/asm/book3s/64/pgtable.h  |  4 ----
>  3 files changed, 2 insertions(+), 24 deletions(-)
>
> diff --git a/arch/powerpc/include/asm/book3s/64/hash-64k.h b/arch/powerpc/include/asm/book3s/64/hash-64k.h
> index 9e55e3b1fef0..849bbec80f7b 100644
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
> index 9e861b4378bd..b6827603e613 100644
> --- a/arch/powerpc/include/asm/book3s/64/hash.h
> +++ b/arch/powerpc/include/asm/book3s/64/hash.h
> @@ -36,11 +36,6 @@
>  #define _PAGE_SOFT_DIRTY	0x20000 /* software: software dirty tracking */
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
> @@ -49,9 +44,9 @@
>  /*
>   * set of bits not changed in pmd_modify.
>   */
> -#define _HPAGE_CHG_MASK (PTE_RPN_MASK | _PAGE_HPTEFLAGS |		\
> -			 _PAGE_DIRTY | _PAGE_ACCESSED | _PAGE_SPLITTING | \
> -			 _PAGE_THP_HUGE | _PAGE_PTE | _PAGE_SOFT_DIRTY)
> +#define _HPAGE_CHG_MASK (PTE_RPN_MASK | _PAGE_HPTEFLAGS | _PAGE_DIRTY | \
> +			 _PAGE_ACCESSED | _PAGE_THP_HUGE | _PAGE_PTE | \
> +			 _PAGE_SOFT_DIRTY)
>
>  #ifdef CONFIG_PPC_64K_PAGES
>  #include <asm/book3s/64/hash-64k.h>
> diff --git a/arch/powerpc/include/asm/book3s/64/pgtable.h b/arch/powerpc/include/asm/book3s/64/pgtable.h
> index 03c1a5a21c0c..04022fad3708 100644
> --- a/arch/powerpc/include/asm/book3s/64/pgtable.h
> +++ b/arch/powerpc/include/asm/book3s/64/pgtable.h
> @@ -258,10 +258,6 @@ extern int pmdp_clear_flush_young(struct vm_area_struct *vma,
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
>
>
> -- 
> Cheers,
> Stephen Rothwell                    sfr@canb.auug.org.au
