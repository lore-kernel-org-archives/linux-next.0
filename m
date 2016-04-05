From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the btrfs-kdave tree with Linus' tree
Date: Tue, 5 Apr 2016 10:32:47 +1000
Message-ID: <20160405103247.2b57e676@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: David Sterba <dsterba@suse.cz>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>, Josef Bacik <jbacik@fb.com>
List-Id: linux-next.vger.kernel.org

Hi David,

Today's linux-next merge of the btrfs-kdave tree got a conflict in:

  fs/btrfs/file.c

between commit:

  09cbfeaf1a5a ("mm, fs: get rid of PAGE_CACHE_* and page_cache_{get,release} macros")

from Linus' tree and commit:

  201c5fdc44d7 ("Btrfs: don't do nocow check unless we have to")

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

diff --cc fs/btrfs/file.c
index cf31a60c6284,1bc8d464d415..000000000000
--- a/fs/btrfs/file.c
+++ b/fs/btrfs/file.c
@@@ -1534,30 -1534,30 +1534,30 @@@ static noinline ssize_t __btrfs_buffere
  		reserve_bytes = round_up(write_bytes + sector_offset,
  				root->sectorsize);
  
- 		if ((BTRFS_I(inode)->flags & (BTRFS_INODE_NODATACOW |
- 					      BTRFS_INODE_PREALLOC)) &&
- 		    check_can_nocow(inode, pos, &write_bytes) > 0) {
- 			/*
- 			 * For nodata cow case, no need to reserve
- 			 * data space.
- 			 */
- 			only_release_metadata = true;
- 			/*
- 			 * our prealloc extent may be smaller than
- 			 * write_bytes, so scale down.
- 			 */
- 			num_pages = DIV_ROUND_UP(write_bytes + offset,
- 						 PAGE_SIZE);
- 			reserve_bytes = round_up(write_bytes + sector_offset,
- 					root->sectorsize);
- 			goto reserve_metadata;
- 		}
- 
  		ret = btrfs_check_data_free_space(inode, pos, write_bytes);
- 		if (ret < 0)
- 			break;
+ 		if (ret < 0) {
+ 			if ((BTRFS_I(inode)->flags & (BTRFS_INODE_NODATACOW |
+ 						      BTRFS_INODE_PREALLOC)) &&
+ 			    check_can_nocow(inode, pos, &write_bytes) > 0) {
+ 				/*
+ 				 * For nodata cow case, no need to reserve
+ 				 * data space.
+ 				 */
+ 				only_release_metadata = true;
+ 				/*
+ 				 * our prealloc extent may be smaller than
+ 				 * write_bytes, so scale down.
+ 				 */
+ 				num_pages = DIV_ROUND_UP(write_bytes + offset,
 -							 PAGE_CACHE_SIZE);
++							 PAGE_SIZE);
+ 				reserve_bytes = round_up(write_bytes +
+ 							 sector_offset,
+ 							 root->sectorsize);
+ 			} else {
+ 				break;
+ 			}
+ 		}
  
- reserve_metadata:
  		ret = btrfs_delalloc_reserve_metadata(inode, reserve_bytes);
  		if (ret) {
  			if (!only_release_metadata)
