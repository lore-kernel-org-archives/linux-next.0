From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the md tree with the block tree
Date: Mon, 17 Aug 2015 14:44:10 +1000
Message-ID: <20150817144410.1a82e308@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Neil Brown <neilb@suse.de>, Jens Axboe <axboe@kernel.dk>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Christoph Hellwig <hch@lst.de>
List-Id: linux-next.vger.kernel.org

Hi Neil,

Today's linux-next merge of the md tree got a conflict in:

  drivers/md/raid10.c

between commit:

  4246a0b63bd8 ("block: add a bi_error field to struct bio")

from the block tree and commit:

  90421c7cfde6 ("md/raid10: ensure device failure recorded before write request returns.")

from the md tree.

I fixed it up (see below) and can carry the fix as necessary (no action
is required).

-- 
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au

diff --cc drivers/md/raid10.c
index b0fce2ebf7ad,a14c304aa751..000000000000
--- a/drivers/md/raid10.c
+++ b/drivers/md/raid10.c
@@@ -2633,7 -2750,9 +2635,8 @@@ static void handle_write_completed(stru
  					r10_bio->devs[m].addr,
  					r10_bio->sectors, 0);
  				rdev_dec_pending(rdev, conf->mddev);
 -			} else if (bio != NULL &&
 -				   !test_bit(BIO_UPTODATE, &bio->bi_flags)) {
 +			} else if (bio != NULL && bio->bi_error) {
+ 				fail = true;
  				if (!narrow_write_error(r10_bio, m)) {
  					md_error(conf->mddev, rdev);
  					set_bit(R10BIO_Degraded,
