From: Randy Dunlap <randy.dunlap@oracle.com>
Subject: [PATCH] dell-laptop: depends on POWER_SUPPLY
Date: Tue, 10 Feb 2009 09:25:26 -0800
Message-ID: <20090210092526.c0e376bd.randy.dunlap@oracle.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from rcsinet12.oracle.com ([148.87.113.124]:47584 "EHLO
	rgminet12.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754613AbZBJR0H (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Tue, 10 Feb 2009 12:26:07 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: lkml <linux-kernel@vger.kernel.org>, akpm <akpm@linux-foundation.org>
Cc: linux-next@vger.kernel.org, Matthew Garrett <mjg59@srcf.ucam.org>

From: Randy Dunlap <randy.dunlap@oracle.com>

Build breaks when DELL_LAPTOP=y and POWER_SUPPLY=m. DELL_LAPTOP needs
to depend on POWER_SUPPLY.

dell-laptop.c:(.text+0x1ef3c4): undefined reference to `power_supply_is_system_supplied'
dell-laptop.c:(.text+0x1ef45e): undefined reference to `power_supply_is_system_supplied'

Signed-off-by: Randy Dunlap <randy.dunlap@oracle.com>
cc: Matthew Garrett <mjg59@srcf.ucam.org>
---
 drivers/platform/x86/Kconfig |    1 +
 1 file changed, 1 insertion(+)

--- linux-next-20090210.orig/drivers/platform/x86/Kconfig
+++ linux-next-20090210/drivers/platform/x86/Kconfig
@@ -62,6 +62,7 @@ config DELL_LAPTOP
 	depends on EXPERIMENTAL
 	depends on BACKLIGHT_CLASS_DEVICE
 	depends on RFKILL
+	depends on POWER_SUPPLY
 	default n
 	---help---
 	This driver adds support for rfkill and backlight control to Dell
