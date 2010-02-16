From: Randy Dunlap <randy.dunlap@oracle.com>
Subject: [PATCH -next] staging/rtl8187se: needs semaphore.h
Date: Tue, 16 Feb 2010 14:59:07 -0800
Message-ID: <4B7B233B.9030601@oracle.com>
References: <20100216185534.fdc8eed3.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from acsinet12.oracle.com ([141.146.126.234]:42714 "EHLO
	acsinet12.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1756741Ab0BPW7i (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Tue, 16 Feb 2010 17:59:38 -0500
In-Reply-To: <20100216185534.fdc8eed3.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, Greg KH <gregkh@suse.de>, devel@driverdev.osuosl.org

From: Randy Dunlap <randy.dunlap@oracle.com>

rtl8187se needs to include semaphore.h to prevent build errors:

drivers/staging/rtl8187se/ieee80211/ieee80211.h:1004: error: field 'wx_sem' has incomplete type
drivers/staging/rtl8187se/ieee80211/ieee80211.h:1005: error: field 'scan_sem' has incomplete type

Signed-off-by: Randy Dunlap <randy.dunlap@oracle.com>
---
 drivers/staging/rtl8187se/ieee80211/ieee80211.h |    1 +
 1 file changed, 1 insertion(+)

--- linux-next-20100216.orig/drivers/staging/rtl8187se/ieee80211/ieee80211.h
+++ linux-next-20100216/drivers/staging/rtl8187se/ieee80211/ieee80211.h
@@ -29,6 +29,7 @@
 #include <linux/jiffies.h>
 #include <linux/timer.h>
 #include <linux/sched.h>
+#include <linux/semaphore.h>
 #include <linux/wireless.h>
 #include <linux/ieee80211.h>
 
