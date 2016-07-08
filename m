From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the block tree with the btrfs-kdave
 tree
Date: Fri, 8 Jul 2016 13:26:15 +1000
Message-ID: <20160708132615.2b25b08c@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:45681 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1753600AbcGHD0R (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Thu, 7 Jul 2016 23:26:17 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Jens Axboe <axboe@kernel.dk>, David Sterba <dsterba@suse.cz>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Jeff Mahoney <jeffm@suse.com>, Liu Bo <bo.li.liu@oracle.com>, Mike Christie <mchristi@redhat.com>

Hi Jens,

Today's linux-next merge of the block tree got a conflict in:

  fs/btrfs/compression.c

between commit:

  26112f7f4726 ("btrfs: take an fs_info parameter directly when the root is not used otherwise")
[This commit has no Signed-off-by from its committer :-(]
  d42b410c1511 ("Btrfs: fix BUG_ON in btrfs_submit_compressed_write")

from the btrfs-kdave tree and commit:

  81a75f6781de ("btrfs: use bio fields for op and flags")

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

diff --cc fs/btrfs/compression.c
index 36ef2e8f3c87,cefedabf0a92..000000000000
--- a/fs/btrfs/compression.c
+++ b/fs/btrfs/compression.c
@@@ -400,11 -402,8 +401,11 @@@ int btrfs_submit_compressed_write(struc
  				BUG_ON(ret); /* -ENOMEM */
  			}
  
- 			ret = btrfs_map_bio(fs_info, WRITE, bio, 0, 1);
 -			ret = btrfs_map_bio(root, bio, 0, 1);
 -			BUG_ON(ret); /* -ENOMEM */
++			ret = btrfs_map_bio(fs_info, bio, 0, 1);
 +			if (ret) {
 +				bio->bi_error = ret;
 +				bio_endio(bio);
 +			}
  
  			bio_put(bio);
  
@@@ -433,11 -433,8 +435,11 @@@
  		BUG_ON(ret); /* -ENOMEM */
  	}
  
- 	ret = btrfs_map_bio(fs_info, WRITE, bio, 0, 1);
 -	ret = btrfs_map_bio(root, bio, 0, 1);
 -	BUG_ON(ret); /* -ENOMEM */
++	ret = btrfs_map_bio(fs_info, bio, 0, 1);
 +	if (ret) {
 +		bio->bi_error = ret;
 +		bio_endio(bio);
 +	}
  
  	bio_put(bio);
  	return 0;
@@@ -690,10 -688,9 +693,9 @@@ int btrfs_submit_compressed_read(struc
  				BUG_ON(ret); /* -ENOMEM */
  			}
  			sums += DIV_ROUND_UP(comp_bio->bi_iter.bi_size,
 -					     root->sectorsize);
 +					     fs_info->sectorsize);
  
- 			ret = btrfs_map_bio(fs_info, READ, comp_bio,
- 					    mirror_num, 0);
 -			ret = btrfs_map_bio(root, comp_bio, mirror_num, 0);
++			ret = btrfs_map_bio(fs_info, comp_bio, mirror_num, 0);
  			if (ret) {
  				bio->bi_error = ret;
  				bio_endio(comp_bio);
@@@ -721,7 -720,7 +724,7 @@@
  		BUG_ON(ret); /* -ENOMEM */
  	}
  
- 	ret = btrfs_map_bio(fs_info, READ, comp_bio, mirror_num, 0);
 -	ret = btrfs_map_bio(root, comp_bio, mirror_num, 0);
++	ret = btrfs_map_bio(fs_info, comp_bio, mirror_num, 0);
  	if (ret) {
  		bio->bi_error = ret;
  		bio_endio(comp_bio);
