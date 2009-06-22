From: Randy Dunlap <randy.dunlap@oracle.com>
Subject: [PATCH -next] hwlat: depends on RING_BUFFER (build fix)
Date: Mon, 22 Jun 2009 08:51:53 -0700
Message-ID: <4A3FA899.3040402@oracle.com>
References: <20090622181920.496d160e.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-5
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from rcsinet11.oracle.com ([148.87.113.123]:27934 "EHLO
	rgminet11.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754325AbZFVPwu (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Mon, 22 Jun 2009 11:52:50 -0400
In-Reply-To: <20090622181920.496d160e.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, Jon Masters <jcm@jonmasters.org>, Andrew Morton <akpm@linux-foundation.org>

From: Randy Dunlap <randy.dunlap@oracle.com>

hwlat_detector build fails because it uses ring_buffer interfaces
without depending on RING_BUFFER.

hwlat_detector.c:(.text+0x8d906): undefined reference to `ring_buffer_reset'
hwlat_detector.c:(.text+0x8d98c): undefined reference to `ring_buffer_free'
hwlat_detector.c:(.text+0x8dd16): undefined reference to `__ring_buffer_alloc'
hwlat_detector.c:(.text+0x8df15): undefined reference to `ring_buffer_free'
hwlat_detector.c:(.text+0x8e100): undefined reference to `ring_buffer_write'
hwlat_detector.c:(.text+0x8e239): undefined reference to `ring_buffer_consume'
hwlat_detector.c:(.text+0x8e2ac): undefined reference to `ring_buffer_event_data'

Signed-off-by: Randy Dunlap <randy.dunlap@oracle.com>
Cc: Jon Masters <jcm@jonmasters.org>
---
 drivers/misc/Kconfig |    1 +
 1 file changed, 1 insertion(+)

--- linux-next-20090622.orig/drivers/misc/Kconfig
+++ linux-next-20090622/drivers/misc/Kconfig
@@ -79,6 +79,7 @@ config IBM_ASM
 config HWLAT_DETECTOR
 	tristate "Testing module to detect hardware-induced latencies"
 	depends on DEBUG_FS
+	depends on RING_BUFFER
 	default m
 	---help---
 	  A simple hardware latency detector. Use this module to detect



-- 
~Randy
LPC 2009, Sept. 23-25, Portland, Oregon
http://linuxplumbersconf.org/2009/
