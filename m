From: Timur Tabi <timur@codeaurora.org>
Subject: Re: [PATCH 0/9] [v3] arm64: defconfig: enable several options useful
 for ARM64 server platforms
Date: Mon, 1 May 2017 10:46:38 -0500
Message-ID: <00b185fa-3fd5-664e-345e-35292d55feb0@codeaurora.org>
References: <1493413563-18375-1-git-send-email-timur@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from smtp.codeaurora.org ([198.145.29.96]:38906 "EHLO
        smtp.codeaurora.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752112AbdEAPql (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 1 May 2017 11:46:41 -0400
In-Reply-To: <1493413563-18375-1-git-send-email-timur@codeaurora.org>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Catalin Marinas <catalin.marinas@arm.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-next@vger.kernel.org, Gregory CLEMENT <gregory.clement@free-electrons.com>, Will Deacon <will.deacon@arm.com>, Arnd Bergmann <arnd@arndb.de>

On 04/28/2017 04:05 PM, Timur Tabi wrote:
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

Catalin,

Any chance of getting these into 4.12?

-- 
Qualcomm Datacenter Technologies, Inc. as an affiliate of Qualcomm
Technologies, Inc.  Qualcomm Technologies, Inc. is a member of the
Code Aurora Forum, a Linux Foundation Collaborative Project.
