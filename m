From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build failure after merge of the fuse tree
Date: Fri, 22 Jul 2016 11:01:25 +1000
Message-ID: <20160722110125.601f2043@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:40248 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752814AbcGVBB3 (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Thu, 21 Jul 2016 21:01:29 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Miklos Szeredi <miklos@szeredi.hu>
Cc: Chris Mason <clm@fb.com>, Josef Bacik <jbacik@fb.com>, David Sterba <dsterba@suse.cz>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org

Hi Miklos,

After merging the fuse tree, today's linux-next build (powerpc
ppc64_defconfig) failed like this:

fs/btrfs/file.c: In function 'btrfs_sync_file':
fs/btrfs/file.c:2043:9: error: implicit declaration of function 'btrfs_inode_check_errors' [-Werror=implicit-function-declaration]
   ret = btrfs_inode_check_errors(inode);
         ^

Caused by commit

  7b9885f4acb2 ("mm: export filemap_check_errors() to modules")

interacting with commit

  52c7064bb62a ("Btrfs: add missing check for writeback errors on fsync")

from the btrfs-kdave tree.

I applied the following merge fix patch and can carry it as necessary.
Someone needs to let Linus know about this when he meregs these trees.

From: Stephen Rothwell <sfr@canb.auug.org.au>
Date: Fri, 22 Jul 2016 10:57:27 +1000
Subject: [PATCH] btrfs: merge fix for "mm: export filemap_check_errors() to
 modules"

Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
---
 fs/btrfs/file.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/fs/btrfs/file.c b/fs/btrfs/file.c
index 5842423f8f47..6c8b98cfee09 100644
--- a/fs/btrfs/file.c
+++ b/fs/btrfs/file.c
@@ -2040,7 +2040,7 @@ int btrfs_sync_file(struct file *file, loff_t start, loff_t end, int datasync)
 		 * flags for any errors that might have happened while doing
 		 * writeback of file data.
 		 */
-		ret = btrfs_inode_check_errors(inode);
+		ret = filemap_check_errors(inode->i_mapping);
 		inode_unlock(inode);
 		goto out;
 	}
-- 
2.8.1

-- 
Cheers,
Stephen Rothwell
