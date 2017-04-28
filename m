From: Timur Tabi <timur@codeaurora.org>
Subject: [PATCH 4/9] [v2] arm64: defconfig: enable EFI_CAPSULE_LOADER
Date: Fri, 28 Apr 2017 16:05:58 -0500
Message-ID: <1493413563-18375-5-git-send-email-timur@codeaurora.org>
References: <1493413563-18375-1-git-send-email-timur@codeaurora.org>
Return-path: <linux-next-owner@vger.kernel.org>
Received: from smtp.codeaurora.org ([198.145.29.96]:56116 "EHLO
        smtp.codeaurora.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S938643AbdD1VGM (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Fri, 28 Apr 2017 17:06:12 -0400
In-Reply-To: <1493413563-18375-1-git-send-email-timur@codeaurora.org>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: linux-arm-kernel@lists.infradead.org, linux-next@vger.kernel.org, Gregory CLEMENT <gregory.clement@free-electrons.com>, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will.deacon@arm.com>, Arnd Bergmann <arnd@arndb.de>
Cc: timur@codeaurora.org

CONFIG_EFI_CAPSULE_LOADER allows the user to update the EFI firmware,
which is useful on ARM64 server platforms.

Signed-off-by: Timur Tabi <timur@codeaurora.org>
---
 arch/arm64/configs/defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index b2c579d..8099aeb 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -483,6 +483,7 @@ CONFIG_PHY_XGENE=y
 CONFIG_PHY_TEGRA_XUSB=y
 CONFIG_ARM_SCPI_PROTOCOL=y
 CONFIG_RASPBERRYPI_FIRMWARE=y
+CONFIG_EFI_CAPSULE_LOADER=y
 CONFIG_ACPI=y
 CONFIG_EXT2_FS=y
 CONFIG_EXT3_FS=y
-- 
Qualcomm Datacenter Technologies, Inc. as an affiliate of Qualcomm
Technologies, Inc.  Qualcomm Technologies, Inc. is a member of the
Code Aurora Forum, a Linux Foundation Collaborative Project.
