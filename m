From: Chanwoo Choi <cw00.choi@samsung.com>
Subject: [PATCH] extcon: max77693: Fix bug of build error related to INPUT
 subsystem
Date: Fri, 25 Jan 2013 10:56:10 +0900
Message-ID: <1359078970-11088-1-git-send-email-cw00.choi@samsung.com>
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mailout2.samsung.com ([203.254.224.25]:38782 "EHLO
	mailout2.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754026Ab3AYB4P (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Thu, 24 Jan 2013 20:56:15 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: rdunlap@infradead.org
Cc: sfr@canb.auug.org.au, gregkh@linuxfoundation.org, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, myungjoo.ham@samsung.com, kyungmin.park@samsung.com, Chanwoo Choi <cw00.choi@samsung.com>

This patch fix build error of following log:

drivers/built-in.o: In function `max77693_muic_remove':
extcon-max77693.c:(.text+0x664853): undefined reference to `input_unregister_device'
drivers/built-in.o: In function `max77693_muic_probe':
extcon-max77693.c:(.text+0x664971): undefined reference to `input_allocate_device'
extcon-max77693.c:(.text+0x6649c1): undefined reference to `input_set_capability'
extcon-max77693.c:(.text+0x6649d6): undefined reference to `input_set_capability'
extcon-max77693.c:(.text+0x6649eb): undefined reference to `input_set_capability'
extcon-max77693.c:(.text+0x664a00): undefined reference to `input_set_capability'
extcon-max77693.c:(.text+0x664a15): undefined reference to `input_set_capability'
extcon-max77693.c:(.text+0x664a20): undefined reference to `input_register_device'
drivers/built-in.o: In function `max77693_muic_adc_handler':
extcon-max77693.c:(.text+0x665318): undefined reference to `input_event'
extcon-max77693.c:(.text+0x66532a): undefined reference to `input_event'
make[1]: *** [vmlinux] Error 1

Signed-off-by: Chanwoo Choi <cw00.choi@samsung.com>
Signed-off-by: Myungjoo Ham <myungjoo.ham@samsung.com>
---
 drivers/extcon/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/extcon/Kconfig b/drivers/extcon/Kconfig
index 07122a9..10df3fa 100644
--- a/drivers/extcon/Kconfig
+++ b/drivers/extcon/Kconfig
@@ -29,7 +29,7 @@ config EXTCON_ADC_JACK
 
 config EXTCON_MAX77693
 	tristate "MAX77693 EXTCON Support"
-	depends on MFD_MAX77693
+	depends on MFD_MAX77693 && INPUT
 	select IRQ_DOMAIN
 	select REGMAP_I2C
 	help
-- 
1.8.0
