From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the block tree with the btrfs-kdave
 tree
Date: Fri, 8 Jul 2016 14:03:15 +1000
Message-ID: <20160708140315.1a27cef0@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:57112 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1750858AbcGHEDR (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Fri, 8 Jul 2016 00:03:17 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Jens Axboe <axboe@kernel.dk>, David Sterba <dsterba@suse.cz>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Jeff Mahoney <jeffm@suse.com>, Mike Christie <mchristi@redhat.com>

Hi Jens,

Today's linux-next merge of the block tree got a conflict in:

  fs/btrfs/volumes.h

between commit:

  26112f7f4726 ("btrfs: take an fs_info parameter directly when the root is not used otherwise")

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

diff --cc fs/btrfs/volumes.h
index dc219e259281,6613e6335ca2..000000000000
--- a/fs/btrfs/volumes.h
+++ b/fs/btrfs/volumes.h
@@@ -384,13 -385,13 +384,13 @@@ int btrfs_map_sblock(struct btrfs_fs_in
  int btrfs_rmap_block(struct btrfs_mapping_tree *map_tree,
  		     u64 chunk_start, u64 physical, u64 devid,
  		     u64 **logical, int *naddrs, int *stripe_len);
 -int btrfs_read_sys_array(struct btrfs_root *root);
 -int btrfs_read_chunk_tree(struct btrfs_root *root);
 +int btrfs_read_sys_array(struct btrfs_fs_info *fs_info);
 +int btrfs_read_chunk_tree(struct btrfs_fs_info *fs_info);
  int btrfs_alloc_chunk(struct btrfs_trans_handle *trans,
 -		      struct btrfs_root *extent_root, u64 type);
 +		      struct btrfs_fs_info *fs_info, u64 type);
  void btrfs_mapping_init(struct btrfs_mapping_tree *tree);
  void btrfs_mapping_tree_free(struct btrfs_mapping_tree *tree);
- int btrfs_map_bio(struct btrfs_fs_info *fs_info, int rw, struct bio *bio,
 -int btrfs_map_bio(struct btrfs_root *root, struct bio *bio,
++int btrfs_map_bio(struct btrfs_fs_info *fs_info, struct bio *bio,
  		  int mirror_num, int async_submit);
  int btrfs_open_devices(struct btrfs_fs_devices *fs_devices,
  		       fmode_t flags, void *holder);
