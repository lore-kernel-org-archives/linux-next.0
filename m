From: Randy Dunlap <randy.dunlap@oracle.com>
Subject: [PATCH -next] eeepc: fix kconfig selects
Date: Mon, 18 May 2009 17:57:45 -0700
Message-ID: <20090518175745.da1f943f.randy.dunlap@oracle.com>
References: <20090518184225.d5721ac8.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from rcsinet12.oracle.com ([148.87.113.124]:22068 "EHLO
	rgminet12.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752324AbZESA4i (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Mon, 18 May 2009 20:56:38 -0400
In-Reply-To: <20090518184225.d5721ac8.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>, corentincj@iksaif.net
Cc: linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, lenb@kernel.org

From: Randy Dunlap <randy.dunlap@oracle.com>

EEEPC_LAPTOP selects HOTPLUG_PCI.  This causes failures (build error below)
when CONFIG_HOTPLUG is not enabled, so additionally select HOTPLUG since
kconfig 'select' doesn't follow its dependency chain.
Also, only select HOTPLUG_PCI if PCI is already enabled.

drivers/pci/hotplug/fakephp.c:55: error: implicit declaration of function 'pci_rescan_bus'

Signed-off-by: Randy Dunlap <randy.dunlap@oracle.com>
---
 drivers/platform/x86/Kconfig |    3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

--- linux-next-20090518.orig/drivers/platform/x86/Kconfig
+++ linux-next-20090518/drivers/platform/x86/Kconfig
@@ -354,7 +354,8 @@ config EEEPC_LAPTOP
 	select BACKLIGHT_CLASS_DEVICE
 	select HWMON
 	select RFKILL
-	select HOTPLUG_PCI
+	select HOTPLUG
+	select HOTPLUG_PCI if PCI
 	---help---
 	  This driver supports the Fn-Fx keys on Eee PC laptops.
 	  It also adds the ability to switch camera/wlan on/off.
