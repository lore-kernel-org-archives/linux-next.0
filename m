From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the block tree with the btrfs tree
Date: Tue, 14 Jun 2016 12:44:51 +1000
Message-ID: <20160614124451.25bbe808@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Jens Axboe <axboe@kernel.dk>, David Sterba <dsterba@suse.cz>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Mike Christie <mchristi@redhat.com>, Liu Bo <bo.li.liu@oracle.com>
List-Id: linux-next.vger.kernel.org

Hi Jens,

Today's linux-next merge of the block tree got a conflict in:

  fs/btrfs/extent_io.c

between commit:

  f338d193e1c5 ("Btrfs: fix eb memory leak due to readpage failure")

from the btrfs tree and commit:

  1f7ad75b13b5 ("btrfs: have submit_one_bio users use bio op accessors")

from the block tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

-- 
Cheers,
Stephen Rothwell

diff --cc fs/btrfs/extent_io.c
index b8ecc6af4531,4f8bace0fd1b..000000000000
--- a/fs/btrfs/extent_io.c
+++ b/fs/btrfs/extent_io.c
@@@ -5253,18 -5225,9 +5251,18 @@@ int read_extent_buffer_pages(struct ext
  			err = __extent_read_full_page(tree, page,
  						      get_extent, &bio,
  						      mirror_num, &bio_flags,
- 						      READ | REQ_META);
+ 						      REQ_META);
 -			if (err)
 +			if (err) {
  				ret = err;
 +				/*
 +				 * We use &bio in above __extent_read_full_page,
 +				 * so we ensure that if it returns error, the
 +				 * current page fails to add itself to bio.
 +				 *
 +				 * We must dec io_pages by ourselves.
 +				 */
 +				atomic_dec(&eb->io_pages);
 +			}
  		} else {
  			unlock_page(page);
  		}
