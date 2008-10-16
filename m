From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the pci tree
Date: Thu, 16 Oct 2008 14:24:18 +1100
Message-ID: <20081016142418.c94967d8.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:35627 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752306AbYJPDuj (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Wed, 15 Oct 2008 23:50:39 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Jesse Barnes <jbarnes@virtuousgeek.org>
Cc: linux-next@vger.kernel.org, Vincent Legoll <vincent.legoll@gmail.com>, Sitsofe Wheeler <sitsofe@yahoo.com>

Hi Jesse,

Today's linux-next merge of the pci tree got a conflict in
drivers/pci/pcie/aspm.c between commit
e1f4f59d1ab9ebac44830d6ae450fb358ac559d3 ("PCI: Fix pcie_aspm=force")
from Linus' tree and commit 4f56ffe4ff214284f9c92037f9ad5f389a74bb84
("PCI: probing debug message uniformization") from the pci tree.

Just context.  I fixed it up (see below).
-- 
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

diff --cc drivers/pci/pcie/aspm.c
index 851f5b8,4b18b30..0000000
--- a/drivers/pci/pcie/aspm.c
+++ b/drivers/pci/pcie/aspm.c
@@@ -527,10 -527,10 +527,10 @@@ static int pcie_aspm_sanity_check(struc
  		 */
  		pci_read_config_dword(child_dev, child_pos + PCI_EXP_DEVCAP,
  			&reg32);
 -		if (!(reg32 & PCI_EXP_DEVCAP_RBER && !aspm_force)) {
 +		if (!(reg32 & PCI_EXP_DEVCAP_RBER) && !aspm_force) {
- 			printk("Pre-1.1 PCIe device detected, "
- 				"disable ASPM for %s. It can be enabled forcedly"
- 				" with 'pcie_aspm=force'\n", pci_name(pdev));
+ 			dev_printk(KERN_INFO, &child_dev->dev, "disabling ASPM"
+ 				" on pre-1.1 PCIe device.  You can enable it"
+ 				" with 'pcie_aspm=force'\n");
  			return -EINVAL;
  		}
  	}
