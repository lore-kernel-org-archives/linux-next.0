From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the pci tree
Date: Thu, 3 Jul 2008 12:10:55 +1000
Message-ID: <20080703121055.d6f49ae5.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:41081 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752633AbYGCCLA (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Wed, 2 Jul 2008 22:11:00 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Jesse Barnes <jbarnes@virtuousgeek.org>
Cc: linux-next@vger.kernel.org, David Howells <dhowells@redhat.com>, Greg KH <greg@kroah.com>

Hi Jesse,

Today's linux-next merge of the pci tree got a conflict in  between
commit 4433d5ff973e2c1ea2f923eea8935588e7b96c06 ("PCI: handle pci_name()
being const") from the driver-core tree and commit
8b285ce84bbc719e363a796f466404576b840d36 ("PCI: fix pci_setup_device()'s
sprinting into a const buffer") from the pci tree.

Jesse, since dev_set_name is now in mainline, you really should drop this
commit and replace it with the one from the driver-core tree (which Greg
has hopefully sent you by now).  Or add the equivalent on top of what you
have.

I have appended it below in case.

-- 
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

commit 4433d5ff973e2c1ea2f923eea8935588e7b96c06
Author: Greg Kroah-Hartman <gregkh@suse.de>
Date:   Wed Jul 2 12:46:22 2008 -0700

    PCI: handle pci_name() being const
    
    This changes pci_setup_device to handle pci_name() now returning a
    constant string.
    
    Cc: Jesse Barns <jbarnes@virtuousgeek.org>
    Signed-off-by: Greg Kroah-Hartman <gregkh@suse.de>

diff --git a/drivers/pci/probe.c b/drivers/pci/probe.c
index 3706ce7..0e0e030 100644
--- a/drivers/pci/probe.c
+++ b/drivers/pci/probe.c
@@ -711,8 +711,9 @@ static int pci_setup_device(struct pci_dev * dev)
 {
 	u32 class;
 
-	sprintf(pci_name(dev), "%04x:%02x:%02x.%d", pci_domain_nr(dev->bus),
-		dev->bus->number, PCI_SLOT(dev->devfn), PCI_FUNC(dev->devfn));
+	dev_set_name(&dev->dev, "%04x:%02x:%02x.%d", pci_domain_nr(dev->bus),
+		     dev->bus->number, PCI_SLOT(dev->devfn),
+		     PCI_FUNC(dev->devfn));
 
 	pci_read_config_dword(dev, PCI_CLASS_REVISION, &class);
 	dev->revision = class & 0xff;
