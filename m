From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: firmware build failure
Date: Thu, 12 Jun 2008 16:28:17 +1000
Message-ID: <20080612162817.c0a4e115.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:48964 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1754854AbYFLG2V (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Thu, 12 Jun 2008 02:28:21 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: David Woodhouse <dwmw2@infradead.org>
Cc: linux-next@vger.kernel.org

Hi David,

Today's linux-next build (x86_64 allmodconfig) failed like this:

drivers/char/ip2/ip2main.c: In function 'ip2_request_firmware':
drivers/char/ip2/ip2main.c:483: error: implicit declaration of function 'platform_device_register_simple'
drivers/char/ip2/ip2main.c:483: warning: assignment makes pointer from integer without a cast
drivers/char/ip2/ip2main.c:486: error: dereferencing pointer to incomplete type
drivers/char/ip2/ip2main.c:490: error: implicit declaration of function 'platform_device_unregister'

I applied the patch below.
-- 
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

>From 8cf424dac01282d3e8a4041f27c6de6a15a47823 Mon Sep 17 00:00:00 2001
From: Stephen Rothwell <sfr@canb.auug.org.au>
Date: Thu, 12 Jun 2008 16:25:34 +1000
Subject: [PATCH] firmware: fix ip2 conversion fallout

Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
---
 drivers/char/ip2/ip2main.c |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/drivers/char/ip2/ip2main.c b/drivers/char/ip2/ip2main.c
index 1199a2b..e8a4d16 100644
--- a/drivers/char/ip2/ip2main.c
+++ b/drivers/char/ip2/ip2main.c
@@ -100,6 +100,7 @@
 #include <linux/device.h>
 #include <linux/smp_lock.h>
 #include <linux/firmware.h>
+#include <linux/platform_device.h>
 
 #include <linux/tty.h>
 #include <linux/tty_flip.h>
-- 
1.5.5.4

