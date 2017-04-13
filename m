From: Timur Tabi <timur@codeaurora.org>
Subject: [PATCH 5/8] arm64: defconfig: enable support for PCIe hotplug
Date: Thu, 13 Apr 2017 15:51:20 -0500
Message-ID: <1492116683-26399-6-git-send-email-timur@codeaurora.org>
References: <1492116683-26399-1-git-send-email-timur@codeaurora.org>
Return-path: <linux-next-owner@vger.kernel.org>
Received: from smtp.codeaurora.org ([198.145.29.96]:60656 "EHLO
        smtp.codeaurora.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S932118AbdDMUv5 (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 13 Apr 2017 16:51:57 -0400
In-Reply-To: <1492116683-26399-1-git-send-email-timur@codeaurora.org>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: linux-arm-kernel@lists.infradead.org, linux-next@vger.kernel.org, sfr@canb.auug.org.au, maxime.ripard@free-electrons.com, olof@lixom.ne, Wei Xu <xuwei5@hisilicon.com>, Mark Rutland <mark.rutland@arm.com>, robin.murphy@arm.com, ard.biesheuvel@linaro.org, leif.lindholm@arm.com

Some ARM64 server systems support PCIe hotplug, so enable the options
for that.

Signed-off-by: Timur Tabi <timur@codeaurora.org>
---
 arch/arm64/configs/defconfig | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index 5c7082d..318c0aa 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -61,7 +61,10 @@ CONFIG_ARCH_XGENE=y
 CONFIG_ARCH_ZX=y
 CONFIG_ARCH_ZYNQMP=y
 CONFIG_PCI=y
+CONFIG_HOTPLUG_PCI_PCIE=y
 CONFIG_PCI_IOV=y
+CONFIG_HOTPLUG_PCI=y
+CONFIG_HOTPLUG_PCI_ACPI=y
 CONFIG_PCI_LAYERSCAPE=y
 CONFIG_PCI_HISI=y
 CONFIG_PCIE_QCOM=y
-- 
Qualcomm Datacenter Technologies, Inc. as an affiliate of Qualcomm
Technologies, Inc.  Qualcomm Technologies, Inc. is a member of the
Code Aurora Forum, a Linux Foundation Collaborative Project.
