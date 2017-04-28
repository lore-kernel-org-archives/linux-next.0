From: Timur Tabi <timur@codeaurora.org>
Subject: [PATCH 0/9] [v3] arm64: defconfig: enable several options useful for ARM64 server platforms
Date: Fri, 28 Apr 2017 16:05:54 -0500
Message-ID: <1493413563-18375-1-git-send-email-timur@codeaurora.org>
Return-path: <linux-next-owner@vger.kernel.org>
Received: from smtp.codeaurora.org ([198.145.29.96]:55958 "EHLO
        smtp.codeaurora.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S932342AbdD1VGK (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Fri, 28 Apr 2017 17:06:10 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: linux-arm-kernel@lists.infradead.org, linux-next@vger.kernel.org, Gregory CLEMENT <gregory.clement@free-electrons.com>, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will.deacon@arm.com>, Arnd Bergmann <arnd@arndb.de>
Cc: timur@codeaurora.org

ACPI-based ARM64 server platforms based, like the Qualcomm Datacenter
Technologies QDF2400, need several features and drivers enabled for
full functionality.  This patchset enables many of those features.

The first patch, "resynchronize the defconfig" refreshes the ARM64
defconfig so that it's aligned with savedefconfig.  This needs to be
done periodically, so that new patches avoid merge conflicts.  

If the first patch does not apply cleanly, I ask the maintainer to 
refresh it himself manually, following the instructions in the commit
message.  The remaining 8 patches should apply cleanly on top of that.

Timur Tabi (9):
  [v3] arm64: defconfig: resynchronize the defconfig
  arm64: defconfig: enable ACPI_CPPC_CPUFREQ
  arm64: defconfig: enable BLK_DEV_NVME
  [v2] arm64: defconfig: enable EFI_CAPSULE_LOADER
  arm64: defconfig: enable support for PCIe hotplug
  arm64: defconfig: enable APEI and GHES features
  [v2] arm64: defconfig: enable EDAC options
  arm64: defconfig: enable QCOM_L2_PMU and QCOM_L3_PMU
  arm64: defconfig: enable the Qualcomm Technologies EMAC Ethernet
    driver

 arch/arm64/configs/defconfig | 116 ++++++++++++++++++++-----------------------
 1 file changed, 55 insertions(+), 61 deletions(-)

-- 
Qualcomm Datacenter Technologies, Inc. as an affiliate of Qualcomm
Technologies, Inc.  Qualcomm Technologies, Inc. is a member of the
Code Aurora Forum, a Linux Foundation Collaborative Project.
