From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build failure after merge of the akpm tree
Date: Tue, 8 Sep 2015 14:53:12 +1000
Message-ID: <20150908145312.202c9786@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Andrew Morton <akpm@linux-foundation.org>, Gustavo Padovan <gustavo@padovan.org>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Alexander Aring <alex.aring@gmail.com>, Marcel Holtmann <marcel@holtmann.org>, Joe Perches <joe@perches.com>
List-Id: linux-next.vger.kernel.org

Hi Andrew,

After merging the akpm tree, today's linux-next build (x86_64
allmodconfig) failed like this:

drivers/net/ieee802154/at86rf230.c: In function 'at86rf230_stats_show':
drivers/net/ieee802154/at86rf230.c:1650:6: error: void value not ignored as it ought to be
  ret = seq_printf(file, "SUCCESS:\t\t%8llu\n", lp->trac.success);
      ^
drivers/net/ieee802154/at86rf230.c:1654:6: error: void value not ignored as it ought to be
  ret = seq_printf(file, "SUCCESS_DATA_PENDING:\t%8llu\n",
      ^
drivers/net/ieee802154/at86rf230.c:1659:6: error: void value not ignored as it ought to be
  ret = seq_printf(file, "SUCCESS_WAIT_FOR_ACK:\t%8llu\n",
      ^
drivers/net/ieee802154/at86rf230.c:1664:6: error: void value not ignored as it ought to be
  ret = seq_printf(file, "CHANNEL_ACCESS_FAILURE:\t%8llu\n",
      ^
drivers/net/ieee802154/at86rf230.c:1669:6: error: void value not ignored as it ought to be
  ret = seq_printf(file, "NO_ACK:\t\t\t%8llu\n", lp->trac.no_ack);
      ^
drivers/net/ieee802154/at86rf230.c:1673:2: error: void value not ignored as it ought to be
  return seq_printf(file, "INVALID:\t\t%8llu\n", lp->trac.invalid);
  ^
drivers/net/ieee802154/at86rf230.c:1674:1: warning: control reaches end of non-void function [-Wreturn-type]
 }
 ^

Caused by commit

  890acf8330ca ("at86rf230: add debugfs support")

from the bluetooth tree interacting with commit

  0287f0d7576f ("fs/seq_file: convert int seq_vprint/seq_printf/etc... returns to void")

from the akpm tree.

I have added the following fix patch for today:

From: Stephen Rothwell <sfr@canb.auug.org.au>
Date: Tue, 8 Sep 2015 14:48:11 +1000
Subject: [PATCH] fs-seq_file-convert-int-seq_vprint-seq_printf-etc-returns-to-void-fix-fix-fix

Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
---
 drivers/net/ieee802154/at86rf230.c | 28 +++++++---------------------
 1 file changed, 7 insertions(+), 21 deletions(-)

diff --git a/drivers/net/ieee802154/at86rf230.c b/drivers/net/ieee802154/at86rf230.c
index b8b0628dc2f3..a9f3af63e590 100644
--- a/drivers/net/ieee802154/at86rf230.c
+++ b/drivers/net/ieee802154/at86rf230.c
@@ -1647,30 +1647,16 @@ static int at86rf230_stats_show(struct seq_file *file, void *offset)
 	struct at86rf230_local *lp = file->private;
 	int ret;
 
-	ret = seq_printf(file, "SUCCESS:\t\t%8llu\n", lp->trac.success);
-	if (ret < 0)
-		return ret;
-
-	ret = seq_printf(file, "SUCCESS_DATA_PENDING:\t%8llu\n",
+	seq_printf(file, "SUCCESS:\t\t%8llu\n", lp->trac.success);
+	seq_printf(file, "SUCCESS_DATA_PENDING:\t%8llu\n",
 			 lp->trac.success_data_pending);
-	if (ret < 0)
-		return ret;
-
-	ret = seq_printf(file, "SUCCESS_WAIT_FOR_ACK:\t%8llu\n",
+	seq_printf(file, "SUCCESS_WAIT_FOR_ACK:\t%8llu\n",
 			 lp->trac.success_wait_for_ack);
-	if (ret < 0)
-		return ret;
-
-	ret = seq_printf(file, "CHANNEL_ACCESS_FAILURE:\t%8llu\n",
+	seq_printf(file, "CHANNEL_ACCESS_FAILURE:\t%8llu\n",
 			 lp->trac.channel_access_failure);
-	if (ret < 0)
-		return ret;
-
-	ret = seq_printf(file, "NO_ACK:\t\t\t%8llu\n", lp->trac.no_ack);
-	if (ret < 0)
-		return ret;
-
-	return seq_printf(file, "INVALID:\t\t%8llu\n", lp->trac.invalid);
+	seq_printf(file, "NO_ACK:\t\t\t%8llu\n", lp->trac.no_ack);
+	seq_printf(file, "INVALID:\t\t%8llu\n", lp->trac.invalid);
+	return 0;
 }
 
 static int at86rf230_stats_open(struct inode *inode, struct file *file)
-- 
2.5.1

-- 
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
