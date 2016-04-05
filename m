From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the btrfs-kdave tree with Linus' tree
Date: Tue, 5 Apr 2016 10:32:45 +1000
Message-ID: <20160405103245.368ba597@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:43370 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751651AbcDEAcs (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Mon, 4 Apr 2016 20:32:48 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: David Sterba <dsterba@suse.cz>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Anand Jain <anand.jain@oracle.com>, "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>

Hi David,

Today's linux-next merge of the btrfs-kdave tree got a conflict in:

  fs/btrfs/volumes.c

between commit:

  09cbfeaf1a5a ("mm, fs: get rid of PAGE_CACHE_* and page_cache_{get,release} macros")

from Linus' tree and commit:

  b54a17371a08 ("btrfs: create a helper function to read the disk super")

from the btrfs-kdave tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

-- 
Cheers,
Stephen Rothwell

diff --cc fs/btrfs/volumes.c
index bd0f45fb38c4,09ca95083674..000000000000
--- a/fs/btrfs/volumes.c
+++ b/fs/btrfs/volumes.c
@@@ -988,6 -1004,56 +1004,56 @@@ int btrfs_open_devices(struct btrfs_fs_
  	return ret;
  }
  
+ void btrfs_release_disk_super(struct page *page)
+ {
+ 	kunmap(page);
 -	page_cache_release(page);
++	put_page(page);
+ }
+ 
+ int btrfs_read_disk_super(struct block_device *bdev, u64 bytenr,
+ 		struct page **page, struct btrfs_super_block **disk_super)
+ {
+ 	void *p;
+ 	pgoff_t index;
+ 
+ 	/* make sure our super fits in the device */
 -	if (bytenr + PAGE_CACHE_SIZE >= i_size_read(bdev->bd_inode))
++	if (bytenr + PAGE_SIZE >= i_size_read(bdev->bd_inode))
+ 		return 1;
+ 
+ 	/* make sure our super fits in the page */
 -	if (sizeof(**disk_super) > PAGE_CACHE_SIZE)
++	if (sizeof(**disk_super) > PAGE_SIZE)
+ 		return 1;
+ 
+ 	/* make sure our super doesn't straddle pages on disk */
 -	index = bytenr >> PAGE_CACHE_SHIFT;
 -	if ((bytenr + sizeof(**disk_super) - 1) >> PAGE_CACHE_SHIFT != index)
++	index = bytenr >> PAGE_SHIFT;
++	if ((bytenr + sizeof(**disk_super) - 1) >> PAGE_SHIFT != index)
+ 		return 1;
+ 
+ 	/* pull in the page with our super */
+ 	*page = read_cache_page_gfp(bdev->bd_inode->i_mapping,
+ 				   index, GFP_KERNEL);
+ 
+ 	if (IS_ERR_OR_NULL(*page))
+ 		return 1;
+ 
+ 	p = kmap(*page);
+ 
+ 	/* align our pointer to the offset of the super block */
 -	*disk_super = p + (bytenr & ~PAGE_CACHE_MASK);
++	*disk_super = p + (bytenr & ~PAGE_MASK);
+ 
+ 	if (btrfs_super_bytenr(*disk_super) != bytenr ||
+ 	    btrfs_super_magic(*disk_super) != BTRFS_MAGIC) {
+ 		btrfs_release_disk_super(*page);
+ 		return 1;
+ 	}
+ 
+ 	if ((*disk_super)->label[0] &&
+ 		(*disk_super)->label[BTRFS_LABEL_SIZE - 1])
+ 		(*disk_super)->label[BTRFS_LABEL_SIZE - 1] = '\0';
+ 
+ 	return 0;
+ }
+ 
  /*
   * Look for a btrfs signature on a device. This may be called out of the mount path
   * and we are not allowed to call set_blocksize during the scan. The superblock
