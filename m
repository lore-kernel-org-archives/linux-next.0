From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the akpm-current tree with the powerpc
 tree
Date: Mon, 2 May 2016 17:20:15 +1000
Message-ID: <20160502172015.0914d9ec@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:38366 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752931AbcEBHUS (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Mon, 2 May 2016 03:20:18 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Hugh Dickins <hughd@google.com>, "Aneesh Kumar K.V" <aneesh.kumar@linux.vnet.ibm.com>

Hi Andrew,

Today's linux-next merge of the akpm-current tree got a conflict in:

  arch/powerpc/include/asm/book3s/64/pgtable.h

between commit:

  dbaba7a16b7b ("powerpc/mm: THP is only available on hash64 as of now")

from the powerpc tree and commit:

  383b50a4e356 ("arch: fix has_transparent_hugepage()")

from the akpm-current tree.

I fixed it up (see below - the code moved) and can carry the fix as
necessary. This is now fixed as far as linux-next is concerned, but any
non trivial conflicts should be mentioned to your upstream maintainer
when your tree is submitted for merging.  You may also want to consider
cooperating with the maintainer of the conflicting tree to minimise any
particularly complex conflicts.

-- 
Cheers,
Stephen Rothwell

diff --cc arch/powerpc/include/asm/book3s/64/pgtable.h
index 48dc76c13094,8fe6f6b48aa5..000000000000
--- a/arch/powerpc/include/asm/book3s/64/pgtable.h
+++ b/arch/powerpc/include/asm/book3s/64/pgtable.h
@@@ -820,86 -265,9 +820,87 @@@ static inline int pmd_protnone(pmd_t pm
  #define __HAVE_ARCH_PMD_WRITE
  #define pmd_write(pmd)		pte_write(pmd_pte(pmd))
  
 +#ifdef CONFIG_TRANSPARENT_HUGEPAGE
 +extern pmd_t pfn_pmd(unsigned long pfn, pgprot_t pgprot);
 +extern pmd_t mk_pmd(struct page *page, pgprot_t pgprot);
 +extern pmd_t pmd_modify(pmd_t pmd, pgprot_t newprot);
 +extern void set_pmd_at(struct mm_struct *mm, unsigned long addr,
 +		       pmd_t *pmdp, pmd_t pmd);
 +extern void update_mmu_cache_pmd(struct vm_area_struct *vma, unsigned long addr,
 +				 pmd_t *pmd);
 +extern int hash__has_transparent_hugepage(void);
++#define has_transparent_hugepage has_transparent_hugepage
 +static inline int has_transparent_hugepage(void)
 +{
 +	if (radix_enabled())
 +		return radix__has_transparent_hugepage();
 +	return hash__has_transparent_hugepage();
 +}
 +
 +static inline unsigned long
 +pmd_hugepage_update(struct mm_struct *mm, unsigned long addr, pmd_t *pmdp,
 +		    unsigned long clr, unsigned long set)
 +{
 +	if (radix_enabled())
 +		return radix__pmd_hugepage_update(mm, addr, pmdp, clr, set);
 +	return hash__pmd_hugepage_update(mm, addr, pmdp, clr, set);
 +}
 +
 +static inline int pmd_large(pmd_t pmd)
 +{
 +	return !!(pmd_val(pmd) & _PAGE_PTE);
 +}
 +
 +static inline pmd_t pmd_mknotpresent(pmd_t pmd)
 +{
 +	return __pmd(pmd_val(pmd) & ~_PAGE_PRESENT);
 +}
 +/*
 + * For radix we should always find H_PAGE_HASHPTE zero. Hence
 + * the below will work for radix too
 + */
 +static inline int __pmdp_test_and_clear_young(struct mm_struct *mm,
 +					      unsigned long addr, pmd_t *pmdp)
 +{
 +	unsigned long old;
 +
 +	if ((pmd_val(*pmdp) & (_PAGE_ACCESSED | H_PAGE_HASHPTE)) == 0)
 +		return 0;
 +	old = pmd_hugepage_update(mm, addr, pmdp, _PAGE_ACCESSED, 0);
 +	return ((old & _PAGE_ACCESSED) != 0);
 +}
 +
 +#define __HAVE_ARCH_PMDP_SET_WRPROTECT
 +static inline void pmdp_set_wrprotect(struct mm_struct *mm, unsigned long addr,
 +				      pmd_t *pmdp)
 +{
 +
 +	if ((pmd_val(*pmdp) & _PAGE_WRITE) == 0)
 +		return;
 +
 +	pmd_hugepage_update(mm, addr, pmdp, _PAGE_WRITE, 0);
 +}
 +
 +static inline int pmd_trans_huge(pmd_t pmd)
 +{
 +	if (radix_enabled())
 +		return radix__pmd_trans_huge(pmd);
 +	return hash__pmd_trans_huge(pmd);
 +}
 +
 +#define __HAVE_ARCH_PMD_SAME
 +static inline int pmd_same(pmd_t pmd_a, pmd_t pmd_b)
 +{
 +	if (radix_enabled())
 +		return radix__pmd_same(pmd_a, pmd_b);
 +	return hash__pmd_same(pmd_a, pmd_b);
 +}
 +
  static inline pmd_t pmd_mkhuge(pmd_t pmd)
  {
 -	return __pmd(pmd_val(pmd) | (_PAGE_PTE | _PAGE_THP_HUGE));
 +	if (radix_enabled())
 +		return radix__pmd_mkhuge(pmd);
 +	return hash__pmd_mkhuge(pmd);
  }
  
  #define __HAVE_ARCH_PMDP_SET_ACCESS_FLAGS
