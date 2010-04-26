From: Alberto Panizzo <maramaopercheseimorto@gmail.com>
Subject: [PATCH] backlight: l4f00242t03: Fix regulators handling code in
 remove function
Date: Mon, 26 Apr 2010 22:51:08 +0200
Message-ID: <1272315068.3037.99.camel@realization>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-ww0-f46.google.com ([74.125.82.46]:64717 "EHLO
	mail-ww0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753606Ab0DZUvO (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Mon, 26 Apr 2010 16:51:14 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Richard Purdie <rpurdie@rpsys.net>
Cc: linux-next <linux-next@vger.kernel.org>, linux-kernel <linux-kernel@vger.kernel.org>

Simple swap of regulator free

Signed-off-by: Alberto Panizzo <maramaopercheseimorto@gmail.com>
---
 drivers/video/backlight/l4f00242t03.c |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/video/backlight/l4f00242t03.c b/drivers/video/backlight/l4f00242t03.c
index 74abd69..9e64afa 100644
--- a/drivers/video/backlight/l4f00242t03.c
+++ b/drivers/video/backlight/l4f00242t03.c
@@ -221,9 +221,9 @@ static int __devexit l4f00242t03_remove(struct spi_device *spi)
 	gpio_free(pdata->reset_gpio);
 
 	if (priv->io_reg)
-		regulator_put(priv->core_reg);
-	if (priv->core_reg)
 		regulator_put(priv->io_reg);
+	if (priv->core_reg)
+		regulator_put(priv->core_reg);
 
 	kfree(priv);
 
-- 
1.6.3.3
