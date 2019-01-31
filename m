From: "Michael S. Tsirkin" <mst@redhat.com>
Subject: Re: linux-next: manual merge of the vhost tree with the pci tree
Date: Thu, 31 Jan 2019 09:42:40 -0500
Message-ID: <20190131094203-mutt-send-email-mst@kernel.org>
References: <20190131134033.1ed0021d@canb.auug.org.au>
 <CAErSpo7y-PunYStmzvWvbfz-_CV0yoL2Pro3oC-+f47S3RPYAA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CAErSpo7y-PunYStmzvWvbfz-_CV0yoL2Pro3oC-+f47S3RPYAA@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Bjorn Helgaas <bhelgaas@google.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, linux-pci@vger.kernel.org
List-Id: linux-next.vger.kernel.org

On Thu, Jan 31, 2019 at 08:15:50AM -0600, Bjorn Helgaas wrote:
> On Wed, Jan 30, 2019 at 8:40 PM Stephen Rothwell <sfr@canb.auug.org.au> wrote:
> >
> > Hi all,
> >
> > Today's linux-next merge of the vhost tree got a conflict in:
> >
> >   drivers/pci/setup-bus.c
> >
> > between commit:
> >
> >   51c48b310183 ("PCI: Probe bridge window attributes once at enumeration-time")
> >
> > from the pci tree and commit:
> >
> >   955156f34e7d ("PCI: avoid bridge feature re-probing on hotplug")
> >
> > from the vhost tree.
> >
> > I fixed it up (hopefully - see below) and can carry the fix as
> > necessary. This is now fixed as far as linux-next is concerned, but any
> > non trivial conflicts should be mentioned to your upstream maintainer
> > when your tree is submitted for merging.  You may also want to consider
> > cooperating with the maintainer of the conflicting tree to minimise any
> > particularly complex conflicts.
> 
> 51c48b310183 and 955156f34e7d are both to solve the same problem, so I
> think the best resolution is to drop 955156f34e7d from the vhost tree
> completely.

Will do.

> The remaining wrinkle to work out is that we need a stable backport.
> 51c48b310183 is technically a little large for a stable backport, so I
> want to have a solid justification for it.  As soon as I get a
> kernel.org bugzilla with those details (who's affected by the
> breakage, what the failure looks like, how to reproduce it, etc), I'll
> add that URL and the stable tag.
> 
> Bjorn

OK.

> > diff --cc drivers/pci/setup-bus.c
> > index 1941bb0a6c13,d5c25d465d97..000000000000
> > --- a/drivers/pci/setup-bus.c
> > +++ b/drivers/pci/setup-bus.c
> > @@@ -735,17 -735,50 +735,26 @@@ int pci_claim_bridge_resource(struct pc
> >      base/limit registers must be read-only and read as 0. */
> >   static void pci_bridge_check_ranges(struct pci_bus *bus)
> >   {
> >  -      u16 io;
> >  -      u32 pmem;
> >         struct pci_dev *bridge = bus->self;
> >  -      struct resource *b_res;
> >  -
> >  -      b_res = &bridge->resource[PCI_BRIDGE_RESOURCES];
> >  +      struct resource *b_res = &bridge->resource[PCI_BRIDGE_RESOURCES];
> >
> > +       /*
> > +        * Don't re-check after this was called once already:
> > +        * important since bridge might be in use.
> > +        * Note: this is only reliable because as per spec all PCI to PCI
> > +        * bridges support memory unconditionally so IORESOURCE_MEM is set.
> > +        */
> > +       if (b_res[1].flags & IORESOURCE_MEM)
> > +               return;
> > +
> >         b_res[1].flags |= IORESOURCE_MEM;
> >
> >  -      pci_read_config_word(bridge, PCI_IO_BASE, &io);
> >  -      if (!io) {
> >  -              pci_write_config_word(bridge, PCI_IO_BASE, 0xe0f0);
> >  -              pci_read_config_word(bridge, PCI_IO_BASE, &io);
> >  -              pci_write_config_word(bridge, PCI_IO_BASE, 0x0);
> >  -      }
> >  -      if (io)
> >  +      if (bridge->io_window)
> >                 b_res[0].flags |= IORESOURCE_IO;
> >
> >  -      /*  DECchip 21050 pass 2 errata: the bridge may miss an address
> >  -          disconnect boundary by one PCI data phase.
> >  -          Workaround: do not use prefetching on this device. */
> >  -      if (bridge->vendor == PCI_VENDOR_ID_DEC && bridge->device == 0x0001)
> >  -              return;
> >  -
> >  -      pci_read_config_dword(bridge, PCI_PREF_MEMORY_BASE, &pmem);
> >  -      if (!pmem) {
> >  -              pci_write_config_dword(bridge, PCI_PREF_MEMORY_BASE,
> >  -                                             0xffe0fff0);
> >  -              pci_read_config_dword(bridge, PCI_PREF_MEMORY_BASE, &pmem);
> >  -              pci_write_config_dword(bridge, PCI_PREF_MEMORY_BASE, 0x0);
> >  -      }
> >  -      if (pmem) {
> >  +      if (bridge->pref_window) {
> >                 b_res[2].flags |= IORESOURCE_MEM | IORESOURCE_PREFETCH;
> >  -              if ((pmem & PCI_PREF_RANGE_TYPE_MASK) ==
> >  -                  PCI_PREF_RANGE_TYPE_64) {
> >  +              if (bridge->pref_64_window) {
> >                         b_res[2].flags |= IORESOURCE_MEM_64;
> >                         b_res[2].flags |= PCI_PREF_RANGE_TYPE_64;
> >                 }
