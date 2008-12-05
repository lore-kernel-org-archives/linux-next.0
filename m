From: Randy Dunlap <randy.dunlap@oracle.com>
Subject: [PATCH -next] sysctl: handle bio system when CONFIG_BLOCK=n
Date: Thu, 4 Dec 2008 16:42:13 -0800
Message-ID: <20081204164213.65139547.randy.dunlap@oracle.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from acsinet11.oracle.com ([141.146.126.233]:62966 "EHLO
	acsinet11.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751228AbYLEAm0 (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Thu, 4 Dec 2008 19:42:26 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: lkml <linux-kernel@vger.kernel.org>
Cc: linux-next@vger.kernel.org, jens.axboe@oracle.com, akpm <akpm@linux-foundation.org>

From: Randy Dunlap <randy.dunlap@oracle.com>

Handle build config of CONFIG_BLOCK=n:

kernel/sysctl.c:1233: error: 'bio_inline_vecs' undeclared here (not in a function)

Signed-off-by: Randy Dunlap <randy.dunlap@oracle.com>
---
 kernel/sysctl.c |    2 ++
 1 file changed, 2 insertions(+)

--- linux-next-20081204.orig/kernel/sysctl.c
+++ linux-next-20081204/kernel/sysctl.c
@@ -1227,6 +1227,7 @@ static struct ctl_table vm_table[] = {
 		.extra2		= &one,
 	},
 #endif
+#ifdef CONFIG_BLOCK
 	{
 		.ctl_name	= CTL_UNNUMBERED,
 		.procname	= "bio_inline_vecs",
@@ -1237,6 +1238,7 @@ static struct ctl_table vm_table[] = {
 		.strategy	= &sysctl_intvec,
 		.extra1		= &zero,
 	},
+#endif
 /*
  * NOTE: do not add new entries to this table unless you have read
  * Documentation/sysctl/ctl_unnumbered.txt
