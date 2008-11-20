From: Kamalesh Babulal <kamalesh@linux.vnet.ibm.com>
Subject: Re: linux-next-20081120 - staging - asus_oled device build fails
	with !CONFIG_USB_SUPPORT
Date: Thu, 20 Nov 2008 22:39:27 +0530
Message-ID: <20081120170927.GB4821@linux.vnet.ibm.com>
References: <20081120212907.efc2276b.sfr@canb.auug.org.au>
Reply-To: Kamalesh Babulal <kamalesh@linux.vnet.ibm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Return-path: <linux-next-owner@vger.kernel.org>
Received: from E23SMTP02.au.ibm.com ([202.81.18.163]:56840 "EHLO
	e23smtp02.au.ibm.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750968AbYKTRJh (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Thu, 20 Nov 2008 12:09:37 -0500
Content-Disposition: inline
In-Reply-To: <20081120212907.efc2276b.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, gregkh@suse.de, sjakub@gmail.com

Hi Stephen,

	next-2001120 kernel randconfig build fails with build failure
drivers/built-in.o: In function `enable_oled':
asus_oled.c:(.text+0x170d26): undefined reference to `usb_bulk_msg'
drivers/built-in.o: In function `send_packet':
asus_oled.c:(.text+0x170e5e): undefined reference to `usb_bulk_msg'
drivers/built-in.o: In function `send_packets':
asus_oled.c:(.text+0x170fd4): undefined reference to `usb_bulk_msg'
drivers/built-in.o: In function `asus_oled_disconnect':
asus_oled.c:(.text+0x171761): undefined reference to `usb_put_dev'
drivers/built-in.o: In function `asus_oled_probe':
asus_oled.c:(.text+0x17189f): undefined reference to `usb_get_dev'
asus_oled.c:(.text+0x171a4c): undefined reference to `usb_put_dev'
drivers/built-in.o: In function `asus_oled_init':
asus_oled.c:(.init.text+0xdabe): undefined reference to `usb_register_driver'
drivers/built-in.o: In function `asus_oled_exit':
asus_oled.c:(.exit.text+0x2281): undefined reference to `usb_deregister'

asus_oled depends on the CONFIG_USB_SUPPORT, I have only build tested
the patch.

Signed-off-by: Kamalesh Babulal <kamalesh@linux.vnet.ibm.com>
---
--- linux/drivers/staging/asus_oled/Kconfig	2008-11-20 11:50:43.000000000 -0500
+++ linux/drivers/staging/asus_oled/~Kconfig	2008-11-20 11:50:35.000000000 -0500
@@ -1,5 +1,6 @@
 config ASUS_OLED
 	tristate "Asus OLED driver"
+	depends on USB_SUPPORT
 	default N
 	---help---
 	  Enable support for the OLED display present in some Asus laptops.
-- 
Thanks & Regards,
Kamalesh Babulal,
Linux Technology Center,
IBM, ISTL.
