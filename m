From: Timur Tabi <timur@codeaurora.org>
Subject: [PATCH 3/9] arm64: defconfig: enable BLK_DEV_NVME
Date: Fri, 28 Apr 2017 16:05:57 -0500
Message-ID: <1493413563-18375-4-git-send-email-timur@codeaurora.org>
References: <1493413563-18375-1-git-send-email-timur@codeaurora.org>
Return-path: <linux-next-owner@vger.kernel.org>
Received: from smtp.codeaurora.org ([198.145.29.96]:56200 "EHLO
        smtp.codeaurora.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S939720AbdD1VGM (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Fri, 28 Apr 2017 17:06:12 -0400
In-Reply-To: <1493413563-18375-1-git-send-email-timur@codeaurora.org>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: linux-arm-kernel@lists.infradead.org, linux-next@vger.kernel.org, Gregory CLEMENT <gregory.clement@free-electrons.com>, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will.deacon@arm.com>, Arnd Bergmann <arnd@arndb.de>
Cc: timur@codeaurora.org

NVME is non-volatile storage media attached via PCIe. NVME devices
typically have much higher potential throughput than other block
devices, like SATA, NVME is a must-have requirement for ARM64 based
servers.

Signed-off-by: Timur Tabi <timur@codeaurora.org>
---
 arch/arm64/configs/defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index 11f19df..b2c579d 100644
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
