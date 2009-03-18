From: Randy Dunlap <randy.dunlap@oracle.com>
Subject: [PATCH] staging/line6: fix build error, select SND_RAWMIDI
Date: Wed, 18 Mar 2009 10:00:16 -0700
Message-ID: <49C128A0.7030805@oracle.com>
References: <20090318173830.7ea03dfb.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from rcsinet11.oracle.com ([148.87.113.123]:35223 "EHLO
	rgminet11.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753831AbZCRQ6R (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Wed, 18 Mar 2009 12:58:17 -0400
In-Reply-To: <20090318173830.7ea03dfb.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, Greg KH <gregkh@suse.de>

From: Randy Dunlap <randy.dunlap@oracle.com>

line6 needs to select SND_RAWMIDI, like many other drivers do.

ERROR: "snd_rawmidi_set_ops" [drivers/staging/line6/line6usb.ko] undefined!
ERROR: "snd_rawmidi_new" [drivers/staging/line6/line6usb.ko] undefined!
ERROR: "snd_rawmidi_transmit_peek" [drivers/staging/line6/line6usb.ko] undefined!
ERROR: "snd_rawmidi_transmit_ack" [drivers/staging/line6/line6usb.ko] undefined!
ERROR: "snd_rawmidi_receive" [drivers/staging/line6/line6usb.ko] undefined!

Signed-off-by: Randy Dunlap <randy.dunlap@oracle.com>
---
 drivers/staging/line6/Kconfig |    1 +
 1 file changed, 1 insertion(+)

--- linux-next-20090318.orig/drivers/staging/line6/Kconfig
+++ linux-next-20090318/drivers/staging/line6/Kconfig
@@ -1,6 +1,7 @@
 config LINE6_USB
 	tristate "Line6 USB support"
 	depends on USB && SND
+	select SND_RAWMIDI
 	help
 	  This is a driver for the guitar amp, cab, and effects modeller
 	  PODxt Pro by Line6 (and similar devices), supporting the
