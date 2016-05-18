From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the akpm-current tree with the dax-misc
 tree
Date: Wed, 18 May 2016 13:57:30 +1000
Message-ID: <20160518135730.292f0577@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:38188 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751517AbcERD5d (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Tue, 17 May 2016 23:57:33 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Andrew Morton <akpm@linux-foundation.org>, "Verma, Vishal L" <vishal.l.verma@intel.com>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Christoph Hellwig <hch@lst.de>, Toshi Kani <toshi.kani@hpe.com>

Hi Andrew,

Today's linux-next merge of the akpm-current tree got a conflict in:

  include/linux/dax.h

between commit:

  ecdb4bf9e327 ("dax: export a low-level __dax_zero_page_range helper")

from the dax-misc tree and commit:

  29d44f6759f6 ("dax: add dax_get_unmapped_area for pmd mappings")

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
index 7743e51f826c,184b1714900c..000000000000
--- a/include/linux/dax.h
+++ b/include/linux/dax.h
@@@ -14,19 -17,15 +14,22 @@@ int __dax_fault(struct vm_area_struct *
  
  #ifdef CONFIG_FS_DAX
  struct page *read_dax_sector(struct block_device *bdev, sector_t n);
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
 +static inline int __dax_zero_page_range(struct block_device *bdev,
 +		sector_t sector, unsigned int offset, unsigned int length)
 +{
 +	return -ENXIO;
 +}
+ #define dax_get_unmapped_area	NULL
  #endif
  
  #ifdef CONFIG_TRANSPARENT_HUGEPAGE
