From: Ley Foon Tan <lftan@altera.com>
Subject: Re: linux-next: build failure after merge of the pci tree
Date: Mon, 2 Nov 2015 08:09:28 +0800
Message-ID: <1446422968.13032.7.camel@leyfoon-vm>
References: <20151102022307.774bde2c@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20151102022307.774bde2c@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Bjorn Helgaas <bhelgaas@google.com>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-next.vger.kernel.org

On Isn, 2015-11-02 at 02:23 +1100, Stephen Rothwell wrote:
> Hi Bjorn,
> 
> After merging the pci tree, today's linux-next build (powerpc
> allyesconfig) failed like this:
> 
> In file included from include/linux/kvm_host.h:20:0,
>                  from arch/powerpc/kernel/asm-offsets.c:54:
> include/linux/msi.h:174:21: fatal error: asm/msi.h: No such file or directory
> 
> Caused by commit
> 
>   f19eafec930f ("PCI: altera: Add Altera PCIe MSI driver")
> 
> I have disabled that driver for today:
> 
> From: Stephen Rothwell <sfr@canb.auug.org.au>
> Date: Mon, 2 Nov 2015 02:12:54 +1100
> Subject: [PATCH] PCI: altera: disable MSI driver for now
> 
> Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
> ---
>  drivers/pci/host/Kconfig | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/pci/host/Kconfig b/drivers/pci/host/Kconfig
> index 2af0571356e8..7a31ebbc4379 100644
> --- a/drivers/pci/host/Kconfig
> +++ b/drivers/pci/host/Kconfig
> @@ -158,6 +158,7 @@ config PCIE_ALTERA
>  config PCIE_ALTERA_MSI
>  	bool "Altera PCIe MSI feature"
>  	depends on PCI_MSI
> +	depends on BROKEN
>  	select PCI_MSI_IRQ_DOMAIN
>  	help
>  	  Say Y here if you want PCIe MSI support for the Altera FPGA.
> -- 
> 2.6.1
> 

Hi Bjorn

This driver depends on the asm/msi.h and not all architectures include
the asm/msi.h.
We can fix this by adding "depends on ARM || NIOS2" to Kconfig, same as
altera pcie driver. What do you think?

Thanks.

Regards
Ley Foon
