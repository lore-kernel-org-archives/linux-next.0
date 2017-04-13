From: Timur Tabi <timur@codeaurora.org>
Subject: [PATCH 2/8] arm64: defconfig: enable ACPI_CPPC_CPUFREQ
Date: Thu, 13 Apr 2017 15:51:17 -0500
Message-ID: <1492116683-26399-3-git-send-email-timur@codeaurora.org>
References: <1492116683-26399-1-git-send-email-timur@codeaurora.org>
Return-path: <linux-next-owner@vger.kernel.org>
Received: from smtp.codeaurora.org ([198.145.29.96]:60238 "EHLO
        smtp.codeaurora.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S932108AbdDMUvk (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 13 Apr 2017 16:51:40 -0400
In-Reply-To: <1492116683-26399-1-git-send-email-timur@codeaurora.org>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: linux-arm-kernel@lists.infradead.org, linux-next@vger.kernel.org, sfr@canb.auug.org.au, maxime.ripard@free-electrons.com, olof@lixom.ne, Wei Xu <xuwei5@hisilicon.com>, Mark Rutland <mark.rutland@arm.com>, robin.murphy@arm.com, ard.biesheuvel@linaro.org, leif.lindholm@arm.com

The CPPC CPUFreq driver is used on many ACPI-based ARM64 server systems.

Signed-off-by: Timur Tabi <timur@codeaurora.org>
---
 arch/arm64/configs/defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index 17eb452..345f6d8 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -89,6 +89,7 @@ CONFIG_CPU_FREQ=y
 CONFIG_CPUFREQ_DT=y
 CONFIG_ARM_BIG_LITTLE_CPUFREQ=y
 CONFIG_ARM_SCPI_CPUFREQ=y
+CONFIG_ACPI_CPPC_CPUFREQ=m
 CONFIG_NET=y
 CONFIG_PACKET=y
 CONFIG_UNIX=y
-- 
Qualcomm Datacenter Technologies, Inc. as an affiliate of Qualcomm
Technologies, Inc.  Qualcomm Technologies, Inc. is a member of the
Code Aurora Forum, a Linux Foundation Collaborative Project.
