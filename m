From: Randy Dunlap <randy.dunlap@oracle.com>
Subject: [PATCH -next] usb gadget: ether needs to select CRC32
Date: Mon, 7 Sep 2009 17:08:39 -0700
Message-ID: <20090907170839.50ddeef7.randy.dunlap@oracle.com>
References: <20090907210206.7830ba68.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from rcsinet11.oracle.com ([148.87.113.123]:51420 "EHLO
	rgminet11.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752922AbZIHAIt (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Mon, 7 Sep 2009 20:08:49 -0400
In-Reply-To: <20090907210206.7830ba68.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: "Stephen Rothwell . David Brownell <dbrownell@users.sourceforge.net>" <sfr@canb.auug.org.au>, gregkh <greg@kroah.com>
Cc: linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, linux-usb@vger.kernel.org

From: Randy Dunlap <randy.dunlap@oracle.com>

Fix build error, ether uses/needs to select CRC32 config symbol:

ether.c:(.text+0x271480): undefined reference to `crc32_le'

Signed-off-by: Randy Dunlap <randy.dunlap@oracle.com>
---
 drivers/usb/gadget/Kconfig |    1 +
 1 file changed, 1 insertion(+)

--- linux-next-20090907.orig/drivers/usb/gadget/Kconfig
+++ linux-next-20090907/drivers/usb/gadget/Kconfig
@@ -627,6 +627,7 @@ config USB_AUDIO
 config USB_ETH
 	tristate "Ethernet Gadget (with CDC Ethernet support)"
 	depends on NET
+	select CRC32
 	help
 	  This driver implements Ethernet style communication, in one of
 	  several ways:




---
~Randy
LPC 2009, Sept. 23-25, Portland, Oregon
http://linuxplumbersconf.org/2009/
---
~Randy
LPC 2009, Sept. 23-25, Portland, Oregon
http://linuxplumbersconf.org/2009/
