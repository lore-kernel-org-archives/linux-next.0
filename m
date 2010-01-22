From: Michal Nazarewicz <m.nazarewicz@samsung.com>
Subject: [PATCH] USB: g_config: fix CONFIG_USB_G_MULTI_RNDIS usage
Date: Fri, 22 Jan 2010 14:48:56 +0100
Message-ID: <1264168136-8457-1-git-send-email-m.nazarewicz@samsung.com>
References: <1259574940-25345-1-git-send-email-m.nazarewicz@samsung.com>
 <20091128103429.705670b2.randy.dunlap@oracle.com>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN
Content-Transfer-Encoding: 7BIT
Return-path: <linux-kernel-owner+glk-linux-kernel-3=40m.gmane.org-S1753777Ab0AVNur@vger.kernel.org>
In-reply-to: <1259574940-25345-1-git-send-email-m.nazarewicz@samsung.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Randy Dunlap <randy.dunlap@oracle.com>, Stephen Rothwell <sfr@canb.auug.org.au>, Greg KH <greg@kroah.com>Randy Dunlap <randy.dunlap@oracle.com>Stephen Rothwell <sfr@canb.auug.org>
Cc: Michal Nazarewicz <m.nazarewicz@samsung.com>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Marek Szyprowski <m.szyprowski@samsung.com>, Kyungmin Park <kyungmin.park@samsung.com>
List-Id: linux-next.vger.kernel.org

g_multi used CONFIG_USB_ETH_RNDIS to check if RNDIS option was requested
where it should check for CONFIG_USB_G_MULTI_RNDIS.  As a result, RNDIS
was never present in g_multi regardless of configuration.

This fixes changes made in commit 396cda90d228d0851f3d64c7c85a1ecf6b8ae1e8.

Signed-off-by: Michal Nazarewicz <m.nazarewicz@samsung.com>
Cc: Marek Szyprowski <m.szyprowski@samsung.com>
---
 drivers/usb/gadget/multi.c |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/drivers/usb/gadget/multi.c b/drivers/usb/gadget/multi.c
index 4295601..76496f5 100644
--- a/drivers/usb/gadget/multi.c
+++ b/drivers/usb/gadget/multi.c
@@ -29,7 +29,7 @@
 #if defined USB_ETH_RNDIS
 #  undef USB_ETH_RNDIS
 #endif
-#ifdef CONFIG_USB_ETH_RNDIS
+#ifdef CONFIG_USB_G_MULTI_RNDIS
 #  define USB_ETH_RNDIS y
 #endif
 
-- 
1.6.5
