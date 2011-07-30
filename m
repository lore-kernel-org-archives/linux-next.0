From: Randy Dunlap <rdunlap@xenotime.net>
Subject: [PATCH -next] power: max8998_charger.c needs module.h
Date: Fri, 29 Jul 2011 21:11:43 -0700
Message-ID: <20110729211143.0a9d6ed7.rdunlap@xenotime.net>
References: <20110729173827.716f57ff6e00095a3efc6449@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from oproxy9.bluehost.com ([69.89.24.6]:53784 "HELO
	oproxy9.bluehost.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with SMTP id S1751009Ab1G3EPR (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Sat, 30 Jul 2011 00:15:17 -0400
In-Reply-To: <20110729173827.716f57ff6e00095a3efc6449@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>, Anton Vorontsov <cbou@mail.ru>, David Woodhouse <dwmw2@infradead.org>
Cc: linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, akpm <akpm@linux-foundation.org>

From: Randy Dunlap <rdunlap@xenotime.net>

power/max8998_charger.c uses interfaces from linux/module.h,
so it should include that file.  This fixes build errors.

Signed-off-by: Randy Dunlap <rdunlap@xenotime.net>
---
 drivers/power/max8998_charger.c |    1 +
 1 file changed, 1 insertion(+)

--- linux-next-20110729.orig/drivers/power/max8998_charger.c
+++ linux-next-20110729/drivers/power/max8998_charger.c
@@ -20,6 +20,7 @@
  */
 
 #include <linux/err.h>
+#include <linux/module.h>
 #include <linux/slab.h>
 #include <linux/platform_device.h>
 #include <linux/power_supply.h>
