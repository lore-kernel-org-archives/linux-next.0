From: Randy Dunlap <randy.dunlap@oracle.com>
Subject: [PATCH -next] wireless: improve airo when PROC_FS is disabled
Date: Tue, 17 May 2011 12:34:20 -0700
Message-ID: <20110517123420.68f4288d.randy.dunlap@oracle.com>
References: <20110517142749.8927b65b.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from rcsinet10.oracle.com ([148.87.113.121]:37433 "EHLO
	rcsinet10.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932087Ab1EQTer (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Tue, 17 May 2011 15:34:47 -0400
In-Reply-To: <20110517142749.8927b65b.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>, linux-wireless@vger.kernel.org
Cc: linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, linville@tuxdriver.com

From: Randy Dunlap <randy.dunlap@oracle.com>

Skip all of the procfs-related calls when PROC_FS is not enabled.

Signed-off-by: Randy Dunlap <randy.dunlap@oracle.com>
---
 drivers/net/wireless/airo.c |    7 +++++++
 1 file changed, 7 insertions(+)

--- linux-next-20110517.orig/drivers/net/wireless/airo.c
+++ linux-next-20110517/drivers/net/wireless/airo.c
@@ -4496,6 +4496,7 @@ struct proc_data {
 	void (*on_close) (struct inode *, struct file *);
 };
 
+#ifdef CONFIG_PROC_FS
 static int setup_proc_entry( struct net_device *dev,
 			     struct airo_info *apriv ) {
 	struct proc_dir_entry *entry;
@@ -4593,6 +4594,12 @@ fail_stats_delta:
 fail:
 	return -ENOMEM;
 }
+#else
+static int setup_proc_entry( struct net_device *dev,
+			     struct airo_info *apriv ) {
+	return 0;
+}
+#endif
 
 static int takedown_proc_entry( struct net_device *dev,
 				struct airo_info *apriv ) {
