From: Randy Dunlap <randy.dunlap@oracle.com>
Subject: [PATCH -next] block: genhd errors when CONFIG_PROC_FS=n
Date: Fri, 23 May 2008 09:44:11 -0700
Message-ID: <20080523094411.06f173e0.randy.dunlap@oracle.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from rgminet01.oracle.com ([148.87.113.118]:44040 "EHLO
	rgminet01.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751014AbYEWQpC (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Fri, 23 May 2008 12:45:02 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: linux-next@vger.kernel.org, lkml <linux-kernel@vger.kernel.org>
Cc: jens.axboe@oracle.com, akpm <akpm@linux-foundation.org>

From: Randy Dunlap <randy.dunlap@oracle.com>

block/genhd.c has build errors when CONFIG_PROC_FS=n, so omit some of
its functions in that case.

/local/linsrc/linux-next-20080523/block/genhd.c: In function 'diskstats_start':
/local/linsrc/linux-next-20080523/block/genhd.c:555: error: 'find_start' undeclared (first use in this function)
/local/linsrc/linux-next-20080523/block/genhd.c:555: error: (Each undeclared identifier is reported only once
/local/linsrc/linux-next-20080523/block/genhd.c:555: error: for each function it appears in.)
make[2]: *** [block/genhd.o] Error 1

Signed-off-by: Randy Dunlap <randy.dunlap@oracle.com>
---
 block/genhd.c |    2 ++
 1 file changed, 2 insertions(+)

--- linux-next-20080523.orig/block/genhd.c
+++ linux-next-20080523/block/genhd.c
@@ -539,6 +539,7 @@ static struct device_type disk_type = {
 	.release	= disk_release,
 };
 
+#ifdef CONFIG_PROC_FS
 /*
  * aggregate disk stat collector.  Uses the same stats that the sysfs
  * entries do, above, but makes them available through one seq_file.
@@ -644,6 +645,7 @@ const struct seq_operations diskstats_op
 	.stop	= diskstats_stop,
 	.show	= diskstats_show
 };
+#endif /* CONFIG_PROC_FS */
 
 static void media_change_notify_thread(struct work_struct *work)
 {
