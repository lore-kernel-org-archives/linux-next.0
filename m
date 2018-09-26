From: Keith Busch <keith.busch@intel.com>
Subject: Re: linux-next: build failure after merge of the pci tree
Date: Wed, 26 Sep 2018 08:58:21 -0600
Message-ID: <20180926145820.GA14688@localhost.localdomain>
References: <20180926150051.6ee97aae@canb.auug.org.au>
 <20180926142540.GB14407@localhost.localdomain>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20180926142540.GB14407@localhost.localdomain>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Bjorn Helgaas <bhelgaas@google.com>, Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
List-Id: linux-next.vger.kernel.org

On Wed, Sep 26, 2018 at 08:25:40AM -0600, Keith Busch wrote:
> On Wed, Sep 26, 2018 at 03:00:51PM +1000, Stephen Rothwell wrote:
> > Hi Bjorn,
> > 
> > After merging the pci tree, today's linux-next build (powerpc allnoconfig)
> > failed like this:
> > 
> > ld: drivers/pci/pci.o: in function `pci_bus_error_reset':
> > pci.c:(.text+0x5fba): undefined reference to `pci_slot_mutex'
> > ld: pci.c:(.text+0x5fc2): undefined reference to `pci_slot_mutex'
> > 
> > Caused by commit
> > 
> >   131b0ca2c7b2 ("PCI/ERR: Use slot reset if available")
> > 
> > I have applied the following hack for today (there is probably a better
> > way):
> 
> Thanks for the notice. Does this mean you don't have CONFIG_SYSFS? I
> must admit I missed that connection for building slot.c.
> 
>  
> > From: Stephen Rothwell <sfr@canb.auug.org.au>
> > Date: Wed, 26 Sep 2018 14:55:37 +1000
> > Subject: [PATCH] pci: move pci_slot_mutex so it is available where needed
> > 
> > Fixes: 131b0ca2c7b2 ("PCI/ERR: Use slot reset if available")
> > Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
> > ---
> >  drivers/pci/pci.c  | 2 ++
> >  drivers/pci/slot.c | 1 -
> >  2 files changed, 2 insertions(+), 1 deletion(-)
> > 
> > diff --git a/drivers/pci/pci.c b/drivers/pci/pci.c
> > index 8c1e99a637d8..1fa67db6b21e 100644
> > --- a/drivers/pci/pci.c
> > +++ b/drivers/pci/pci.c
> > @@ -5190,6 +5190,8 @@ static int pci_bus_reset(struct pci_bus *bus, int probe)
> >  	return ret;
> >  }
> >  
> > +DEFINE_MUTEX(pci_slot_mutex);
> > +
> >  /**
> >   * pci_bus_error_reset - reset the bridge's subordinate bus
> >   * @bridge: The parent device that connects to the bus to reset
> > diff --git a/drivers/pci/slot.c b/drivers/pci/slot.c
> > index 3da03fcc6fbf..c46d5e1ff536 100644
> > --- a/drivers/pci/slot.c
> > +++ b/drivers/pci/slot.c
> > @@ -14,7 +14,6 @@
> >  
> >  struct kset *pci_slots_kset;
> >  EXPORT_SYMBOL_GPL(pci_slots_kset);
> > -DEFINE_MUTEX(pci_slot_mutex);
> >  
> >  static ssize_t pci_slot_attr_show(struct kobject *kobj,
> >  					struct attribute *attr, char *buf)
> > -- 
> > 2.18.0

There's unfortunately second bug here when there are no slots, which
would be the case without CONFIG_SYSFS: the slot list is empty, and the
function just returned success, but it should have gone to the default
secondary bus reset behavior in that case. I'll send a patch shortly.
