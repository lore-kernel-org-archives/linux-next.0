From: Laxman Dewangan <ldewangan@nvidia.com>
Subject: [PATCH V1] mfd: rc5t583: Build only if I2C config is selected to y.
Date: Mon, 19 Mar 2012 11:44:55 +0530
Message-ID: <1332137695-27719-1-git-send-email-ldewangan@nvidia.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: sameo@linux.intel.com, sfr@canb.auug.org.au, linux-next@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, Laxman Dewangan <ldewangan@nvidia.com>
List-Id: linux-next.vger.kernel.org

The rc5t583 driver requires the I2C and regmap apis to
link. But linking fails if I2C is selected as loadable
module, not the module link with binary.
Fixing this error as rc5t583 driver should be built only
if CONFIG_I2C=y.

Signed-off-by: Laxman Dewangan <ldewangan@nvidia.com>
---
Fixing build error reported by Stephen Rothwell:
After merging the mfd tree, today's linux-next build (x86_64 allmodconfig)
failed like this:

drivers/built-in.o: In function `rc5t583_i2c_init':
rc5t583.c:(.init.text+0xb3db): undefined reference to `i2c_register_driver'
drivers/built-in.o: In function `rc5t583_i2c_probe':
rc5t583.c:(.devinit.text+0x8fa0): undefined reference to `regmap_init_i2c'
drivers/built-in.o: In function `rc5t583_i2c_exit':
rc5t583.c:(.exit.text+0x708): undefined reference to `i2c_del_driver'

Caused by commit 1b1247dd75aa ("mfd: Add support for RICOH PMIC
RC5T583"). Presumably some missing Kconfig dependency.


 drivers/mfd/Kconfig |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/drivers/mfd/Kconfig b/drivers/mfd/Kconfig
index f118a31..67fdef1 100644
--- a/drivers/mfd/Kconfig
+++ b/drivers/mfd/Kconfig
@@ -849,7 +849,7 @@ config MFD_INTEL_MSIC
 
 config MFD_RC5T583
 	bool "Ricoh RC5T583 Power Management system device"
-	depends on I2C && GENERIC_HARDIRQS
+	depends on I2C=y && GENERIC_HARDIRQS
 	select MFD_CORE
 	select REGMAP_I2C
 	help
-- 
1.7.1.1
