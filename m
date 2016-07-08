From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the block tree with the btrfs-kdave
 tree
Date: Fri, 8 Jul 2016 13:31:32 +1000
Message-ID: <20160708133132.0d4c127c@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:58963 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1753528AbcGHDcg (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Thu, 7 Jul 2016 23:32:36 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Jens Axboe <axboe@kernel.dk>, David Sterba <dsterba@suse.cz>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Jeff Mahoney <jeffm@suse.com>, Mike Christie <mchristi@redhat.com>

Hi Jens,

Today's linux-next merge of the block tree got a conflict in:

  fs/btrfs/extent-tree.c

between commit:

  b286384aac32 ("btrfs: root->fs_info cleanup, add fs_info convenience variables")
[again, no commiter Signed-off-by]

from the btrfs-kdave tree and commit:

  b3d3fa519905 ("btrfs: update __btrfs_map_block for REQ_OP transition")

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

diff --cc fs/btrfs/extent-tree.c
index dd7e454d1cf5,5796c4a9eec6..000000000000
--- a/fs/btrfs/extent-tree.c
+++ b/fs/btrfs/extent-tree.c
@@@ -2047,10 -2046,10 +2047,10 @@@ int btrfs_discard_extent(struct btrfs_f
  	 * Avoid races with device replace and make sure our bbio has devices
  	 * associated to its stripes that don't go away while we are discarding.
  	 */
 -	btrfs_bio_counter_inc_blocked(root->fs_info);
 +	btrfs_bio_counter_inc_blocked(fs_info);
  	/* Tell the block device(s) that the sectors can be discarded */
- 	ret = btrfs_map_block(fs_info, REQ_DISCARD, bytenr, &num_bytes,
 -	ret = btrfs_map_block(root->fs_info, REQ_OP_DISCARD,
 -			      bytenr, &num_bytes, &bbio, 0);
++	ret = btrfs_map_block(fs_info, REQ_OP_DISCARD, bytenr, &num_bytes,
 +			      &bbio, 0);
  	/* Error condition is -ENOMEM */
  	if (!ret) {
  		struct btrfs_bio_stripe *stripe = bbio->stripes;
