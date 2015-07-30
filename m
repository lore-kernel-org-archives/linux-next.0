From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build failure after merge of the block tree
Date: Thu, 30 Jul 2015 14:17:13 +1000
Message-ID: <20150730141713.001bf7d6@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:57749 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1750759AbbG3ERP (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Thu, 30 Jul 2015 00:17:15 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Jens Axboe <axboe@kernel.dk>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Christoph Hellwig <hch@lst.de>, Greg KH <greg@kroah.com>, Oleg Drokin <oleg.drokin@intel.com>, Andreas Dilger <andreas.dilger@intel.com>

Hi Jens,

After merging the block tree, today's linux-next build (x86_64 allmodconfig)
failed like this:

drivers/staging/lustre/lustre/llite/../include/obd_support.h:42:0,
                 from drivers/staging/lustre/lustre/llite/../include/lustre_cfg.h:225,
                 from drivers/staging/lustre/lustre/llite/../include/lustre_lib.h:55,
                 from drivers/staging/lustre/lustre/llite/lloop.c:105:
drivers/staging/lustre/lustre/llite/lloop.c: In function 'loop_handle_bio':
drivers/staging/lustre/lustre/llite/../include/linux/lustre_compat25.h:89:35: error: too many arguments to function 'bio_endio'
 #define cfs_bio_endio(a, b, c)    bio_endio((a), (c))
                                   ^
drivers/staging/lustre/lustre/llite/lloop.c:379:3: note: in expansion of macro 'cfs_bio_endio'
   cfs_bio_endio(bio, bio->bi_iter.bi_size, ret);
   ^
In file included from include/linux/blkdev.h:18:0,
                 from drivers/staging/lustre/lustre/llite/lloop.c:91:
include/linux/bio.h:442:13: note: declared here
 extern void bio_endio(struct bio *);
             ^

Caused by commit

  4246a0b63bd8 ("block: add a bi_error field to struct bio")

I added the following fix patch, but more is probably required:

From: Stephen Rothwell <sfr@canb.auug.org.au>
Date: Thu, 30 Jul 2015 14:10:57 +1000
Subject: [PATCH] block: lustre: temporary fix for bio_endio API change

Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
---
 drivers/staging/lustre/lustre/include/linux/lustre_compat25.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/lustre/lustre/include/linux/lustre_compat25.h b/drivers/staging/lustre/lustre/include/linux/lustre_compat25.h
index 513c81f43d6e..1aac5a77c500 100644
--- a/drivers/staging/lustre/lustre/include/linux/lustre_compat25.h
+++ b/drivers/staging/lustre/lustre/include/linux/lustre_compat25.h
@@ -86,7 +86,7 @@
 		vfs_rename(old, old_dir, new, new_dir, NULL, 0)
 
 #define cfs_bio_io_error(a, b)   bio_io_error((a))
-#define cfs_bio_endio(a, b, c)    bio_endio((a), (c))
+#define cfs_bio_endio(a, b, c)    bio_endio((a))
 
 #define cfs_path_put(nd)     path_put(&(nd)->path)
 
-- 
2.4.6

-- 
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/
