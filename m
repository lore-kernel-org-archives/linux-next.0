From: Kevin Lloyd <klloyd@sierrawireless.com>
Subject: RE: linux-next: usb.current tree build failure
Date: Wed, 6 Aug 2008 18:56:16 -0700
Message-ID: <20719A9A7E5F8040AC0590F6F6C1DF46116A01C1A4@uscbd-exchmb01.sierrawireless.local>
References: <20080807105321.5aad96a4.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 8BIT
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mx1.sierrawireless.com ([208.81.121.7]:20498 "EHLO
	mx1.sierrawireless.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753801AbYHGCLc convert rfc822-to-8bit (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Wed, 6 Aug 2008 22:11:32 -0400
In-Reply-To: <20080807105321.5aad96a4.sfr@canb.auug.org.au>
Content-Language: en-US
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>, Greg KH <greg@kroah.com>
Cc: "linux-next@vger.kernel.org" <linux-next@vger.kernel.org>

Hi Stephen,

Good catch, my apologies.

-Kevin

-----Original Message-----
From: Stephen Rothwell [mailto:sfr@canb.auug.org.au]
Sent: Wednesday, August 06, 2008 5:53 PM
To: Greg KH
Cc: linux-next@vger.kernel.org; Kevin Lloyd
Subject: linux-next: usb.current tree build failure

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
