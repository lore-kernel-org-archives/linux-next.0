From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?=
	<u.kleine-koenig@pengutronix.de>
Subject: [PATCH] fixup! serial: mctrl-gpio: simplify init routine
Date: Tue, 10 Mar 2015 09:29:51 +0100
Message-ID: <1425976191-20894-1-git-send-email-u.kleine-koenig@pengutronix.de>
References: <20150310163740.0f3bc651@canb.auug.org.au>
Return-path: <linux-next-owner@vger.kernel.org>
Received: from metis.ext.pengutronix.de ([92.198.50.35]:52759 "EHLO
	metis.ext.pengutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751373AbbCJIaT (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Tue, 10 Mar 2015 04:30:19 -0400
In-Reply-To: <20150310163740.0f3bc651@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Greg KH <greg@kroah.com>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org

---
 drivers/tty/serial/serial_mctrl_gpio.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/tty/serial/serial_mctrl_gpio.c b/drivers/tty/serial/serial_mctrl_gpio.c
index 5027db7b5814..0ec756c62bcf 100644
--- a/drivers/tty/serial/serial_mctrl_gpio.c
+++ b/drivers/tty/serial/serial_mctrl_gpio.c
@@ -87,7 +87,6 @@ struct mctrl_gpios *mctrl_gpio_init(struct device *dev, unsigned int idx)
 {
 	struct mctrl_gpios *gpios;
 	enum mctrl_gpio_idx i;
-	int err;
 
 	gpios = devm_kzalloc(dev, sizeof(*gpios), GFP_KERNEL);
 	if (!gpios)
@@ -107,7 +106,7 @@ struct mctrl_gpios *mctrl_gpio_init(struct device *dev, unsigned int idx)
 						      idx, flags);
 
 		if (IS_ERR(gpios->gpio[i]))
-			return PTR_ERR(gpios->gpio[i]);
+			return ERR_CAST(gpios->gpio[i]);
 	}
 
 	return gpios;
-- 
2.1.4
