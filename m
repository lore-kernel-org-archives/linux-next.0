From: Randy Dunlap <rdunlap@infradead.org>
Subject: [PATCH -next] pnp: pnpbios: add header file to fix build errors
Date: Mon, 11 Jul 2016 12:41:03 -0700
Message-ID: <5783F64F.9060408@infradead.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from merlin.infradead.org ([205.233.59.134]:40102 "EHLO
	merlin.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750938AbcGKTlI (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Mon, 11 Jul 2016 15:41:08 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: LKML <linux-kernel@vger.kernel.org>, "linux-next@vger.kernel.org" <linux-next@vger.kernel.org>, Luis Rodriguez <mcgrof@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>

From: Randy Dunlap <rdunlap@infradead.org>

Fix build errors due to missing header file:

../drivers/pnp/pnpbios/core.c: In function 'pnp_dock_event':
../drivers/pnp/pnpbios/core.c:141:2: error: implicit declaration of function 'call_usermodehelper' [-Werror=implicit-function-declaration]
  value = call_usermodehelper(argv [0], argv, envp, UMH_WAIT_EXEC);
  ^
../drivers/pnp/pnpbios/core.c:141:52: error: 'UMH_WAIT_EXEC' undeclared (first use in this function)
  value = call_usermodehelper(argv [0], argv, envp, UMH_WAIT_EXEC);
                                                    ^
Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
---
 drivers/pnp/pnpbios/core.c |    1 +
 1 file changed, 1 insertion(+)

--- linux-next-20160711.orig/drivers/pnp/pnpbios/core.c
+++ linux-next-20160711/drivers/pnp/pnpbios/core.c
@@ -60,6 +60,7 @@
 #include <linux/delay.h>
 #include <linux/acpi.h>
 #include <linux/freezer.h>
+#include <linux/kmod.h>
 #include <linux/kthread.h>
 
 #include <asm/page.h>
