From: Jesse Barnes <jesse.barnes@intel.com>
Subject: Re: linux-next: Tree for June 17 (pci/slot)
Date: Thu, 18 Jun 2009 14:04:18 -0700
Message-ID: <20090618140418.2e078701@jbarnes-g45>
References: <20090617155354.075c60ae.sfr@canb.auug.org.au>
	<4A39194B.2060200@oracle.com>
	<20090617163604.GT19977@parisc-linux.org>
	<20090617102901.6e39aac2@jbarnes-g45>
	<4A392B48.7060206@oracle.com>
	<20090617161001.734321be@jbarnes-g45>
	<20090618003808.GA29472@ldl.fc.hp.com>
	<20090618004612.GB29472@ldl.fc.hp.com>
	<20090618010357.GC29472@ldl.fc.hp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-pci-owner@vger.kernel.org>
In-Reply-To: <20090618010357.GC29472@ldl.fc.hp.com>
Sender: linux-pci-owner@vger.kernel.org
To: Alex Chiang <achiang@hp.com>
Cc: Randy Dunlap <randy.dunlap@oracle.com>, Matthew Wilcox <matthew@wil.cx>, Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, "linux-pci@vger.kernel.org" <linux-pci@vger.kernel.org>, a.beregalov@gmail.com, lenb@kernel.org
List-Id: linux-next.vger.kernel.org

On Wed, 17 Jun 2009 19:03:57 -0600
Alex Chiang <achiang@hp.com> wrote:

> * Alex Chiang <achiang@hp.com>:
> > diff --git a/drivers/pci/Makefile b/drivers/pci/Makefile
> > index ba6af16..0be4efd 100644
> > --- a/drivers/pci/Makefile
> > +++ b/drivers/pci/Makefile
> > @@ -2,10 +2,11 @@
> >  # Makefile for the PCI bus specific drivers.
> >  #
> >  
> > -obj-y		+= access.o bus.o probe.o remove.o pci.o
> > quirks.o slot.o \
> > -			pci-driver.o search.o pci-sysfs.o rom.o
> > setup-res.o \ +obj-y		+= access.o bus.o probe.o
> > remove.o pci.o quirks.o \
> > +			pci-driver.o search.o rom.o setup-res.o \
> >  			irq.o
> >  obj-$(CONFIG_PROC_FS) += proc.o
> > +obj-$(CONFIG_SYSFS) += slot.o pci-sysfs.o
> 
> Sigh, this won't work because the PCI core blithely assumes we have
> sysfs:
> 
> drivers/built-in.o: In function `pci_bus_add_device':
> /kio/work/achiang/kernels/linux-2.6/drivers/pci/bus.c:89: undefined
> reference to `pci_create_sysfs_dev_files' drivers/built-in.o: In
> function
> `pci_stop_dev': /kio/work/achiang/kernels/linux-2.6/drivers/pci/remove.c:24:
> undefined reference to `pci_remove_sysfs_dev_files'
> 
> So, here is v3 that actually does build with !CONFIG_SYSFS. It
> touches a bit more now, but I believe it is still appropriate
> because neither pci_slot.ko nor any of the drivers in
> drivers/pci/hotplug/ are useful without sysfs.
> 
> From: Alex Chiang <achiang@hp.com>
> 
> PCI: drivers/pci/slot.c should depend on CONFIG_SYSFS
> 
> There is no way to interact with a physical PCI slot without
> sysfs, so encode the dependency and prevent this build error:
> 
> 	drivers/pci/slot.c: In function 'pci_hp_create_module_link':
> 	drivers/pci/slot.c:327: error: 'module_kset' undeclared
> 
> This patch _should_ make pci-sysfs.o depend on CONFIG_SYSFS too,
> but we cannot (yet) because the PCI core merrily assumes the
> existence of sysfs:
> 
> 	drivers/built-in.o: In function `pci_bus_add_device':
> 	drivers/pci/bus.c:89: undefined reference to
> `pci_create_sysfs_dev_files' drivers/built-in.o: In function
> `pci_stop_dev': drivers/pci/remove.c:24: undefined reference to
> `pci_remove_sysfs_dev_files'
> 
> So do the minimal bit for now and figure out how to untangle it
> later.

Applied, thanks.

-- 
Jesse Barnes, Intel Open Source Technology Center
