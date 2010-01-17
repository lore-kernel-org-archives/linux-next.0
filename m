From: Randy Dunlap <randy.dunlap@oracle.com>
Subject: [PATCH -next] staging/winbond: fix wbusb struct warnings/error
Date: Sun, 17 Jan 2010 15:13:50 -0800
Message-ID: <20100117151350.073381bc.randy.dunlap@oracle.com>
References: <20100114172047.406ebda8.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from acsinet12.oracle.com ([141.146.126.234]:25533 "EHLO
	acsinet12.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753515Ab0AQXOH (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Sun, 17 Jan 2010 18:14:07 -0500
In-Reply-To: <20100114172047.406ebda8.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>, Greg Kroah-Hartman <gregkh@suse.de>
Cc: linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, devel@driverdev.osuosl.org

From: Randy Dunlap <randy.dunlap@oracle.com>

Fix winbond wbusb warnings:

drivers/staging/winbond/wbusb.c:68: warning: 'struct ieee80211_if_init_conf' declared inside parameter list
drivers/staging/winbond/wbusb.c:68: warning: its scope is only this definition or declaration, which is probably not what you want
drivers/staging/winbond/wbusb.c:72: error: dereferencing pointer to incomplete type
drivers/staging/winbond/wbusb.c:78: warning: 'struct ieee80211_if_init_conf' declared inside parameter list
drivers/staging/winbond/wbusb.c:284: warning: initialization from incompatible pointer type
drivers/staging/winbond/wbusb.c:285: warning: initialization from incompatible pointer type

Signed-off-by: Randy Dunlap <randy.dunlap@oracle.com>
---
 drivers/staging/winbond/wbusb.c |    6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

--- linux-next-20100111.orig/drivers/staging/winbond/wbusb.c
+++ linux-next-20100111/drivers/staging/winbond/wbusb.c
@@ -65,17 +65,17 @@ static void hal_set_beacon_period(struct
 }
 
 static int wbsoft_add_interface(struct ieee80211_hw *dev,
-				struct ieee80211_if_init_conf *conf)
+				struct ieee80211_vif *conf)
 {
 	struct wbsoft_priv *priv = dev->priv;
 
-	hal_set_beacon_period(&priv->sHwData, conf->vif->bss_conf.beacon_int);
+	hal_set_beacon_period(&priv->sHwData, conf->>bss_conf.beacon_int);
 
 	return 0;
 }
 
 static void wbsoft_remove_interface(struct ieee80211_hw *dev,
-				    struct ieee80211_if_init_conf *conf)
+				    struct ieee80211_vif *conf)
 {
 	printk("wbsoft_remove interface called\n");
 }
