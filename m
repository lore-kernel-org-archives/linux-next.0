From: Randy Dunlap <randy.dunlap@oracle.com>
Subject: [PATCH -next] block: blk-iopoll sysctl iff CONFIG_BLOCK
Date: Fri, 7 Aug 2009 11:16:59 -0700
Message-ID: <20090807111659.3d8da27f.randy.dunlap@oracle.com>
References: <20090807183118.e71b4db2.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from rcsinet11.oracle.com ([148.87.113.123]:57296 "EHLO
	rgminet11.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754921AbZHGSRn (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Fri, 7 Aug 2009 14:17:43 -0400
In-Reply-To: <20090807183118.e71b4db2.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>, akpm <akpm@linux-foundation.org>, jens.axboe@oracle.com
Cc: linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>

From: Randy Dunlap <randy.dunlap@oracle.com>

New block-iopoll sysctl should be surrounded by CONFIG_BLOCK to
prevent build error:

kernel/built-in.o:(.data+0x2990): undefined reference to `blk_iopoll_enabled'

Signed-off-by: Randy Dunlap <randy.dunlap@oracle.com>
---
 kernel/sysctl.c |    2 ++
 1 file changed, 2 insertions(+)

--- linux-next-20090807.orig/kernel/sysctl.c
+++ linux-next-20090807/kernel/sysctl.c
@@ -990,6 +990,7 @@ static struct ctl_table kern_table[] = {
 		.proc_handler	= &proc_dointvec,
 	},
 #endif
+#ifdef CONFIG_BLOCK
 	{
 		.ctl_name	= CTL_UNNUMBERED,
 		.procname	= "blk_iopoll",
@@ -998,6 +999,7 @@ static struct ctl_table kern_table[] = {
 		.mode		= 0644,
 		.proc_handler	= &proc_dointvec,
 	},
+#endif
 /*
  * NOTE: do not add new entries to this table unless you have read
  * Documentation/sysctl/ctl_unnumbered.txt


---
~Randy
LPC 2009, Sept. 23-25, Portland, Oregon
http://linuxplumbersconf.org/2009/
