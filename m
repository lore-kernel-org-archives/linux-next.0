From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the nvdimm tree with the block tree
Date: Mon, 24 Apr 2017 15:50:25 +1000
Message-ID: <20170424155025.2075aaf8@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:33479 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1046244AbdDXFu2 (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Mon, 24 Apr 2017 01:50:28 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Dan Williams <dan.j.williams@intel.com>, Jens Axboe <axboe@kernel.dk>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Christoph Hellwig <hch@lst.de>

Hi Dan,

Today's linux-next merge of the nvdimm tree got a conflict in:

  fs/dax.c

between commit:

  ee472d835c26 ("block: add a flags argument to (__)blkdev_issue_zeroout")

from the block tree and commit:

  52d52d6f1178 ("filesystem-dax: convert to dax_direct_access()")

from the nvdimm tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

-- 
Cheers,
Stephen Rothwell

diff --cc fs/dax.c
index 6433650be833,5b7ee1bc74d0..000000000000
--- a/fs/dax.c
+++ b/fs/dax.c
@@@ -979,24 -956,36 +965,36 @@@ static bool dax_range_is_aligned(struc
  	return true;
  }
  
- int __dax_zero_page_range(struct block_device *bdev, sector_t sector,
- 		unsigned int offset, unsigned int length)
+ int __dax_zero_page_range(struct block_device *bdev,
+ 		struct dax_device *dax_dev, sector_t sector,
+ 		unsigned int offset, unsigned int size)
  {
- 	struct blk_dax_ctl dax = {
- 		.sector		= sector,
- 		.size		= PAGE_SIZE,
- 	};
- 
- 	if (dax_range_is_aligned(bdev, offset, length)) {
- 		sector_t start_sector = dax.sector + (offset >> 9);
+ 	if (dax_range_is_aligned(bdev, offset, size)) {
+ 		sector_t start_sector = sector + (offset >> 9);
  
  		return blkdev_issue_zeroout(bdev, start_sector,
- 				length >> 9, GFP_NOFS, 0);
 -				size >> 9, GFP_NOFS, true);
++				size >> 9, GFP_NOFS, 0);
  	} else {
- 		if (dax_map_atomic(bdev, &dax) < 0)
- 			return PTR_ERR(dax.addr);
- 		clear_pmem(dax.addr + offset, length);
- 		dax_unmap_atomic(bdev, &dax);
+ 		pgoff_t pgoff;
+ 		long rc, id;
+ 		void *kaddr;
+ 		pfn_t pfn;
+ 
+ 		rc = bdev_dax_pgoff(bdev, sector, size, &pgoff);
+ 		if (rc)
+ 			return rc;
+ 
+ 		id = dax_read_lock();
+ 		rc = dax_direct_access(dax_dev, pgoff, PHYS_PFN(size), &kaddr,
+ 				&pfn);
+ 		if (rc < 0) {
+ 			dax_read_unlock(id);
+ 			return rc;
+ 		}
+ 		memset(kaddr + offset, 0, size);
+ 		if (test_bit(QUEUE_FLAG_WC, &bdev->bd_queue->queue_flags))
+ 			dax_flush(dax_dev, pgoff, kaddr + offset, size);
+ 		dax_read_unlock(id);
  	}
  	return 0;
  }
