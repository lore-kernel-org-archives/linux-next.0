From: Tony Lindgren <tony@atomide.com>
Subject: Re: linux-next: manual merge of the omap tree with the keystone tree
Date: Thu, 21 Dec 2017 15:12:53 -0800
Message-ID: <20171221231253.GX3875@atomide.com>
References: <20171222084545.5bab63b5@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from muru.com ([72.249.23.125]:33080 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1755179AbdLUXM5 (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Thu, 21 Dec 2017 18:12:57 -0500
Content-Disposition: inline
In-Reply-To: <20171222084545.5bab63b5@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Santosh Shilimkar <santosh.shilimkar@oracle.com>, Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Kishon Vijay Abraham I <kishon@ti.com>

* Stephen Rothwell <sfr@canb.auug.org.au> [171221 21:48]:
> Hi Tony,
> 
> Today's linux-next merge of the omap tree got a conflict in:
> 
>   arch/arm/configs/multi_v7_defconfig
> 
> between commit:
> 
>   d3b15c54ed7e ("ARM: config: sync multi-v7 config with keystone peripherals")
> 
> from the keystone tree and commit:
> 
>   d03366dcbffc ("ARM: multi_v7_defconfig: Enable CONFIG_PCI_DRA7XX (Host & Device modes)")
> 
> from the omap tree.
> 
> I fixed it up (see below) and can carry the fix as necessary. This
> is now fixed as far as linux-next is concerned, but any non trivial
> conflicts should be mentioned to your upstream maintainer when your tree
> is submitted for merging.  You may also want to consider cooperating
> with the maintainer of the conflicting tree to minimise any particularly
> complex conflicts.

Thanks I'll wait on this one so Kishon can check the resulting next.

Santosh, the removal of CONFIG_PCI in multi_v7_defconfig looks a bit
suspcicious to me, care to check if commit d3b15c54ed7e is correct?

Regards,

Tony


> diff --cc arch/arm/configs/multi_v7_defconfig
> index c4f4f6682ea5,6faecd55ccbd..000000000000
> --- a/arch/arm/configs/multi_v7_defconfig
> +++ b/arch/arm/configs/multi_v7_defconfig
> @@@ -105,13 -113,24 +105,18 @@@ CONFIG_ARCH_VEXPRESS=
>   CONFIG_ARCH_VEXPRESS_TC2_PM=y
>   CONFIG_ARCH_WM8850=y
>   CONFIG_ARCH_ZYNQ=y
>  -CONFIG_TRUSTED_FOUNDATIONS=y
>  -CONFIG_PCI=y
>  -CONFIG_PCI_HOST_GENERIC=y
> + CONFIG_PCI_DRA7XX=y
> + CONFIG_PCI_DRA7XX_EP=y
>   CONFIG_PCI_KEYSTONE=y
>  -CONFIG_PCI_MSI=y
>   CONFIG_PCI_MVEBU=y
>   CONFIG_PCI_TEGRA=y
>   CONFIG_PCI_RCAR_GEN2=y
>   CONFIG_PCIE_RCAR=y
>  -CONFIG_PCIEPORTBUS=y
> + CONFIG_PCI_ENDPOINT=y
> + CONFIG_PCI_ENDPOINT_CONFIGFS=y
> + CONFIG_PCI_EPF_TEST=m
>   CONFIG_SMP=y
>   CONFIG_NR_CPUS=16
>  -CONFIG_HIGHPTE=y
>   CONFIG_CMA=y
>   CONFIG_SECCOMP=y
>   CONFIG_ARM_APPENDED_DTB=y
