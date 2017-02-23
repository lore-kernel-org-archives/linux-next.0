From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the md tree with Linus' tree
Date: Thu, 23 Feb 2017 12:21:50 +1100
Message-ID: <20170223122150.42a717f0@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:55039 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S932638AbdBWBVy (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Wed, 22 Feb 2017 20:21:54 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Shaohua Li <shli@kernel.org>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Christoph Hellwig <hch@lst.de>, Jens Axboe <axboe@fb.com>

Hi Shaohua,

Today's linux-next merge of the md tree got a conflict in:

  drivers/md/raid1.c

between commit:

  309bd96af9e2 ("md: cleanup bio op / flags handling in raid1_write_request")

from Linus' tree and commit:

  52b82fcc095d ("md/raid1: handle flush request correctly")

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
index 830ff2b20346,33526b4d4d10..000000000000
--- a/drivers/md/raid1.c
+++ b/drivers/md/raid1.c
@@@ -1385,8 -1515,7 +1512,8 @@@ static void raid1_write_request(struct 
  				   conf->mirrors[i].rdev->data_offset);
  		mbio->bi_bdev = conf->mirrors[i].rdev->bdev;
  		mbio->bi_end_io	= raid1_end_write_request;
 -		bio_set_op_attrs(mbio, op, do_fua | do_sync);
 +		mbio->bi_opf = bio_op(bio) |
- 			(bio->bi_opf & (REQ_SYNC | REQ_PREFLUSH | REQ_FUA));
++			(bio->bi_opf & (REQ_SYNC | REQ_FUA));
  		if (test_bit(FailFast, &conf->mirrors[i].rdev->flags) &&
  		    !test_bit(WriteMostly, &conf->mirrors[i].rdev->flags) &&
  		    conf->raid_disks - mddev->degraded > 1)
