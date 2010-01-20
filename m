From: Jesse Barnes <jbarnes@virtuousgeek.org>
Subject: Re: linux-next: pci tree build failure
Date: Wed, 20 Jan 2010 06:39:32 +0200
Message-ID: <20100120063932.3a8ac69e@jbarnes-x200.intel.com>
References: <20100118194050.7ea0c406.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner+glk-linux-kernel-3=40m.gmane.org-S1754631Ab0ATEjl@vger.kernel.org>
In-Reply-To: <20100118194050.7ea0c406.sfr@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, "Rafael J. Wysocki" <rjw@sisk.pl>, Shaohua Li <shaohua.li@intel.com>
List-Id: linux-next.vger.kernel.org

Pushed this fix out to linux-next, thanks.

Jesse

On Mon, 18 Jan 2010 19:40:50 +1100
Stephen Rothwell <sfr@canb.auug.org.au> wrote:

> Hi Jesse,
> 
> Today's linux-next build (ppc64 allyesconfig) failed like this:
> 
> In file included from drivers/pci/pcie/pme/pcie_pme.c:22:
> include/linux/pci-acpi.h:42: error: expected '=', ',', ';', 'asm' or
> '__attribute__' before 'acpi_find_root_bridge_handle'
> 
> This file was added in commit f3adb5a4f2e1dfdf9482af05481d0928a39477e8
> ("PCI PM: PCIe PME root port service driver") from the pci tree and
> seems to depend on ACPI.  Maybe its building should depend on
> CONFIG_ACPI?
> 
> I added the following patch for today (I presume there is a better
> fix):
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
