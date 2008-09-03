From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: block tree build failure
Date: Wed, 3 Sep 2008 16:15:26 +1000
Message-ID: <20080903161526.636b6d0d.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:33038 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1753315AbYICGPf (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Wed, 3 Sep 2008 02:15:35 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Jens Axboe <jens.axboe@oracle.com>
Cc: linux-next@vger.kernel.org, Tejun Heo <tj@kernel.org>

Hi Jens,

Today's linux-next build (powerpc ppc64_defconfig) failed like this:

block/genhd.c: In function 'show_partition':
block/genhd.c:718: error: 'struct hd_struct' has no member named 'private'
block/genhd.c:719: warning: passing argument 1 of 'seq_puts' from incompatible pointer type
block/genhd.c:720: error: 'struct hd_struct' has no member named 'private'

Caused by the merge because commit
ddef43a843f620c6742a06633739887a901ec06b ("block: restore original
behavior of /proc/partition when there's no partition") added references
to the 'private' member.  I removed the offending section of code (see
below) assuming the fix referred to in the comment has be done in the
block tree.
-- 
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

diff --git a/block/genhd.c b/block/genhd.c
index 48326f9..0bc4a3e 100644
--- a/block/genhd.c
+++ b/block/genhd.c
@@ -709,17 +709,6 @@ static int show_partition(struct seq_file *seqf, void *v)
 	struct hd_struct *part;
 	char buf[BDEVNAME_SIZE];
 
-	/*
-	 * Print header if start told us to do.  This is to preserve
-	 * the original behavior of not printing header if no
-	 * partition exists.  This hackery will be removed later with
-	 * class iteration clean up.
-	 */
-	if (part->private) {
-		seq_puts(part, "major minor  #blocks  name\n\n");
-		part->private = NULL;
-	}
-
 	/* Don't show non-partitionable removeable devices or empty devices */
 	if (!get_capacity(sgp) || (!disk_partitionable(sgp) &&
 				   (sgp->flags & GENHD_FL_REMOVABLE)))
