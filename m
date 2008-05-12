From: David Miller <davem@davemloft.net>
Subject: Re: linux-next: build failure
Date: Mon, 12 May 2008 01:53:49 -0700 (PDT)
Message-ID: <20080512.015349.174504402.davem@davemloft.net>
References: <20080512.005454.31875425.davem@davemloft.net>
	<20080512180903.c512397f.sfr@canb.auug.org.au>
	<20080512181557.62cc3e36.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from 74-93-104-97-Washington.hfc.comcastbusiness.net ([74.93.104.97]:57986
	"EHLO sunset.davemloft.net" rhost-flags-OK-FAIL-OK-OK)
	by vger.kernel.org with ESMTP id S1754297AbYELIxz (ORCPT
	<rfc822;linux-next@vger.kernel.org>);
	Mon, 12 May 2008 04:53:55 -0400
In-Reply-To: <20080512181557.62cc3e36.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: sfr@canb.auug.org.au
Cc: greg@kroah.com, linux-next@vger.kernel.org, kay.sievers@vrfy.org

From: Stephen Rothwell <sfr@canb.auug.org.au>
Date: Mon, 12 May 2008 18:15:57 +1000

> Hi Dave,
> 
> On Mon, 12 May 2008 18:09:03 +1000 Stephen Rothwell <sfr@canb.auug.org.au> wrote:
> >
> > On Mon, 12 May 2008 00:54:54 -0700 (PDT) David Miller <davem@davemloft.net> wrote:
> > >
> > > There is identical code in arch/powerpc/kernel/pci_64.c, it doesn't
> > > break the build there becuase powerpc doesn't use -Werror (yet) :-)
> > 
> > OK, I will look for your fix and copy it over, thanks.
> 
> That should have had a smiley :-)

:-)  The fix is likely something like this:

diff --git a/arch/powerpc/kernel/pci_64.c b/arch/powerpc/kernel/pci_64.c
index 5275074..776703e 100644
--- a/arch/powerpc/kernel/pci_64.c
+++ b/arch/powerpc/kernel/pci_64.c
@@ -189,8 +189,8 @@ struct pci_dev *of_create_pci_dev(struct device_node *node,
 
 	dev->cfg_size = pci_cfg_space_size(dev);
 
-	sprintf(pci_name(dev), "%04x:%02x:%02x.%d", pci_domain_nr(bus),
-		dev->bus->number, PCI_SLOT(devfn), PCI_FUNC(devfn));
+	dev_set_name(&dev->dev, "%04x:%02x:%02x.%d", pci_domain_nr(bus),
+		     dev->bus->number, PCI_SLOT(devfn), PCI_FUNC(devfn));
 	dev->class = get_int_prop(node, "class-code", 0);
 	dev->revision = get_int_prop(node, "revision-id", 0);
 
diff --git a/arch/sparc64/kernel/pci.c b/arch/sparc64/kernel/pci.c
index 112b09f..bfc8c5d 100644
--- a/arch/sparc64/kernel/pci.c
+++ b/arch/sparc64/kernel/pci.c
@@ -408,8 +408,8 @@ struct pci_dev *of_create_pci_dev(struct pci_pbm_info *pbm,
 	dev->class = class >> 8;
 	dev->revision = class & 0xff;
 
-	sprintf(pci_name(dev), "%04x:%02x:%02x.%d", pci_domain_nr(bus),
-		dev->bus->number, PCI_SLOT(devfn), PCI_FUNC(devfn));
+	dev_set_name(&dev->dev, "%04x:%02x:%02x.%d", pci_domain_nr(bus),
+		     dev->bus->number, PCI_SLOT(devfn), PCI_FUNC(devfn));
 
 	if (ofpci_verbose)
 		printk("    class: 0x%x device name: %s\n",
