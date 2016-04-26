From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build failure after merge of the pci tree
Date: Tue, 26 Apr 2016 11:13:46 +1000
Message-ID: <20160426111346.5d47dc12@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:51206 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1750750AbcDZBNs (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Mon, 25 Apr 2016 21:13:48 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Bjorn Helgaas <bhelgaas@google.com>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Jacek Lawrynowicz <jacek.lawrynowicz@intel.com>, Joerg Roedel <jroedel@suse.de>

Hi Bjorn,

After merging the pci tree, today's linux-next build (x86_64 allmodconfig)
failed like this:

drivers/iommu/amd_iommu.c: In function 'get_alias':
drivers/iommu/amd_iommu.c:266:22: error: 'PCI_DEV_FLAGS_DMA_ALIAS_DEVFN' undeclared (first use in this function)
   pdev->dev_flags |= PCI_DEV_FLAGS_DMA_ALIAS_DEVFN;
                      ^
drivers/iommu/amd_iommu.c:266:22: note: each undeclared identifier is reported only once for each function it appears in
drivers/iommu/amd_iommu.c:267:7: error: 'struct pci_dev' has no member named 'dma_alias_devfn'  
   pdev->dma_alias_devfn = ivrs_alias & 0xff;
       ^

Caused by commit

  338c3149a221 ("PCI: Add support for multiple DMA aliases")

interacting with commit

  e3156048346c ("iommu/amd: Fix checking of pci dma aliases")

from Linus' tree (added before v4.6-rc5).

I added the following merge fix patch (which makes it build, but may need
more work):

From: Stephen Rothwell <sfr@canb.auug.org.au>
Date: Tue, 26 Apr 2016 11:07:25 +1000
Subject: [PATCH] iommu/amd: fix up for aliases API change

Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
---
 drivers/iommu/amd_iommu.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/iommu/amd_iommu.c b/drivers/iommu/amd_iommu.c
index 5efadad4615b..3839fd2865a6 100644
--- a/drivers/iommu/amd_iommu.c
+++ b/drivers/iommu/amd_iommu.c
@@ -263,8 +263,7 @@ static u16 get_alias(struct device *dev)
 	 */
 	if (pci_alias == devid &&
 	    PCI_BUS_NUM(ivrs_alias) == pdev->bus->number) {
-		pdev->dev_flags |= PCI_DEV_FLAGS_DMA_ALIAS_DEVFN;
-		pdev->dma_alias_devfn = ivrs_alias & 0xff;
+		pci_add_dma_alias(pdev, ivrs_alias & 0xff);
 		pr_info("AMD-Vi: Added PCI DMA alias %02x.%d for %s\n",
 			PCI_SLOT(ivrs_alias), PCI_FUNC(ivrs_alias),
 			dev_name(dev));
-- 
2.7.0

-- 
Cheers,
Stephen Rothwell
