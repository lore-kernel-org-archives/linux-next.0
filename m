From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Subject: [PATCH] usb: phy: am335x: include linux/err.h
Date: Tue, 13 Aug 2013 10:57:08 +0200
Message-ID: <20130813085707.GB23842@linutronix.de>
References: <20130813181719.e2dea691c1e3c19bd6306983@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20130813181719.e2dea691c1e3c19bd6306983@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Felipe Balbi <balbi@ti.com>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org
List-Id: linux-next.vger.kernel.org

Stephen Rothwell reported that this driver does not compile on PowerPC
due to this missing include. One could argue why this driver is enabled
on PowerPC in the first place but it sure isn't wrong to include headers
for used function instead of to rely that they sneak in.

Reported-by: Stephen Rothwell <sfr@canb.auug.org.au>
Signed-off-by: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
---
 drivers/usb/phy/phy-am335x-control.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/usb/phy/phy-am335x-control.c b/drivers/usb/phy/phy-am335x-control.c
index 35494f1..7597545 100644
--- a/drivers/usb/phy/phy-am335x-control.c
+++ b/drivers/usb/phy/phy-am335x-control.c
@@ -1,5 +1,6 @@
 #include <linux/module.h>
 #include <linux/platform_device.h>
+#include <linux/err.h>
 #include <linux/of.h>
 #include <linux/io.h>
 
-- 
1.8.4.rc1
