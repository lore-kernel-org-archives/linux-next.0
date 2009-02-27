From: Kalle Valo <kalle.valo-X3B1VOXEql0@public.gmane.org>
Subject: [PATCH] at76c50x-usb: use dev_name() instead of struct device.bus_id
Date: Fri, 27 Feb 2009 07:50:00 +0200
Message-ID: <20090227054959.25492.72388.stgit@tikku>
References: <20090227134411.54e99731.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-wireless-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20090227134411.54e99731.sfr-3FnU+UHB4dNDw9hX6IcOSA@public.gmane.org>
Sender: linux-wireless-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linville-2XuSBdqkA4R54TAoqtyWWQ@public.gmane.org
Cc: linux-next-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Kay Sievers <kay.sievers-tD+1rO4QERM@public.gmane.org>, Greg KH <greg-U8xfFu+wG4EAvxtiuMwx3w@public.gmane.org>, linux-wireless-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-next.vger.kernel.org

Stephen Rothwell reported that bus_id from struct device will be removed, use
dev_name() instead.

Signed-off-by: Kalle Valo <kalle.valo-X3B1VOXEql0@public.gmane.org>
---

 drivers/net/wireless/at76c50x-usb.c |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/drivers/net/wireless/at76c50x-usb.c b/drivers/net/wireless/at76c50x-usb.c
index cc2a267..0c02f1c 100644
--- a/drivers/net/wireless/at76c50x-usb.c
+++ b/drivers/net/wireless/at76c50x-usb.c
@@ -2268,7 +2268,7 @@ static int at76_init_new_device(struct at76_priv *priv,
 
 	printk(KERN_INFO "%s: USB %s, MAC %s, firmware %d.%d.%d-%d\n",
 	       wiphy_name(priv->hw->wiphy),
-	       interface->dev.bus_id, mac2str(priv->mac_addr),
+	       dev_name(&interface->dev), mac2str(priv->mac_addr),
 	       priv->fw_version.major, priv->fw_version.minor,
 	       priv->fw_version.patch, priv->fw_version.build);
 	printk(KERN_INFO "%s: regulatory domain 0x%02x: %s\n",

--
To unsubscribe from this list: send the line "unsubscribe linux-wireless" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
