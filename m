From: Timur Tabi <timur@codeaurora.org>
Subject: [PATCH 8/9] arm64: defconfig: enable QCOM_L2_PMU and QCOM_L3_PMU
Date: Fri, 28 Apr 2017 16:06:02 -0500
Message-ID: <1493413563-18375-9-git-send-email-timur@codeaurora.org>
References: <1493413563-18375-1-git-send-email-timur@codeaurora.org>
Return-path: <linux-next-owner@vger.kernel.org>
Received: from smtp.codeaurora.org ([198.145.29.96]:56636 "EHLO
        smtp.codeaurora.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S932342AbdD1VGQ (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Fri, 28 Apr 2017 17:06:16 -0400
In-Reply-To: <1493413563-18375-1-git-send-email-timur@codeaurora.org>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: linux-arm-kernel@lists.infradead.org, linux-next@vger.kernel.org, Gregory CLEMENT <gregory.clement@free-electrons.com>, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will.deacon@arm.com>, Arnd Bergmann <arnd@arndb.de>
Cc: timur@codeaurora.org

Now that the drivers are available, enable support for L2 and L3
performance monitoring Qualcomm Datacenter Technologies Centriq SoCs.
These PMU drivers provide support for performance optimization.

Signed-off-by: Timur Tabi <timur@codeaurora.org>
---
 arch/arm64/configs/defconfig | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index b8b1374..424064b 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -485,6 +485,8 @@ CONFIG_PHY_ROCKCHIP_INNO_USB2=y
 CONFIG_PHY_ROCKCHIP_EMMC=y
 CONFIG_PHY_XGENE=y
 CONFIG_PHY_TEGRA_XUSB=y
+CONFIG_QCOM_L2_PMU=y
+CONFIG_QCOM_L3_PMU=y
 CONFIG_ARM_SCPI_PROTOCOL=y
 CONFIG_RASPBERRYPI_FIRMWARE=y
 CONFIG_EFI_CAPSULE_LOADER=y
-- 
Qualcomm Datacenter Technologies, Inc. as an affiliate of Qualcomm
Technologies, Inc.  Qualcomm Technologies, Inc. is a member of the
Code Aurora Forum, a Linux Foundation Collaborative Project.
