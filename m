From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build warnings after merge of the keystone tree
Date: Thu, 7 Dec 2017 10:38:16 +1100
Message-ID: <20171207103816.06a8d2d8@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:32891 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1751950AbdLFXiS (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Wed, 6 Dec 2017 18:38:18 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Santosh Shilimkar <santosh.shilimkar@ti.com>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>

Hi Santosh,

After merging the keystone tree, today's linux-next build (arm
multi_v7_defconfig) produced these warnings:

arch/arm/configs/multi_v7_defconfig:843:warning: override: reassigning to symbol ARCH_TEGRA_2x_SOC
arch/arm/configs/multi_v7_defconfig:844:warning: override: reassigning to symbol ARCH_TEGRA_3x_SOC
arch/arm/configs/multi_v7_defconfig:845:warning: override: reassigning to symbol ARCH_TEGRA_114_SOC
arch/arm/configs/multi_v7_defconfig:846:warning: override: reassigning to symbol ARCH_TEGRA_124_SOC
arch/arm/configs/multi_v7_defconfig:932:warning: override: reassigning to symbol KEYSTONE_IRQ
arch/arm/configs/multi_v7_defconfig:933:warning: override: reassigning to symbol HW_RANDOM
arch/arm/configs/multi_v7_defconfig:934:warning: override: reassigning to symbol HW_RANDOM_ST
arch/arm/configs/multi_v7_defconfig:962:warning: override: reassigning to symbol VIDEO_VIVID
arch/arm/configs/multi_v7_defconfig:964:warning: override: reassigning to symbol VIRTIO_PCI
arch/arm/configs/multi_v7_defconfig:966:warning: override: reassigning to symbol VIRTIO_MMIO

Introduced by commit

  0d81df335462 ("ARM: config: sync multi-v7 config with keystone peripherals")



-- 
Cheers,
Stephen Rothwell
