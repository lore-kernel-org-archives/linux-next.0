From: Timur Tabi <timur@codeaurora.org>
Subject: [PATCH 5/8] arm64: defconfig: enable EFI_VARS and EFI_CAPSULE_LOADER
Date: Wed, 12 Apr 2017 11:02:57 -0500
Message-ID: <1492012980-11650-6-git-send-email-timur@codeaurora.org>
References: <1492012980-11650-1-git-send-email-timur@codeaurora.org>
Return-path: <linux-next-owner@vger.kernel.org>
Received: from smtp.codeaurora.org ([198.145.29.96]:57848 "EHLO
        smtp.codeaurora.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752731AbdDLQDK (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 12 Apr 2017 12:03:10 -0400
In-Reply-To: <1492012980-11650-1-git-send-email-timur@codeaurora.org>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: linux-arm-kernel@lists.infradead.org, sfr@canb.auug.org.au, linux-next@vger.kernel.org, maxime.ripard@free-electrons.com, olof@lixom.net, Wei Xu <xuwei5@hisilicon.com>

Many ARM64 server systems boot via EFI, so enable support for some EFI
options to allow applications to interact with EFI.

CONFIG_EFI_VARS enables sysfs support for reading and writing variables

CONFIG_EFI_CAPSULE_LOADER allows the user to update the EFI firmware.

Signed-off-by: Timur Tabi <timur@codeaurora.org>
---
 arch/arm64/configs/defconfig | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index 1e5c516..cdc8698 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -485,6 +485,8 @@ CONFIG_PHY_XGENE=y
 CONFIG_PHY_TEGRA_XUSB=y
 CONFIG_ARM_SCPI_PROTOCOL=y
 CONFIG_RASPBERRYPI_FIRMWARE=y
+CONFIG_EFI_VARS=y
+CONFIG_EFI_CAPSULE_LOADER=y
 CONFIG_ACPI=y
 CONFIG_EXT2_FS=y
 CONFIG_EXT3_FS=y
-- 
Qualcomm Datacenter Technologies, Inc. as an affiliate of Qualcomm
Technologies, Inc.  Qualcomm Technologies, Inc. is a member of the
Code Aurora Forum, a Linux Foundation Collaborative Project.
