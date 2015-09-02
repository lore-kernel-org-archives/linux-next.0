From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the device-mapper tree with the block
 tree
Date: Wed, 2 Sep 2015 12:39:29 +1000
Message-ID: <20150902123929.1b216311@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:40477 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1750717AbbIBCjb (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Tue, 1 Sep 2015 22:39:31 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Alasdair G Kergon <agk@redhat.com>, Mike Snitzer <snitzer@redhat.com>, Jens Axboe <axboe@kernel.dk>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Joe Thornber <ejt@redhat.com>, Christoph Hellwig <hch@lst.de>

Hi all,

Today's linux-next merge of the device-mapper tree got a conflict in:

  drivers/md/dm-cache-target.c

between commit:

  4246a0b63bd8 ("block: add a bi_error field to struct bio")

from the block tree and commit:

  cc7da0ba9c96 ("dm cache: fix use after freeing migrations")

from the device-mapper tree.

I fixed it up (see below) and can carry the fix as necessary (no action
is required).

-- 
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au

diff --cc drivers/md/dm-cache-target.c
index 7245071778db,f9d9cc6a094b..000000000000
--- a/drivers/md/dm-cache-target.c
+++ b/drivers/md/dm-cache-target.c
@@@ -1358,9 -1352,10 +1352,10 @@@ static void issue_discard(struct dm_cac
  		b = to_dblock(from_dblock(b) + 1);
  	}
  
 -	bio_endio(bio, 0);
 +	bio_endio(bio);
- 	cell_defer(mg->cache, mg->new_ocell, false);
+ 	cell_defer(cache, mg->new_ocell, false);
  	free_migration(mg);
+ 	wake_worker(cache);
  }
  
  static void issue_copy_or_discard(struct dm_cache_migration *mg)
