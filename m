From: Christian Lamparter <chunkeey-S0/GAf8tV78@public.gmane.org>
Subject: [PATCH v2] p54: fix SoftLED compile dependencies
Date: Mon, 23 Mar 2009 15:37:45 +0100
Message-ID: <200903231537.45716.chunkeey@web.de>
References: <20090319221024.5e2ad6e5.sfr@canb.auug.org.au> <200903211322.01654.chunkeey@web.de> <20090323141320.GC3285@tuxdriver.com>
Mime-Version: 1.0
Content-Type: text/plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Return-path: <linux-wireless-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20090323141320.GC3285-2XuSBdqkA4R54TAoqtyWWQ@public.gmane.org>
Content-Disposition: inline
Sender: linux-wireless-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: "John W. Linville" <linville-2XuSBdqkA4R54TAoqtyWWQ@public.gmane.org>
Cc: Kalle Valo <kalle.valo-X3B1VOXEql0@public.gmane.org>, Michael Buesch <mb-fseUSCV1ubazQB+pC5nmwQ@public.gmane.org>, Randy Dunlap <randy.dunlap-QHcLZuEGTsvQT0dZR+AlfA@public.gmane.org>, Stephen Rothwell <sfr-3FnU+UHB4dNDw9hX6IcOSA@public.gmane.org>, linux-next-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, LKML <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-wireless-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-next.vger.kernel.org

This patch fixes a compile problem when the MAC80211_LEDS
triggers are enabled but not LED class itself. 
(which is sort of pointless, but anyway...)

Signed-off-by: Christian Lamparter <chunkeey-S0/GAf8tV78@public.gmane.org>
---
> > heh true... should I add them back? after all this list hasn't changed in years
> > and we have a much nicer one on http://www.prism54.org/
> > ( http://wireless.kernel.org/en/users/Drivers/p54/devices )
> 
> Getting rid of them is fine, but it should probably be done in a different patch.
heh, "451 4.5.0 From MTA([127.0.0.1]:10025) during fwd-connect"...

I guess no one got my last reply, right?
---
diff --git a/drivers/net/wireless/p54/Kconfig b/drivers/net/wireless/p54/Kconfig
index 0e344ac..ee1aaca 100644
--- a/drivers/net/wireless/p54/Kconfig
+++ b/drivers/net/wireless/p54/Kconfig
@@ -71,3 +71,8 @@ config P54_SPI
 	  Nokia's N800/N810 Portable Internet Tablet.
 
 	  If you choose to build a module, it'll be called p54spi.
+
+config P54_LEDS
+	bool
+	depends on P54_COMMON && MAC80211_LEDS && (LEDS_CLASS = y || LEDS_CLASS = P54_COMMON)
+	default y
diff --git a/drivers/net/wireless/p54/p54common.c b/drivers/net/wireless/p54/p54common.c
index 0a98983..0c1b057 100644
--- a/drivers/net/wireless/p54/p54common.c
+++ b/drivers/net/wireless/p54/p54common.c
@@ -21,9 +21,9 @@
 #include <linux/etherdevice.h>
 
 #include <net/mac80211.h>
-#ifdef CONFIG_MAC80211_LEDS
+#ifdef CONFIG_P54_LEDS
 #include <linux/leds.h>
-#endif /* CONFIG_MAC80211_LEDS */
+#endif /* CONFIG_P54_LEDS */
 
 #include "p54.h"
 #include "p54common.h"
@@ -2420,7 +2420,7 @@ static int p54_set_key(struct ieee80211_hw *dev, enum set_key_cmd cmd,
 	return 0;
 }
 
-#ifdef CONFIG_MAC80211_LEDS
+#ifdef CONFIG_P54_LEDS
 static void p54_led_brightness_set(struct led_classdev *led_dev,
 				   enum led_brightness brightness)
 {
@@ -2508,7 +2508,7 @@ static void p54_unregister_leds(struct ieee80211_hw *dev)
 	if (priv->assoc_led.registered)
 		led_classdev_unregister(&priv->assoc_led.led_dev);
 }
-#endif /* CONFIG_MAC80211_LEDS */
+#endif /* CONFIG_P54_LEDS */
 
 static const struct ieee80211_ops p54_ops = {
 	.tx			= p54_tx,
@@ -2592,11 +2592,11 @@ int p54_register_common(struct ieee80211_hw *dev, struct device *pdev)
 		return err;
 	}
 
-	#ifdef CONFIG_MAC80211_LEDS
+#ifdef CONFIG_P54_LEDS
 	err = p54_init_leds(dev);
 	if (err)
 		return err;
-	#endif /* CONFIG_MAC80211_LEDS */
+#endif /* CONFIG_P54_LEDS */
 
 	dev_info(pdev, "is registered as '%s'\n", wiphy_name(dev->wiphy));
 	return 0;
@@ -2610,9 +2610,9 @@ void p54_free_common(struct ieee80211_hw *dev)
 	kfree(priv->output_limit);
 	kfree(priv->curve_data);
 
-	#ifdef CONFIG_MAC80211_LEDS
+#ifdef CONFIG_P54_LEDS
 	p54_unregister_leds(dev);
-	#endif /* CONFIG_MAC80211_LEDS */
+#endif /* CONFIG_P54_LEDS */
 }
 EXPORT_SYMBOL_GPL(p54_free_common);
 
--
To unsubscribe from this list: send the line "unsubscribe linux-wireless" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
