From: Ley Foon Tan <lftan@altera.com>
Subject: Re: linux-next: build failure after merge of the pci tree
Date: Tue, 3 Nov 2015 16:02:41 +0800
Message-ID: <1446537761.13032.8.camel@leyfoon-vm>
References: <20151102022307.774bde2c@canb.auug.org.au>
	 <E7E66AD1AD65064486AD57C361DF091C05C7B391@PG-ITEXCH01.altera.priv.altera.com>
	 <CAErSpo4AaRQ8QCUrdu7JdAP5_Vz5mKfX5K2ujeE8H+Oo_8K17w@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAErSpo4AaRQ8QCUrdu7JdAP5_Vz5mKfX5K2ujeE8H+Oo_8K17w@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Bjorn Helgaas <bhelgaas@google.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, "linux-next@vger.kernel.org" <linux-next@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: linux-next.vger.kernel.org

On Isn, 2015-11-02 at 12:12 -0600, Bjorn Helgaas wrote:
> On Sun, Nov 1, 2015 at 6:00 PM, Ley Foon Tan <lftan@altera.com> wrote:
> > On Isn, 2015-11-02 at 02:23 +1100, Stephen Rothwell wrote:
> >> Hi Bjorn,
> >>
> >> After merging the pci tree, today's linux-next build (powerpc
> >> allyesconfig) failed like this:
> >>
> >> In file included from include/linux/kvm_host.h:20:0,
> >>                  from arch/powerpc/kernel/asm-offsets.c:54:
> >> include/linux/msi.h:174:21: fatal error: asm/msi.h: No such file or directory
> >>
> >> Caused by commit
> >>
> >>   f19eafec930f ("PCI: altera: Add Altera PCIe MSI driver")
> >>
> >> I have disabled that driver for today:
> >>
> >> From: Stephen Rothwell <sfr@canb.auug.org.au>
> >> Date: Mon, 2 Nov 2015 02:12:54 +1100
> >> Subject: [PATCH] PCI: altera: disable MSI driver for now
> >>
> >> Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
> >> ---
> >>  drivers/pci/host/Kconfig | 1 +
> >>  1 file changed, 1 insertion(+)
> >>
> >> diff --git a/drivers/pci/host/Kconfig b/drivers/pci/host/Kconfig
> >> index 2af0571356e8..7a31ebbc4379 100644
> >> --- a/drivers/pci/host/Kconfig
> >> +++ b/drivers/pci/host/Kconfig
> >> @@ -158,6 +158,7 @@ config PCIE_ALTERA
> >>  config PCIE_ALTERA_MSI
> >>       bool "Altera PCIe MSI feature"
> >>       depends on PCI_MSI
> >> +     depends on BROKEN
> >>       select PCI_MSI_IRQ_DOMAIN
> >>       help
> >>         Say Y here if you want PCIe MSI support for the Altera FPGA.
> >> --
> >> 2.6.1
> >>
> > Hi Bjorn
> >
> > This driver depends on the asm/msi.h and not all architectures include
> > the asm/msi.h.
> > We can fix this by adding "depends on ARM || NIOS2" to Kconfig, same as
> > altera pcie driver. What do you think?
> 
> I don't think your driver depends on asm/msi.h because ARM doesn't
> have asm/msi.h either.
> 
> I think the best thing is to do this:
> 
> config PCIE_ALTERA_MSI
>         bool "Altera PCIe MSI feature"
>         depends on PCIE_ALTERA && PCI_MSI
> 
> That way we don't have to repeat the constraints from PCIE_ALTERA.
> This is the same strategy used by PCI_XGENE & PCI_XGENE_MSI.
> 
Okay. Thanks for the fix.

Regards
Ley Foon
