From: "Rafael J. Wysocki" <rjw@sisk.pl>
Subject: Re: linux-next: pci tree build failure
Date: Mon, 18 Jan 2010 22:24:44 +0100
Message-ID: <201001182224.44223.rjw@sisk.pl>
References: <20100118194050.7ea0c406.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: Text/Plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ogre.sisk.pl ([217.79.144.158]:50303 "EHLO ogre.sisk.pl"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1754896Ab0ARVYZ (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Mon, 18 Jan 2010 16:24:25 -0500
In-Reply-To: <20100118194050.7ea0c406.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>, Jesse Barnes <jbarnes@virtuousgeek.org>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Shaohua Li <shaohua.li@intel.com>

On Monday 18 January 2010, Stephen Rothwell wrote:
> Hi Jesse,
> 
> Today's linux-next build (ppc64 allyesconfig) failed like this:
> 
> In file included from drivers/pci/pcie/pme/pcie_pme.c:22:
> include/linux/pci-acpi.h:42: error: expected '=', ',', ';', 'asm' or '__attribute__' before 'acpi_find_root_bridge_handle'
> 
> This file was added in commit f3adb5a4f2e1dfdf9482af05481d0928a39477e8
> ("PCI PM: PCIe PME root port service driver") from the pci tree and seems
> to depend on ACPI.  Maybe its building should depend on CONFIG_ACPI?
> 
> I added the following patch for today (I presume there is a better fix):
> 
> From: Stephen Rothwell <sfr@canb.auug.org.au>
> Date: Mon, 18 Jan 2010 19:36:11 +1100
> Subject: [PATCH] pci: PCIE_PME seems to depend on ACPI
> 
> Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
> ---
>  drivers/pci/pcie/Kconfig |    2 +-
>  1 files changed, 1 insertions(+), 1 deletions(-)
> 
> diff --git a/drivers/pci/pcie/Kconfig b/drivers/pci/pcie/Kconfig
> index cf3c35f..b8b494b 100644
> --- a/drivers/pci/pcie/Kconfig
> +++ b/drivers/pci/pcie/Kconfig
> @@ -49,4 +49,4 @@ config PCIEASPM_DEBUG
>  
>  config PCIE_PME
>  	def_bool y
> -	depends on PCIEPORTBUS && PM_RUNTIME && EXPERIMENTAL
> +	depends on PCIEPORTBUS && PM_RUNTIME && EXPERIMENTAL && ACPI

Thanks a lot, this is the right fix IMO.

Jesse, do you want me to resend the patch with this fix included or are you
going to take the Stephens patch to your tree?

Rafael
