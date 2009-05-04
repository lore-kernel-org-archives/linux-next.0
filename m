From: Alexander Beregalov <a.beregalov@gmail.com>
Subject: [PATCH] max6875: should depend on I2C
Date: Mon,  4 May 2009 13:49:46 +0400
Message-ID: <1241430586-31878-1-git-send-email-a.beregalov@gmail.com>
Return-path: <linux-next-owner@vger.kernel.org>
Received: from yx-out-2324.google.com ([74.125.44.28]:34837 "EHLO
	yx-out-2324.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753636AbZEDJtw (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Mon, 4 May 2009 05:49:52 -0400
Received: by yx-out-2324.google.com with SMTP id 3so2163719yxj.1
        for <linux-next@vger.kernel.org>; Mon, 04 May 2009 02:49:52 -0700 (PDT)
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: linux-next@vger.kernel.org, w.sang@pengutronix.de, khali@linux-fr.org
Cc: Alexander Beregalov <a.beregalov@gmail.com>

Fix this build error:
drivers/built-in.o: In function `max6875_remove':
max6875.c:(.text+0x6bdda): undefined reference to `i2c_unregister_device'

Signed-off-by: Alexander Beregalov <a.beregalov@gmail.com>
---
 drivers/misc/eeprom/Kconfig |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/drivers/misc/eeprom/Kconfig b/drivers/misc/eeprom/Kconfig
index e23f0ec..9118613 100644
--- a/drivers/misc/eeprom/Kconfig
+++ b/drivers/misc/eeprom/Kconfig
@@ -50,7 +50,7 @@ config EEPROM_LEGACY
 
 config EEPROM_MAX6875
 	tristate "Maxim MAX6874/5 power supply supervisor"
-	depends on EXPERIMENTAL
+	depends on I2C && EXPERIMENTAL
 	help
 	  If you say yes here you get read-only support for the user EEPROM of
 	  the Maxim MAX6874/5 EEPROM-programmable, quad power-supply
-- 
1.6.2.3
