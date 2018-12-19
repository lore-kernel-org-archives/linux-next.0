From: =?UTF-8?q?Horia=20Geant=C4=83?= <horia.geanta@nxp.com>
Subject: [PATCH] Revert "arm64: defconfig: Enable FSL_MC_BUS and FSL_MC_DPIO"
Date: Wed, 19 Dec 2018 12:18:44 +0200
Message-ID: <20181219101844.6362-1-horia.geanta@nxp.com>
References: <2071995319.127120.1545163830046@email.ionos.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <2071995319.127120.1545163830046@email.ionos.de>
Sender: linux-kernel-owner@vger.kernel.org
To: Olof Johansson <olof@lixom.net>, Marc Gonzalez <marc.w.gonzalez@free.fr>
Cc: arm@kernel.org, linux-arm-kernel@lists.infradead.org, Stefan Wahren <stefan.wahren@i2se.com>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, sfr@canb.auug.org.au
List-Id: linux-next.vger.kernel.org

This reverts commit d9678adbe733a770428a98651beaa2817d503ed3.

Received below report from Stefan.
Revert the commit until CAAM driver dependency cycles are fixed.

this patch in next-20181214 breaks "make modules_install" for
arm64/defconfig on my Ubuntu machine:

DEPMOD  4.20.0-rc6-next-20181214
depmod: ERROR: Found 6 modules in dependency cycles!
depmod: ERROR: Cycle detected: caamalg_desc -> dpaa2_caam -> authenc
depmod: ERROR: Cycle detected: caamalg_desc -> dpaa2_caam -> fsl_mc_dpio
depmod: ERROR: Cycle detected: dpaa2_caam -> caamhash_desc -> dpaa2_caam
depmod: ERROR: Cycle detected: caamalg_desc -> dpaa2_caam -> caamhash_desc -> error
depmod: ERROR: Cycle detected: caamalg_desc -> dpaa2_caam -> caamhash_desc -> caamalg_desc

Reported-by: Stefan Wahren <stefan.wahren@i2se.com>
Signed-off-by: Horia Geantă <horia.geanta@nxp.com>
---
 arch/arm64/configs/defconfig | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index 989f51bb1bd4..d0724d4e0546 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -200,7 +200,6 @@ CONFIG_DMA_CMA=y
 CONFIG_CMA_SIZE_MBYTES=32
 CONFIG_HISILICON_LPC=y
 CONFIG_SIMPLE_PM_BUS=y
-CONFIG_FSL_MC_BUS=y
 CONFIG_MTD=y
 CONFIG_MTD_BLOCK=y
 CONFIG_MTD_M25P80=y
@@ -644,7 +643,6 @@ CONFIG_RPMSG_QCOM_GLINK_RPM=y
 CONFIG_RPMSG_QCOM_GLINK_SMEM=m
 CONFIG_RPMSG_QCOM_SMD=y
 CONFIG_RASPBERRYPI_POWER=y
-CONFIG_FSL_MC_DPIO=m
 CONFIG_QCOM_COMMAND_DB=y
 CONFIG_QCOM_GENI_SE=y
 CONFIG_QCOM_GLINK_SSR=m
@@ -737,7 +735,6 @@ CONFIG_NLS_ISO8859_1=y
 CONFIG_SECURITY=y
 CONFIG_CRYPTO_ECHAINIV=y
 CONFIG_CRYPTO_ANSI_CPRNG=y
-CONFIG_CRYPTO_DEV_FSL_DPAA2_CAAM=m
 CONFIG_PRINTK_TIME=y
 CONFIG_DEBUG_INFO=y
 CONFIG_DEBUG_FS=y
-- 
2.16.2
