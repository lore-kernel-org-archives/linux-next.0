From: Randy Dunlap <randy.dunlap@oracle.com>
Subject: [PATCH -next] staging: fix hv_mouse build, needs delay.h
Date: Fri, 1 Apr 2011 09:50:54 -0700
Message-ID: <20110401095054.722068ce.randy.dunlap@oracle.com>
References: <20110401142520.2699bbb0.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from rcsinet10.oracle.com ([148.87.113.121]:20109 "EHLO
	rcsinet10.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753174Ab1DAQvJ (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Fri, 1 Apr 2011 12:51:09 -0400
In-Reply-To: <20110401142520.2699bbb0.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>, gregkh@suse.de
Cc: linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, Hank Janssen <hjanssen@microsoft.com>, Haiyang Zhang <haiyangz@microsoft.com>

From: Randy Dunlap <randy.dunlap@oracle.com>

Fix hv_mouse.c build, it needs delay.h:

drivers/staging/hv/hv_mouse.c:293: error: implicit declaration of function 'udelay'

Signed-off-by: Randy Dunlap <randy.dunlap@oracle.com>
Cc: Greg Kroah-Hartman <gregkh@suse.de>
Cc: Hank Janssen <hjanssen@microsoft.com>
Cc: Haiyang Zhang <haiyangz@microsoft.com>
---
 drivers/staging/hv/hv_mouse.c |    1 +
 1 file changed, 1 insertion(+)

--- linux-next-20110401.orig/drivers/staging/hv/hv_mouse.c
+++ linux-next-20110401/drivers/staging/hv/hv_mouse.c
@@ -14,6 +14,7 @@
  */
 #include <linux/init.h>
 #include <linux/module.h>
+#include <linux/delay.h>
 #include <linux/device.h>
 #include <linux/workqueue.h>
 #include <linux/sched.h>
