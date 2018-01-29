From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the pci tree with the powerpc tree
Date: Mon, 29 Jan 2018 11:36:04 +1100
Message-ID: <20180129113604.015da99d@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:51773 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1752946AbeA2AgO (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Sun, 28 Jan 2018 19:36:14 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Bjorn Helgaas <bhelgaas@google.com>, Michael Ellerman <mpe@ellerman.id.au>, Benjamin Herrenschmidt <benh@kernel.crashing.org>, PowerPC <linuxppc-dev@lists.ozlabs.org>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, "Bryant G. Ly" <bryantly@linux.vnet.ibm.com>

Hi Bjorn,

Today's linux-next merge of the pci tree got a conflict in:

  arch/powerpc/platforms/powernv/eeh-powernv.c

between commit:

  64ba3dc7bf7c ("powerpc/eeh: Update VF config space after EEH")

from the powerpc tree and commit:

  fdabc3fe9982 ("PCI: Add #defines for Completion Timeout Disable feature")

from the pci tree.

The former commit moved the code changed by the latter to another file.
I have added the following merge fix patch:

From: Stephen Rothwell <sfr@canb.auug.org.au>
Date: Mon, 29 Jan 2018 11:33:24 +1100
Subject: [PATCH] PCI: fix up for "powerpc/eeh: Update VF config space after EEH"

Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
---
 arch/powerpc/kernel/eeh.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/powerpc/kernel/eeh.c b/arch/powerpc/kernel/eeh.c
index cc649809885e..2b9df0040d6b 100644
--- a/arch/powerpc/kernel/eeh.c
+++ b/arch/powerpc/kernel/eeh.c
@@ -756,14 +756,14 @@ int eeh_restore_vf_config(struct pci_dn *pdn)
 		eeh_ops->write_config(pdn, edev->pcie_cap + PCI_EXP_DEVCTL,
 				      2, devctl);
 
-		/* Disable Completion Timeout */
+		/* Disable Completion Timeout if possible */
 		eeh_ops->read_config(pdn, edev->pcie_cap + PCI_EXP_DEVCAP2,
 				     4, &cap2);
-		if (cap2 & 0x10) {
+		if (cap2 & PCI_EXP_DEVCAP2_COMP_TMOUT_DIS) {
 			eeh_ops->read_config(pdn,
 					     edev->pcie_cap + PCI_EXP_DEVCTL2,
 					     4, &cap2);
-			cap2 |= 0x10;
+			cap2 |= PCI_EXP_DEVCTL2_COMP_TMOUT_DIS;
 			eeh_ops->write_config(pdn,
 					      edev->pcie_cap + PCI_EXP_DEVCTL2,
 					      4, cap2);
-- 
2.15.1


I fixed it up (see above) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

-- 
Cheers,
Stephen Rothwell
