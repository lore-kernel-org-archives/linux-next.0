From: Jesse Barnes <jbarnes@virtuousgeek.org>
Subject: Re: [PATCH next] pci: fix build error with !PCIE_ECRC
Date: Tue, 7 Apr 2009 14:52:08 -0700
Message-ID: <20090407145208.56c25214@hobbes>
References: <20090407123707.GA18687@orion>
	<1239125629.19984.196.camel@grinch>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-pci-owner@vger.kernel.org>
In-Reply-To: <1239125629.19984.196.camel@grinch>
Sender: linux-pci-owner@vger.kernel.org
To: Andrew Patterson <andrew.patterson@hp.com>
Cc: Alexander Beregalov <a.beregalov@gmail.com>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, linux-pci@vger.kernel.org
List-Id: linux-next.vger.kernel.org

On Tue, 07 Apr 2009 17:33:49 +0000
Andrew Patterson <andrew.patterson@hp.com> wrote:

> On Tue, 2009-04-07 at 16:37 +0400, Alexander Beregalov wrote:
> > Fix this build error:
> > drivers/built-in.o: In function `pci_init_capabilities':
> > drivers/pci/probe.c:989: undefined reference to
> > `pcie_set_ecrc_checking' drivers/built-in.o: In function
> > `pci_setup': drivers/pci/pci.c:2547: undefined reference to
> > `pcie_ecrc_get_policy'
> > 
> > Signed-off-by: Alexander Beregalov <a.beregalov@gmail.com>
> > ---
> > 
> >  drivers/pci/pci.c        |    2 ++
> >  drivers/pci/pcie/Kconfig |    2 +-
> >  drivers/pci/probe.c      |    2 ++
> >  3 files changed, 5 insertions(+), 1 deletions(-)
> > 
> > diff --git a/drivers/pci/pci.c b/drivers/pci/pci.c
> > index f61b2cf..f1c393e 100644
> > --- a/drivers/pci/pci.c
> > +++ b/drivers/pci/pci.c
> > @@ -2543,8 +2543,10 @@ static int __init pci_setup(char *str)
> >  			} else if (!strncmp(str,
> > "resource_alignment=", 19)) { pci_set_resource_alignment_param(str
> > + 19, strlen(str + 19));
> > +#ifdef CONFIG_PCIE_ECRC
> >  			} else if (!strncmp(str, "ecrc=", 5)) {
> >  				pcie_ecrc_get_policy(str + 5);
> > +#endif
> >  			} else {
> >  				printk(KERN_ERR "PCI: Unknown
> > option `%s'\n", str);
> > diff --git a/drivers/pci/pcie/Kconfig b/drivers/pci/pcie/Kconfig
> > index a79e52b..9d0e727 100644
> > --- a/drivers/pci/pcie/Kconfig
> > +++ b/drivers/pci/pcie/Kconfig
> > @@ -52,7 +52,7 @@ config PCIEASPM_DEBUG
> >  #
> >  config PCIE_ECRC
> >  	bool "PCI Express ECRC support"
> > -	depends on PCI
> > +	depends on PCI && PCIEPORTBUS
> 
> We really only need this.  There are empty functions in
> include/linux/pci.h to handle the case where PCIE_ECRC is not defined.
> The problem is that the code in drivers/pci/pcie is only compiled if
> PCIEPORTBUS is defined.  This feature does not depend on any
> PCIEPORTBUS code. So either ecrc.c needs to be moved to drivers/pci
> or we need to not assume that drivers/pci/pcie is only for the
> portbus driver.
> 

Btw I dropped this patch back out in light of Kenji-san's comments, so
I expect any subsequent version to include a fix for the build issue.

Thanks,
-- 
Jesse Barnes, Intel Open Source Technology Center
