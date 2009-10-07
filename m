From: Randy Dunlap <randy.dunlap@oracle.com>
Subject: [PATCH -next] vbus: proxy uses, select IOQ
Date: Wed, 7 Oct 2009 10:22:59 -0700
Message-ID: <20091007102259.ae014b15.randy.dunlap@oracle.com>
References: <20091007173517.abfcfa2a.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner+glk-linux-kernel-3=40m.gmane.org-S1759708AbZJGRXw@vger.kernel.org>
In-Reply-To: <20091007173517.abfcfa2a.sfr@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>, Gregory Haskins <ghaskins@novell.com>
Cc: linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>
List-Id: linux-next.vger.kernel.org

From: Randy Dunlap <randy.dunlap@oracle.com>

vbus-proxy also uses ioq, so it should select IOQ.

When CONFIG_VBUS_PROXY=[ym] and VBUS_PCIBRIDGE=n:

ERROR: "ioq_init" [drivers/vbus/vbus-proxy.ko] undefined!

Signed-off-by: Randy Dunlap <randy.dunlap@oracle.com>
Cc: Gregory Haskins <ghaskins@novell.com>
---
 drivers/vbus/Kconfig |    1 +
 1 file changed, 1 insertion(+)

--- linux-next-20091007.orig/drivers/vbus/Kconfig
+++ linux-next-20091007/drivers/vbus/Kconfig
@@ -5,6 +5,7 @@
 config VBUS_PROXY
        tristate "Virtual-Bus support"
        select SHM_SIGNAL
+       select IOQ
        default n
        help
        Adds support for a virtual-bus model drivers in a guest to connect
