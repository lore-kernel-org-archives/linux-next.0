From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: usb.current tree build failure
Date: Thu, 7 Aug 2008 10:53:21 +1000
Message-ID: <20080807105321.5aad96a4.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:35270 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752993AbYHGAx3 (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Wed, 6 Aug 2008 20:53:29 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Greg KH <greg@kroah.com>
Cc: linux-next@vger.kernel.org, Kevin Lloyd <klloyd@sierrawireless.com>

Hi Greg,

Today's linux-next build (powerpc ppc64_defconfig) failed like this:

In file included from drivers/usb/storage/usb.c:177:
drivers/usb/storage/unusual_devs.h:1577: error: 'sierra_ms_init' undeclared here (not in a function)

Caused by commit ff28a24426410aa193b47a5e9ec091d46eaa66d1 ("USB Storage
Sierra: TRU-Install feature update").

I applied the following patch.
-- 
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

From: Stephen Rothwell <sfr@canb.auug.org.au>
Date: Thu, 7 Aug 2008 10:51:49 +1000
Subject: [PATCH] usb: build fix for sierra_ms unusual device

Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
---
 drivers/usb/storage/unusual_devs.h |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/drivers/usb/storage/unusual_devs.h b/drivers/usb/storage/unusual_devs.h
index 0547853..564999c 100644
--- a/drivers/usb/storage/unusual_devs.h
+++ b/drivers/usb/storage/unusual_devs.h
@@ -1569,6 +1569,7 @@ UNUSUAL_DEV(  0x10d6, 0x2200, 0x0100, 0x0100,
 		US_SC_DEVICE, US_PR_DEVICE, NULL,
 		0),
 
+#ifdef CONFIG_USB_STORAGE_SIERRA
 /* Reported by Kevin Lloyd <linux@sierrawireless.com>
  * Entry is needed for the initializer function override,
  * which instructs the device to load as a modem
@@ -1579,6 +1580,7 @@ UNUSUAL_DEV(  0x1199, 0x0fff, 0x0000, 0x9999,
 		"USB MMC Storage",
 		US_SC_DEVICE, US_PR_DEVICE, sierra_ms_init,
 		0),
+#endif
 
 /* Reported by Jaco Kroon <jaco@kroon.co.za>
  * The usb-storage module found on the Digitech GNX4 (and supposedly other
-- 
1.5.6.3
