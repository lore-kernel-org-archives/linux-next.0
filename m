From: Randy Dunlap <randy.dunlap@oracle.com>
Subject: [PATCH -next] drbd: trace depends on TRACING
Date: Fri, 25 Sep 2009 16:03:04 -0700
Message-ID: <4ABD4C28.9070202@oracle.com>
References: <20090925133830.1ba29584.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from acsinet12.oracle.com ([141.146.126.234]:31973 "EHLO
	acsinet12.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751858AbZIYXCo (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Fri, 25 Sep 2009 19:02:44 -0400
In-Reply-To: <20090925133830.1ba29584.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, akpm <akpm@linux-foundation.org>, drbd-dev@lists.linbit.com

From: Randy Dunlap <randy.dunlap@oracle.com>

DRBD_TRACE should depend on TRACING.
It's also possible that TRACEPOINTS should depend on TRACING.

arch/x86/built-in.o: In function `default_idle':
(.text+0x145a1): undefined reference to `__tracepoint_power_start'
arch/x86/built-in.o: In function `default_idle':
(.text+0x145d4): undefined reference to `__tracepoint_power_start'
arch/x86/built-in.o: In function `mwait_idle_with_hints':
(.text+0x1583d): undefined reference to `__tracepoint_power_start'
arch/x86/built-in.o: In function `mwait_idle_with_hints':
(.text+0x15870): undefined reference to `__tracepoint_power_start'
arch/x86/built-in.o: In function `mwait_idle':
process.c:(.text+0x15b92): undefined reference to `__tracepoint_power_start'
arch/x86/built-in.o:process.c:(.text+0x15bbe): more undefined references to `__tracepoint_power_start' follow
arch/x86/built-in.o: In function `poll_idle':
process.c:(.text+0x160bd): undefined reference to `__tracepoint_power_end'
process.c:(.text+0x160e9): undefined reference to `__tracepoint_power_end'
drivers/built-in.o: In function `cpuidle_idle_call':
cpuidle.c:(.text+0x517f16): undefined reference to `__tracepoint_power_end'
cpuidle.c:(.text+0x517f49): undefined reference to `__tracepoint_power_end'

Signed-off-by: Randy Dunlap <randy.dunlap@oracle.com>
---
 drivers/block/drbd/Kconfig |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

--- linux-next-20090925.orig/drivers/block/drbd/Kconfig
+++ linux-next-20090925/drivers/block/drbd/Kconfig
@@ -40,7 +40,7 @@ config BLK_DEV_DRBD
 
 config DRBD_TRACE
 	tristate "DRBD tracing"
-	depends on BLK_DEV_DRBD
+	depends on BLK_DEV_DRBD && TRACING
 	select TRACEPOINTS
 	default n
 	help
