From: Timur Tabi <timur@codeaurora.org>
Subject: [PATCH 7/8] arm64: defconfig: enable APEI and GHES features
Date: Wed, 12 Apr 2017 11:02:59 -0500
Message-ID: <1492012980-11650-8-git-send-email-timur@codeaurora.org>
References: <1492012980-11650-1-git-send-email-timur@codeaurora.org>
Return-path: <linux-next-owner@vger.kernel.org>
Received: from smtp.codeaurora.org ([198.145.29.96]:57848 "EHLO
        smtp.codeaurora.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752731AbdDLQDL (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 12 Apr 2017 12:03:11 -0400
In-Reply-To: <1492012980-11650-1-git-send-email-timur@codeaurora.org>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: linux-arm-kernel@lists.infradead.org, sfr@canb.auug.org.au, linux-next@vger.kernel.org, maxime.ripard@free-electrons.com, olof@lixom.net, Wei Xu <xuwei5@hisilicon.com>

ARM64 server platforms can support ACPI Platform Error Interface (APEI)
and Generic Hardware Error Source (GHES) features, so enable them.

Platforms which support the firmware-first RAS error reporting model
require APEI and GHES functionality for the OS to receive and report
error records provided by the platform.

PCIe AER functionality is required for PCIe AER errors to be properly
reported and recovered from.

Signed-off-by: Timur Tabi <timur@codeaurora.org>
---
 arch/arm64/configs/defconfig | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index 5f50213..e99637a 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -491,6 +491,9 @@ CONFIG_RASPBERRYPI_FIRMWARE=y
 CONFIG_EFI_VARS=y
 CONFIG_EFI_CAPSULE_LOADER=y
 CONFIG_ACPI=y
+CONFIG_ACPI_APEI=y
+CONFIG_ACPI_APEI_GHES=y
+CONFIG_ACPI_APEI_PCIEAER=y
 CONFIG_EXT2_FS=y
 CONFIG_EXT3_FS=y
 CONFIG_EXT4_FS_POSIX_ACL=y
-- 
Qualcomm Datacenter Technologies, Inc. as an affiliate of Qualcomm
Technologies, Inc.  Qualcomm Technologies, Inc. is a member of the
Code Aurora Forum, a Linux Foundation Collaborative Project.
