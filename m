From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the block tree with the btrfs-kdave
 tree
Date: Fri, 24 Jun 2016 12:34:53 +1000
Message-ID: <20160624123453.275141ba@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:35540 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751249AbcFXCe4 (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Thu, 23 Jun 2016 22:34:56 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Jens Axboe <axboe@kernel.dk>, David Sterba <dsterba@suse.cz>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Liu Bo <bo.li.liu@oracle.com>, Mike Christie <mchristi@redhat.com>

Hi Jens,

Today's linux-next merge of the block tree got a conflict in:

  fs/btrfs/compression.c

between commit:

  edf0e062aa6f ("Btrfs: fix BUG_ON in btrfs_submit_compressed_write")

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
index 7a4d9c81aa2a,cefedabf0a92..000000000000
--- a/fs/btrfs/compression.c
+++ b/fs/btrfs/compression.c
@@@ -401,11 -402,8 +402,11 @@@ int btrfs_submit_compressed_write(struc
  				BUG_ON(ret); /* -ENOMEM */
  			}
  
- 			ret = btrfs_map_bio(root, WRITE, bio, 0, 1);
+ 			ret = btrfs_map_bio(root, bio, 0, 1);
 -			BUG_ON(ret); /* -ENOMEM */
 +			if (ret) {
 +				bio->bi_error = ret;
 +				bio_endio(bio);
 +			}
  
  			bio_put(bio);
  
@@@ -434,11 -433,8 +436,11 @@@
  		BUG_ON(ret); /* -ENOMEM */
  	}
  
- 	ret = btrfs_map_bio(root, WRITE, bio, 0, 1);
+ 	ret = btrfs_map_bio(root, bio, 0, 1);
 -	BUG_ON(ret); /* -ENOMEM */
 +	if (ret) {
 +		bio->bi_error = ret;
 +		bio_endio(bio);
 +	}
  
  	bio_put(bio);
  	return 0;
