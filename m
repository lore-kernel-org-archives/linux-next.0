From: Timur Tabi <timur@codeaurora.org>
Subject: [PATCH 3/8] arm64: defconfig: enable BLK_DEV_NVME
Date: Thu, 13 Apr 2017 15:51:18 -0500
Message-ID: <1492116683-26399-4-git-send-email-timur@codeaurora.org>
References: <1492116683-26399-1-git-send-email-timur@codeaurora.org>
Return-path: <linux-next-owner@vger.kernel.org>
Received: from smtp.codeaurora.org ([198.145.29.96]:60372 "EHLO
        smtp.codeaurora.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S932108AbdDMUvp (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 13 Apr 2017 16:51:45 -0400
In-Reply-To: <1492116683-26399-1-git-send-email-timur@codeaurora.org>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: linux-arm-kernel@lists.infradead.org, linux-next@vger.kernel.org, sfr@canb.auug.org.au, maxime.ripard@free-electrons.com, olof@lixom.ne, Wei Xu <xuwei5@hisilicon.com>, Mark Rutland <mark.rutland@arm.com>, robin.murphy@arm.com, ard.biesheuvel@linaro.org, leif.lindholm@arm.com

NVME is non-volatile storage media attached via PCIe. NVME devices
typically have much higher potential throughput than other block
devices, like SATA, NVME is a must-have requirement for ARM64 based
servers.

Signed-off-by: Timur Tabi <timur@codeaurora.org>
---
 arch/arm64/configs/defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index 345f6d8..71bc81e 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -153,6 +153,7 @@ CONFIG_MTD_SPI_NOR=y
 CONFIG_BLK_DEV_LOOP=y
 CONFIG_BLK_DEV_NBD=m
 CONFIG_VIRTIO_BLK=y
+CONFIG_BLK_DEV_NVME=m
 CONFIG_SRAM=y
 CONFIG_EEPROM_AT25=m
 # CONFIG_SCSI_PROC_FS is not set
-- 
Qualcomm Datacenter Technologies, Inc. as an affiliate of Qualcomm
Technologies, Inc.  Qualcomm Technologies, Inc. is a member of the
Code Aurora Forum, a Linux Foundation Collaborative Project.
