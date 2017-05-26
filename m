From: Dave Kleikamp <dave.kleikamp@oracle.com>
Subject: [PATCH] JFS: do not ignore return code from write_one_page()
Date: Fri, 26 May 2017 15:45:49 -0500
Message-ID: <db45ab67-55c7-08ff-6776-f76b3bf5cbf5@oracle.com>
References: <20170526124324.058c3d2a@canb.auug.org.au>
 <1495793788.2926.4.camel@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1495793788.2926.4.camel@redhat.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Jeff Layton <jlayton@redhat.com>, Stephen Rothwell <sfr@canb.auug.org.au>, Andrew Morton <akpm@linux-foundation.org>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Ross Zwisler <ross.zwisler@linux.intel.com>, Jan Kara <jack@suse.cz>, Matthew Wilcox <mawilcox@microsoft.com>, Christoph Hellwig <hch@lst.de>
List-Id: linux-next.vger.kernel.org

There are a couple places where jfs calls write_one_page() where
clean recovery is not possible. In these cases, the file system
should be marked dirty. To do this, it is now necessary to store the
superblock in the metapage structure.

Signed-off-by: Dave Kleikamp <dave.kleikamp@oracle.com>
---
 fs/jfs/jfs_metapage.c | 7 +++++--
 fs/jfs/jfs_metapage.h | 1 +
 2 files changed, 6 insertions(+), 2 deletions(-)

diff --git a/fs/jfs/jfs_metapage.c b/fs/jfs/jfs_metapage.c
index 744fa3c079e6..7cc1c85f4508 100644
--- a/fs/jfs/jfs_metapage.c
+++ b/fs/jfs/jfs_metapage.c
@@ -664,6 +664,7 @@ struct metapage *__get_metapage(struct inode *inode, unsigned long lblock,
 		INCREMENT(mpStat.pagealloc);
 		mp = alloc_metapage(GFP_NOFS);
 		mp->page = page;
+		mp->sb = inode->i_sb;
 		mp->flag = 0;
 		mp->xflag = COMMIT_PAGE;
 		mp->count = 1;
@@ -711,7 +712,8 @@ void force_metapage(struct metapage *mp)
 	get_page(page);
 	lock_page(page);
 	set_page_dirty(page);
-	write_one_page(page);
+	if (write_one_page(page))
+		jfs_error(mp->sb, "write_one_page() failed\n");
 	clear_bit(META_forcewrite, &mp->flag);
 	put_page(page);
 }
@@ -756,7 +758,8 @@ void release_metapage(struct metapage * mp)
 		set_page_dirty(page);
 		if (test_bit(META_sync, &mp->flag)) {
 			clear_bit(META_sync, &mp->flag);
-			write_one_page(page);
+			if (write_one_page(page))
+				jfs_error(mp->sb, "write_one_page() failed\n");
 			lock_page(page); /* write_one_page unlocks the page */
 		}
 	} else if (mp->lsn)	/* discard_metapage doesn't remove it */
diff --git a/fs/jfs/jfs_metapage.h b/fs/jfs/jfs_metapage.h
index a869fb4a20d6..8b0ee514eb84 100644
--- a/fs/jfs/jfs_metapage.h
+++ b/fs/jfs/jfs_metapage.h
@@ -38,6 +38,7 @@ struct metapage {
 
 	/* implementation */
 	struct page *page;
+	struct super_block *sb;
 	unsigned int logical_size;
 
 	/* Journal management */
