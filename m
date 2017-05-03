From: Timur Tabi <timur@codeaurora.org>
Subject: [PATCH 5/9] arm64: defconfig: enable support for PCIe hotplug
Date: Wed,  3 May 2017 11:17:56 -0500
Message-ID: <1493828280-6620-6-git-send-email-timur@codeaurora.org>
References: <1493828280-6620-1-git-send-email-timur@codeaurora.org>
Return-path: <linux-next-owner@vger.kernel.org>
Received: from smtp.codeaurora.org ([198.145.29.96]:52978 "EHLO
        smtp.codeaurora.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751118AbdECQSJ (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 3 May 2017 12:18:09 -0400
In-Reply-To: <1493828280-6620-1-git-send-email-timur@codeaurora.org>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: arm@kernel.org, linux-arm-kernel@lists.infradead.org, linux-next@vger.kernel.org, Gregory CLEMENT <gregory.clement@free-electrons.com>, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will.deacon@arm.com>, Arnd Bergmann <arnd@arndb.de>
Cc: timur@codeaurora.org

Some ARM64 server systems support PCIe hotplug, so enable the options
for that.

Signed-off-by: Timur Tabi <timur@codeaurora.org>
---
 arch/arm64/configs/defconfig | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index 8099aeb..f6b86a1 100644
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
