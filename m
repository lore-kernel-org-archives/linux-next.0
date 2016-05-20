From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the dax-misc tree with Linus' tree
Date: Fri, 20 May 2016 13:26:07 +1000
Message-ID: <20160520132607.39e902ef@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:59734 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1754035AbcETD0K (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Thu, 19 May 2016 23:26:10 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: "Verma, Vishal L" <vishal.l.verma@intel.com>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Christoph Hellwig <hch@lst.de>, Al Viro <viro@zeniv.linux.org.uk>, Jan Kara <jack@suse.cz>, Ross Zwisler <ross.zwisler@linux.intel.com>

Hi all,

Today's linux-next merge of the dax-misc tree got a conflict in:

  include/linux/dax.h

between commit:

  c8b8e32d700f ("direct-io: eliminate the offset argument to ->direct_IO")

from Linus' tree and commit:

  e804315dd0f5 ("dax: Define DAX lock bit for radix tree exceptional entry")

from the dax-misc tree.

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
index 982a6c4a62f3,7bf12277c006..000000000000
--- a/include/linux/dax.h
+++ b/include/linux/dax.h
@@@ -3,17 -3,21 +3,21 @@@
  
  #include <linux/fs.h>
  #include <linux/mm.h>
+ #include <linux/radix-tree.h>
  #include <asm/pgtable.h>
  
+ /* We use lowest available exceptional entry bit for locking */
+ #define RADIX_DAX_ENTRY_LOCK (1 << RADIX_TREE_EXCEPTIONAL_SHIFT)
+ 
 -ssize_t dax_do_io(struct kiocb *, struct inode *, struct iov_iter *, loff_t,
 +ssize_t dax_do_io(struct kiocb *, struct inode *, struct iov_iter *,
  		  get_block_t, dio_iodone_t, int flags);
- int dax_clear_sectors(struct block_device *bdev, sector_t _sector, long _size);
  int dax_zero_page_range(struct inode *, loff_t from, unsigned len, get_block_t);
  int dax_truncate_page(struct inode *, loff_t from, get_block_t);
- int dax_fault(struct vm_area_struct *, struct vm_fault *, get_block_t,
- 		dax_iodone_t);
- int __dax_fault(struct vm_area_struct *, struct vm_fault *, get_block_t,
- 		dax_iodone_t);
+ int dax_fault(struct vm_area_struct *, struct vm_fault *, get_block_t);
+ int __dax_fault(struct vm_area_struct *, struct vm_fault *, get_block_t);
+ int dax_delete_mapping_entry(struct address_space *mapping, pgoff_t index);
+ void dax_wake_mapping_entry_waiter(struct address_space *mapping,
+ 				   pgoff_t index, bool wake_all);
  
  #ifdef CONFIG_FS_DAX
  struct page *read_dax_sector(struct block_device *bdev, sector_t n);
