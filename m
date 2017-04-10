From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the md tree with the block tree
Date: Mon, 10 Apr 2017 12:03:46 +1000
Message-ID: <20170410120346.12076998@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:40233 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1751004AbdDJCDs (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Sun, 9 Apr 2017 22:03:48 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Shaohua Li <shli@kernel.org>, Jens Axboe <axboe@kernel.dk>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Christoph Hellwig <hch@lst.de>, Ming Lei <tom.leiming@gmail.com>

Hi Shaohua,

Today's linux-next merge of the md tree got a conflict in:

  drivers/md/md.h

between commit:

  3deff1a70d59 ("md: support REQ_OP_WRITE_ZEROES")

from the block tree and commits:

  d8e29fbc3bed ("md: move two macros into md.h")
  513e2faa0138 ("md: prepare for managing resync I/O pages in clean way")

from the md tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

-- 
Cheers,
Stephen Rothwell

diff --cc drivers/md/md.h
index 1e76d64ce180,0418b29945e7..000000000000
--- a/drivers/md/md.h
+++ b/drivers/md/md.h
@@@ -710,10 -719,58 +719,65 @@@ static inline void mddev_check_writesam
  		mddev->queue->limits.max_write_same_sectors = 0;
  }
  
 +static inline void mddev_check_write_zeroes(struct mddev *mddev, struct bio *bio)
 +{
 +	if (bio_op(bio) == REQ_OP_WRITE_ZEROES &&
 +	    !bdev_get_queue(bio->bi_bdev)->limits.max_write_zeroes_sectors)
 +		mddev->queue->limits.max_write_zeroes_sectors = 0;
 +}
++
+ /* Maximum size of each resync request */
+ #define RESYNC_BLOCK_SIZE (64*1024)
+ #define RESYNC_PAGES ((RESYNC_BLOCK_SIZE + PAGE_SIZE-1) / PAGE_SIZE)
+ 
+ /* for managing resync I/O pages */
+ struct resync_pages {
+ 	unsigned	idx;	/* for get/put page from the pool */
+ 	void		*raid_bio;
+ 	struct page	*pages[RESYNC_PAGES];
+ };
+ 
+ static inline int resync_alloc_pages(struct resync_pages *rp,
+ 				     gfp_t gfp_flags)
+ {
+ 	int i;
+ 
+ 	for (i = 0; i < RESYNC_PAGES; i++) {
+ 		rp->pages[i] = alloc_page(gfp_flags);
+ 		if (!rp->pages[i])
+ 			goto out_free;
+ 	}
+ 
+ 	return 0;
+ 
+ out_free:
+ 	while (--i >= 0)
+ 		put_page(rp->pages[i]);
+ 	return -ENOMEM;
+ }
+ 
+ static inline void resync_free_pages(struct resync_pages *rp)
+ {
+ 	int i;
+ 
+ 	for (i = 0; i < RESYNC_PAGES; i++)
+ 		put_page(rp->pages[i]);
+ }
+ 
+ static inline void resync_get_all_pages(struct resync_pages *rp)
+ {
+ 	int i;
+ 
+ 	for (i = 0; i < RESYNC_PAGES; i++)
+ 		get_page(rp->pages[i]);
+ }
+ 
+ static inline struct page *resync_fetch_page(struct resync_pages *rp,
+ 					     unsigned idx)
+ {
+ 	if (WARN_ON_ONCE(idx >= RESYNC_PAGES))
+ 		return NULL;
+ 	return rp->pages[idx];
+ }
+ 
  #endif /* _MD_MD_H */
