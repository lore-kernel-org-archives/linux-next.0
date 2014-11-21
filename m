From: Andreas Ruprecht <rupran@einserver.de>
Subject: [PATCH] media: pci: smipcie: Fix dependency for DVB_SMIPCIE
Date: Fri, 21 Nov 2014 18:51:59 +0100
Message-ID: <1416592319-23644-1-git-send-email-rupran@einserver.de>
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-wg0-f45.google.com ([74.125.82.45]:64057 "EHLO
	mail-wg0-f45.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750710AbaKURwR (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Fri, 21 Nov 2014 12:52:17 -0500
Received: by mail-wg0-f45.google.com with SMTP id b13so7255659wgh.18
        for <linux-next@vger.kernel.org>; Fri, 21 Nov 2014 09:52:13 -0800 (PST)
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Mauro Carvalho Chehab <m.chehab@samsung.com>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, linux-next@vger.kernel.org, sfr@canb.auug.org.au, Andreas Ruprecht <rupran@einserver.de>

In smipcie.c, the function i2c_bit_add_bus() is called. This
function is defined by the I2C bit-banging interfaces enabled
with CONFIG_I2C_ALGOBIT.

As there was no dependency in Kconfig, CONFIG_I2C_ALGOBIT could
be set to "m" while CONFIG_DVB_SMIPCIE was set to "y", resulting
in a build error due to an undefined reference. This patch adds
the dependency on CONFIG_I2C_ALGOBIT in Kconfig.

Signed-off-by: Andreas Ruprecht <rupran@einserver.de>
Reported-by: Jim Davis <jim.epost@gmail.com>
---
 drivers/media/pci/smipcie/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/pci/smipcie/Kconfig b/drivers/media/pci/smipcie/Kconfig
index 75a2992..c728721 100644
--- a/drivers/media/pci/smipcie/Kconfig
+++ b/drivers/media/pci/smipcie/Kconfig
@@ -1,6 +1,6 @@
 config DVB_SMIPCIE
 	tristate "SMI PCIe DVBSky cards"
-	depends on DVB_CORE && PCI && I2C
+	depends on DVB_CORE && PCI && I2C && I2C_ALGOBIT
 	select DVB_M88DS3103 if MEDIA_SUBDRV_AUTOSELECT
 	select MEDIA_TUNER_M88TS2022 if MEDIA_SUBDRV_AUTOSELECT
 	select MEDIA_TUNER_M88RS6000T if MEDIA_SUBDRV_AUTOSELECT
-- 
1.9.1
