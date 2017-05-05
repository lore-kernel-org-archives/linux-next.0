From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the rdma tree with the pci tree
Date: Fri, 5 May 2017 10:19:10 +1000
Message-ID: <20170505101910.3f1b0194@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:49777 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1750742AbdEEATO (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Thu, 4 May 2017 20:19:14 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Doug Ledford <dledford@redhat.com>, Bjorn Helgaas <bhelgaas@google.com>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Christoph Hellwig <hch@lst.de>, "Michael J. Ruhl" <michael.j.ruhl@intel.com>

Hi Doug,

Today's linux-next merge of the rdma tree got a conflict in:

  drivers/infiniband/hw/hfi1/hfi.h

between commit:

  21c433a74b6b ("IB/hfi1: Use pcie_flr() instead of duplicating it")

from the pci tree and commit:

  f4cd87652919 ("IB/hfi1: Name function prototype parameters")

from the rdma tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

-- 
Cheers,
Stephen Rothwell

diff --cc drivers/infiniband/hw/hfi1/hfi.h
index 14063bd30c2a,509df984a09f..000000000000
--- a/drivers/infiniband/hw/hfi1/hfi.h
+++ b/drivers/infiniband/hw/hfi1/hfi.h
@@@ -1821,13 -1815,15 +1815,14 @@@ void hfi1_verbs_unregister_sysfs(struc
  /* Hook for sysfs read of QSFP */
  int qsfp_dump(struct hfi1_pportdata *ppd, char *buf, int len);
  
- int hfi1_pcie_init(struct pci_dev *, const struct pci_device_id *);
- void hfi1_pcie_cleanup(struct pci_dev *);
- int hfi1_pcie_ddinit(struct hfi1_devdata *, struct pci_dev *);
+ int hfi1_pcie_init(struct pci_dev *pdev, const struct pci_device_id *ent);
+ void hfi1_pcie_cleanup(struct pci_dev *pdev);
+ int hfi1_pcie_ddinit(struct hfi1_devdata *dd, struct pci_dev *pdev);
  void hfi1_pcie_ddcleanup(struct hfi1_devdata *);
- int pcie_speeds(struct hfi1_devdata *);
- void request_msix(struct hfi1_devdata *, u32 *, struct hfi1_msix_entry *);
- void hfi1_enable_intx(struct pci_dev *);
 -void hfi1_pcie_flr(struct hfi1_devdata *dd);
+ int pcie_speeds(struct hfi1_devdata *dd);
+ void request_msix(struct hfi1_devdata *dd, u32 *nent,
+ 		  struct hfi1_msix_entry *entry);
+ void hfi1_enable_intx(struct pci_dev *pdev);
  void restore_pci_variables(struct hfi1_devdata *dd);
  int do_pcie_gen3_transition(struct hfi1_devdata *dd);
  int parse_platform_config(struct hfi1_devdata *dd);
