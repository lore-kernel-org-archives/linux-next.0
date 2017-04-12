From: Timur Tabi <timur@codeaurora.org>
Subject: [PATCH 0/8] arm64: defconfig: enable several options useful for ARM64 server platforms
Date: Wed, 12 Apr 2017 11:02:52 -0500
Message-ID: <1492012980-11650-1-git-send-email-timur@codeaurora.org>
Return-path: <linux-next-owner@vger.kernel.org>
Received: from smtp.codeaurora.org ([198.145.29.96]:57326 "EHLO
        smtp.codeaurora.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1754618AbdDLQDP (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 12 Apr 2017 12:03:15 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: linux-arm-kernel@lists.infradead.org, sfr@canb.auug.org.au, linux-next@vger.kernel.org, maxime.ripard@free-electrons.com, olof@lixom.net, Wei Xu <xuwei5@hisilicon.com>

ACPI-based ARM64 server platforms based, like the Qualcomm Datacenter
Technologies QDF2400, need several features and drivers enabled for
full functionality.  This patchset enables many of those features.

The first patch, "resynchronize the defconfig" refreshes the ARM64
defconfig so that it's aligned with savedefconfig.  This needs to be
done periodically, so that new patches avoid merge conflicts.  

If the first patch does not apply cleanly, I ask the maintainer to 
refresh it himself manually, following the instructions in the commit
message.  The remaining 7 patches should apply cleanly on top of that.

Timur Tabi (8):
  arm64: defconfig: resynchronize the defconfig
  arm64: defconfig: enable ACPI_CPPC_CPUFREQ
  arm64: defconfig: enable TCG_TPM and TCG_CRB
  arm64: defconfig: enable BLK_DEV_NVME
  arm64: defconfig: enable EFI_VARS and EFI_CAPSULE_LOADER
  arm64: defconfig: enable support for PCIe hotplug
  arm64: defconfig: enable APEI and GHES features
  arm64: defconfig: enable EDAC options

 arch/arm64/configs/defconfig | 114 +++++++++++++++++++++----------------------
 1 file changed, 56 insertions(+), 58 deletions(-)

-- 
Qualcomm Datacenter Technologies, Inc. as an affiliate of Qualcomm
Technologies, Inc.  Qualcomm Technologies, Inc. is a member of the
Code Aurora Forum, a Linux Foundation Collaborative Project.
