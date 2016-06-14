From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the md tree with the block tree
Date: Tue, 14 Jun 2016 13:52:51 +1000
Message-ID: <20160614135251.3b67f1f9@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:41900 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S933011AbcFNDwy (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Mon, 13 Jun 2016 23:52:54 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Shaohua Li <shli@kernel.org>, Jens Axboe <axboe@kernel.dk>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Mike Christie <mchristi@redhat.com>, NeilBrown <neilb@suse.com>

Hi Shaohua,

Today's linux-next merge of the md tree got a conflict in:

  drivers/md/raid1.c

between commit:

  796a5cf083c2 ("md: use bio op accessors")

from the block tree and commit:

  707a6a420ccf ("md/raid1: add rcu protection to rdev in fix_read_error")

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

diff --cc drivers/md/raid1.c
index 41d9c31da3b3,5027ef4752ac..000000000000
--- a/drivers/md/raid1.c
+++ b/drivers/md/raid1.c
@@@ -2086,15 -2069,20 +2067,21 @@@ static void fix_read_error(struct r1con
  			     (!test_bit(Faulty, &rdev->flags) &&
  			      rdev->recovery_offset >= sect + s)) &&
  			    is_badblock(rdev, sect, s,
- 					&first_bad, &bad_sectors) == 0 &&
- 			    sync_page_io(rdev, sect, s<<9,
- 					 conf->tmppage, REQ_OP_READ, 0, false))
- 				success = 1;
- 			else {
- 				d++;
- 				if (d == conf->raid_disks * 2)
- 					d = 0;
- 			}
+ 					&first_bad, &bad_sectors) == 0) {
+ 				atomic_inc(&rdev->nr_pending);
+ 				rcu_read_unlock();
+ 				if (sync_page_io(rdev, sect, s<<9,
 -						 conf->tmppage, READ, false))
++						 conf->tmppage, REQ_OP_READ, 0,
++						 false))
+ 					success = 1;
+ 				rdev_dec_pending(rdev, mddev);
+ 				if (success)
+ 					break;
+ 			} else
+ 				rcu_read_unlock();
+ 			d++;
+ 			if (d == conf->raid_disks * 2)
+ 				d = 0;
  		} while (!success && d != read_disk);
  
  		if (!success) {
