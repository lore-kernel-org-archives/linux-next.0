From: Randy Dunlap <randy.dunlap@oracle.com>
Subject: [PATCH -next] staging: fix winbond build, needs delay.h
Date: Fri, 19 Nov 2010 09:30:18 -0800
Message-ID: <20101119093018.340dab03.randy.dunlap@oracle.com>
References: <20101119143207.b2d5731e.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from rcsinet10.oracle.com ([148.87.113.121]:24774 "EHLO
	rcsinet10.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755637Ab0KSRam (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Fri, 19 Nov 2010 12:30:42 -0500
In-Reply-To: <20101119143207.b2d5731e.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>, Pavel Machek <pavel@ucw.cz>, gregkh@suse.de
Cc: linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>

From: Randy Dunlap <randy.dunlap@oracle.com>

winbond drivers use msleep() and delay(), so include linux/delay.h
in a common header file to prevent build errors.

drivers/staging/winbond/phy_calibration.c:987: error: implicit declaration of function 'msleep'
drivers/staging/winbond/phy_calibration.c:1556: error: implicit declaration of function 'udelay'
drivers/staging/winbond/reg.c:894: error: implicit declaration of function 'msleep'
drivers/staging/winbond/reg.c:1178: error: implicit declaration of function 'udelay'

Signed-off-by: Randy Dunlap <randy.dunlap@oracle.com>
---
 drivers/staging/winbond/sysdef.h |    3 +++
 1 file changed, 3 insertions(+)

--- linux-next-20101119.orig/drivers/staging/winbond/sysdef.h
+++ linux-next-20101119/drivers/staging/winbond/sysdef.h
@@ -2,6 +2,9 @@
 
 #ifndef SYS_DEF_H
 #define SYS_DEF_H
+
+#include <linux/delay.h>
+
 #define WB_LINUX
 #define WB_LINUX_WPA_PSK
 
