From: Will Deacon <will.deacon@arm.com>
Subject: Re: [PATCH 0/9] [v3] arm64: defconfig: enable several options useful
 for ARM64 server platforms
Date: Wed, 3 May 2017 16:48:52 +0100
Message-ID: <20170503154852.GS8233@arm.com>
References: <1493413563-18375-1-git-send-email-timur@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from foss.arm.com ([217.140.101.70]:58216 "EHLO foss.arm.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1751601AbdECPsu (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Wed, 3 May 2017 11:48:50 -0400
Content-Disposition: inline
In-Reply-To: <1493413563-18375-1-git-send-email-timur@codeaurora.org>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Timur Tabi <timur@codeaurora.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-next@vger.kernel.org, Gregory CLEMENT <gregory.clement@free-electrons.com>, Catalin Marinas <catalin.marinas@arm.com>, Arnd Bergmann <arnd@arndb.de>

Hi Timur,

On Fri, Apr 28, 2017 at 04:05:54PM -0500, Timur Tabi wrote:
> ACPI-based ARM64 server platforms based, like the Qualcomm Datacenter
> Technologies QDF2400, need several features and drivers enabled for
> full functionality.  This patchset enables many of those features.
> 
> The first patch, "resynchronize the defconfig" refreshes the ARM64
> defconfig so that it's aligned with savedefconfig.  This needs to be
> done periodically, so that new patches avoid merge conflicts.  
> 
> If the first patch does not apply cleanly, I ask the maintainer to 
> refresh it himself manually, following the instructions in the commit
> message.  The remaining 8 patches should apply cleanly on top of that.

The arm-soc folks usually deal with defconfig updates, so please resend this
to arm@kernel.org, although I suspect it's too late for 4.12 given that the
merge window is now open. The "resynchronize" patch is also likely to
conflict with any other pending changes to the file.

Will

> Timur Tabi (9):
>   [v3] arm64: defconfig: resynchronize the defconfig
>   arm64: defconfig: enable ACPI_CPPC_CPUFREQ
>   arm64: defconfig: enable BLK_DEV_NVME
>   [v2] arm64: defconfig: enable EFI_CAPSULE_LOADER
>   arm64: defconfig: enable support for PCIe hotplug
>   arm64: defconfig: enable APEI and GHES features
>   [v2] arm64: defconfig: enable EDAC options
>   arm64: defconfig: enable QCOM_L2_PMU and QCOM_L3_PMU
>   arm64: defconfig: enable the Qualcomm Technologies EMAC Ethernet
>     driver
> 
>  arch/arm64/configs/defconfig | 116 ++++++++++++++++++++-----------------------
>  1 file changed, 55 insertions(+), 61 deletions(-)
> 
> -- 
> Qualcomm Datacenter Technologies, Inc. as an affiliate of Qualcomm
> Technologies, Inc.  Qualcomm Technologies, Inc. is a member of the
> Code Aurora Forum, a Linux Foundation Collaborative Project.
> 
