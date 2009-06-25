From: Paul Mundt <lethal@linux-sh.org>
Subject: [PATCH -next 2/2] hwlat_detector: select RING_BUFFER.
Date: Thu, 25 Jun 2009 14:31:17 +0900
Message-ID: <20090625053117.GC19944@linux-sh.org>
References: <20090625053012.GB19944@linux-sh.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from 124x34x33x190.ap124.ftth.ucom.ne.jp ([124.34.33.190]:42326 "EHLO
	master.linux-sh.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751126AbZFYFcS (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Thu, 25 Jun 2009 01:32:18 -0400
Content-Disposition: inline
In-Reply-To: <20090625053012.GB19944@linux-sh.org>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Steven Rostedt <rostedt@goodmis.org>, Ingo Molnar <mingo@elte.hu>, Jon Masters <jcm@jonmasters.org>
Cc: linux-next@vger.kernel.org

The hwlat_detector broke quite a few of the sh module builds:

ERROR: "ring_buffer_write" [drivers/misc/hwlat_detector.ko] undefined!
ERROR: "ring_buffer_reset" [drivers/misc/hwlat_detector.ko] undefined!
ERROR: "__ring_buffer_alloc" [drivers/misc/hwlat_detector.ko] undefined!
ERROR: "ring_buffer_event_data" [drivers/misc/hwlat_detector.ko] undefined!
ERROR: "ring_buffer_consume" [drivers/misc/hwlat_detector.ko] undefined!
ERROR: "ring_buffer_free" [drivers/misc/hwlat_detector.ko] undefined!
make[1]: *** [__modpost] Error 1
make: *** [modules] Error 2

This fixes it up by selecting RING_BUFFER outright.

Signed-off-by: Paul Mundt <lethal@linux-sh.org>
Cc: Jon Masters <jcm@jonmasters.org>

---

 drivers/misc/Kconfig |    1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/misc/Kconfig b/drivers/misc/Kconfig
index 4448a83..f51ba7b 100644
--- a/drivers/misc/Kconfig
+++ b/drivers/misc/Kconfig
@@ -79,6 +79,7 @@ config IBM_ASM
 config HWLAT_DETECTOR
 	tristate "Testing module to detect hardware-induced latencies"
 	depends on DEBUG_FS
+	select RING_BUFFER
 	default m
 	---help---
 	  A simple hardware latency detector. Use this module to detect
