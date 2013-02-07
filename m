From: Peter Huewe <peterhuewe@gmx.de>
Subject: [PATCH] staging/goldfish: Add MTD dependency to KCONFIG
Date: Thu,  7 Feb 2013 23:46:38 +0100
Message-ID: <1360277198-18246-1-git-send-email-peterhuewe@gmx.de>
References: <5113FAAE.4070501@infradead.org>
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mout.gmx.net ([212.227.17.20]:52191 "EHLO mout.gmx.net"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1422729Ab3BGWmi (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Thu, 7 Feb 2013 17:42:38 -0500
Received: from mailout-de.gmx.net ([10.1.76.2]) by mrigmx.server.lan
 (mrigmx001) with ESMTP (Nemesis) id 0LgbkJ-1UgTAP2rav-00o2UK for
 <linux-next@vger.kernel.org>; Thu, 07 Feb 2013 23:42:36 +0100
In-Reply-To: <5113FAAE.4070501@infradead.org>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Randy Dunlap <rdunlap@infradead.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, Yunhong Jiang <yunhong.jiang@intel.com>, Sheng Yang <sheng@linux.intel.com>, "Mike A. Chan" <mikechan@google.com>, Xiaohui Xin <xiaohui.xin@intel.com>, devel@driverdev.osuosl.org, linux-kernel@vger.kernel.org, Peter Huewe <peterhuewe@gmx.de>

If CONFIG_MTD is not set goldfish_nand fails to compile with the
following linker warnings:

drivers/built-in.o: In function `goldfish_nand_remove':
goldfish_nand.c:(.text+0x6e7d0e): undefined reference to
`mtd_device_unregister'
drivers/built-in.o: In function `goldfish_nand_erase':
goldfish_nand.c:(.text+0x6e8ba2): undefined reference to
`mtd_erase_callback'
drivers/built-in.o: In function `goldfish_nand_init_device':
goldfish_nand.c:(.text+0x6e8eba): undefined reference to
`mtd_device_parse_register'

Reported-by: Randy Dunlap <rdunlap@infradead.org>
Signed-off-by: Peter Huewe <peterhuewe@gmx.de>
---
@Randy: The contact info you're looking for is in CC of this mail.

 drivers/staging/goldfish/Kconfig |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/drivers/staging/goldfish/Kconfig b/drivers/staging/goldfish/Kconfig
index d6c98d0..4e09460 100644
--- a/drivers/staging/goldfish/Kconfig
+++ b/drivers/staging/goldfish/Kconfig
@@ -7,6 +7,7 @@ config GOLDFISH_AUDIO
 config MTD_GOLDFISH_NAND
 	tristate "Goldfish NAND device"
 	depends on GOLDFISH
+	depends on MTD
 	help
 	  Drives the emulated NAND flash device on the Google Goldfish
 	  Android virtual device.
-- 
1.7.8.6
