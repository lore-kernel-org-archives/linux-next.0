From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build failure after merge of the bluetooth tree
Date: Mon, 14 Sep 2015 10:14:28 +1000
Message-ID: <20150914101428.13d5ec2d@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:42583 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752586AbbINAOa (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Sun, 13 Sep 2015 20:14:30 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Gustavo Padovan <gustavo@padovan.org>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Alexander Aring <alex.aring@gmail.com>, Joe Perches <joe@perches.com>, Andrew Morton <akpm@linux-foundation.org>

Hi Gustavo,

After merging the bluetooth tree, today's linux-next build (x86_64
allmodconfig) failed like this:

drivers/net/ieee802154/at86rf230.c: In function 'at86rf230_s
tats_show':
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

interacting with commit

  6798a8caaf64 ("fs/seq_file: convert int seq_vprint/seq_printf/etc... returns to void")

from Linus' tree (as you were warned it would).

I applied the patches that Andrew has had in his post merge series
(but I think you were sent a rolled up version):

From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: drivers/net/ieee802154/at86rf230.c: seq_printf() now returns NULL

Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Alexander Aring <alex.aring@gmail.com>
Cc: Stefan Schmidt <stefan@osg.samsung.com>
Cc: Marcel Holtmann <marcel@holtmann.org>
Signed-off-by: Andrew Morton <akpm@linux-foundation.org>
---

 drivers/net/ieee802154/at86rf230.c |   28 ++++++---------------------
 1 file changed, 7 insertions(+), 21 deletions(-)

diff -puN drivers/net/ieee802154/at86rf230.c~drivers-net-ieee802154-at86rf230c-seq_printf-now-returns-null drivers/net/ieee802154/at86rf230.c
--- a/drivers/net/ieee802154/at86rf230.c~drivers-net-ieee802154-at86rf230c-seq_printf-now-returns-null
+++ a/drivers/net/ieee802154/at86rf230.c
@@ -1647,30 +1647,16 @@ static int at86rf230_stats_show(struct s
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

From: Alexander Aring <alex.aring@gmail.com>
Subject: drivers-net-ieee802154-at86rf230c-seq_printf-now-returns-null-fix
Date: Fri, 11 Sep 2015 11:28:20 -0700

fix whitespace, unused var `ret'

Signed-off-by: Alexander Aring <alex.aring@gmail.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Stefan Schmidt <stefan@osg.samsung.com>
Cc: Marcel Holtmann <marcel@holtmann.org>
Signed-off-by: Andrew Morton <akpm@linux-foundation.org>
---

 drivers/net/ieee802154/at86rf230.c |    7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff -puN drivers/net/ieee802154/at86rf230.c~drivers-net-ieee802154-at86rf230c-seq_printf-now-returns-null-fix drivers/net/ieee802154/at86rf230.c
--- a/drivers/net/ieee802154/at86rf230.c~drivers-net-ieee802154-at86rf230c-seq_printf-now-returns-null-fix
+++ a/drivers/net/ieee802154/at86rf230.c
@@ -1645,15 +1645,14 @@ static struct dentry *at86rf230_debugfs_
 static int at86rf230_stats_show(struct seq_file *file, void *offset)
 {
 	struct at86rf230_local *lp = file->private;
-	int ret;
 
 	seq_printf(file, "SUCCESS:\t\t%8llu\n", lp->trac.success);
 	seq_printf(file, "SUCCESS_DATA_PENDING:\t%8llu\n",
-			 lp->trac.success_data_pending);
+		   lp->trac.success_data_pending);
 	seq_printf(file, "SUCCESS_WAIT_FOR_ACK:\t%8llu\n",
-			 lp->trac.success_wait_for_ack);
+		   lp->trac.success_wait_for_ack);
 	seq_printf(file, "CHANNEL_ACCESS_FAILURE:\t%8llu\n",
-			 lp->trac.channel_access_failure);
+		   lp->trac.channel_access_failure);
 	seq_printf(file, "NO_ACK:\t\t\t%8llu\n", lp->trac.no_ack);
 	seq_printf(file, "INVALID:\t\t%8llu\n", lp->trac.invalid);
 	return 0;

-- 
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
