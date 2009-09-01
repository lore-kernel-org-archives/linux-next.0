From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the pci tree with the powerpc tree
Date: Tue, 1 Sep 2009 12:05:02 +1000
Message-ID: <20090901120502.2b40b3b1.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:48510 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1750811AbZIACFJ (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Mon, 31 Aug 2009 22:05:09 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Jesse Barnes <jbarnes@virtuousgeek.org>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Mike Mason <mmlnx@us.ibm.com>, Richard Lary <rlary@us.ibm.com>, Grant Likely <grant.likely@secretlab.ca>, Benjamin Herrenschmidt <benh@kernel.crashing.org>, Paul Mackerras <paulus@samba.org>, linuxppc-dev@ozlabs.org

Hi Jesse,

Today's linux-next merge of the pci tree got a conflict in
arch/powerpc/kernel/pci_64.c between commit
fbe65447197789a3ccccc27755956f6a4c445089 ("powerpc/pci: move pci_64.c
device tree scanning code into pci-common.c") from the powerpc tree and
commit ced66a36d35607c60d18bb531527acd2083c0523 ("PCI/powerpc: support
PCIe fundamental reset") from the pci tree.

The former moved the code that is modified by the latter into another
file.  I fixed it up (see below) and can carry the fix as necessary.
-- 
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au

diff --git a/arch/powerpc/kernel/pci_of_scan.c b/arch/powerpc/kernel/pci_of_scan.c
index 72c31bc..7311fdf 100644
--- a/arch/powerpc/kernel/pci_of_scan.c
+++ b/arch/powerpc/kernel/pci_of_scan.c
@@ -139,6 +139,7 @@ struct pci_dev *of_create_pci_dev(struct device_node *node,
 	dev->dev.bus = &pci_bus_type;
 	dev->devfn = devfn;
 	dev->multifunction = 0;		/* maybe a lie? */
+	dev->needs_freset = 0;		/* pcie fundamental reset required */
 
 	dev->vendor = get_int_prop(node, "vendor-id", 0xffff);
 	dev->device = get_int_prop(node, "device-id", 0xffff);
