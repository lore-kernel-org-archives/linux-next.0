From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the akpm-current tree with the dax-misc
 tree
Date: Fri, 20 May 2016 13:58:34 +1000
Message-ID: <20160520135834.726490cc@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:44653 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751971AbcETD6g (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Thu, 19 May 2016 23:58:36 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Andrew Morton <akpm@linux-foundation.org>, "Verma, Vishal L" <vishal.l.verma@intel.com>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Toshi Kani <toshi.kani@hpe.com>, Jan Kara <jack@suse.cz>

Hi Andrew,

Today's linux-next merge of the akpm-current tree got a conflict in:

  include/linux/dax.h

between commit:

  bc2466e42573 ("dax: Use radix tree entry lock to protect cow faults")

from the dax-misc tree and commit:

  c2ce6adc69c8 ("dax: add dax_get_unmapped_area for pmd mappings")

from the akpm-current tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

-- 
Cheers,
Stephen Rothwell

diff --cc include/linux/dax.h
index 43d5f0b799c7,0cd64c152361..000000000000
--- a/include/linux/dax.h
+++ b/include/linux/dax.h
@@@ -21,36 -17,26 +21,39 @@@ void dax_wake_mapping_entry_waiter(stru
  
  #ifdef CONFIG_FS_DAX
  struct page *read_dax_sector(struct block_device *bdev, sector_t n);
 +void dax_unlock_mapping_entry(struct address_space *mapping, pgoff_t index);
 +int __dax_zero_page_range(struct block_device *bdev, sector_t sector,
 +		unsigned int offset, unsigned int length);
+ unsigned long dax_get_unmapped_area(struct file *filp, unsigned long addr,
+ 		unsigned long len, unsigned long pgoff, unsigned long flags);
  #else
  static inline struct page *read_dax_sector(struct block_device *bdev,
  		sector_t n)
  {
  	return ERR_PTR(-ENXIO);
  }
 +/* Shouldn't ever be called when dax is disabled. */
 +static inline void dax_unlock_mapping_entry(struct address_space *mapping,
 +					    pgoff_t index)
 +{
 +	BUG();
 +}
 +static inline int __dax_zero_page_range(struct block_device *bdev,
 +		sector_t sector, unsigned int offset, unsigned int length)
 +{
 +	return -ENXIO;
 +}
+ #define dax_get_unmapped_area	NULL
  #endif
  
 -#ifdef CONFIG_TRANSPARENT_HUGEPAGE
 +#if defined(CONFIG_TRANSPARENT_HUGEPAGE)
  int dax_pmd_fault(struct vm_area_struct *, unsigned long addr, pmd_t *,
 -				unsigned int flags, get_block_t, dax_iodone_t);
 +				unsigned int flags, get_block_t);
  int __dax_pmd_fault(struct vm_area_struct *, unsigned long addr, pmd_t *,
 -				unsigned int flags, get_block_t, dax_iodone_t);
 +				unsigned int flags, get_block_t);
  #else
  static inline int dax_pmd_fault(struct vm_area_struct *vma, unsigned long addr,
 -				pmd_t *pmd, unsigned int flags, get_block_t gb,
 -				dax_iodone_t di)
 +				pmd_t *pmd, unsigned int flags, get_block_t gb)
  {
  	return VM_FAULT_FALLBACK;
  }
