From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the block tree with the pci tree
Date: Wed, 21 Jun 2017 12:58:07 +1000
Message-ID: <20170621125807.490bc780@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:33465 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1753108AbdFUC6K (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Tue, 20 Jun 2017 22:58:10 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Jens Axboe <axboe@kernel.dk>, Bjorn Helgaas <bhelgaas@google.com>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Christoph Hellwig <hch@lst.de>

Hi all,

Today's linux-next merge of the block tree got a conflict in:

  drivers/nvme/host/pci.c

between commit:

  c336cc0ee4eb ("PCI: Split ->reset_notify() method into ->reset_prepare() and ->reset_done()")

from the pci tree and commit:

  d86c4d8ef31b ("nvme: move reset workqueue handling to common code")

from the block tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

-- 
Cheers,
Stephen Rothwell

diff --cc drivers/nvme/host/pci.c
index 06f014d1a99a,0f09a2d5cf7a..000000000000
--- a/drivers/nvme/host/pci.c
+++ b/drivers/nvme/host/pci.c
@@@ -2150,14 -2281,14 +2281,15 @@@ static int nvme_probe(struct pci_dev *p
  	return result;
  }
  
 -static void nvme_reset_notify(struct pci_dev *pdev, bool prepare)
 +static void nvme_reset_prepare(struct pci_dev *pdev)
  {
 -	struct nvme_dev *dev = pci_get_drvdata(pdev);
 +	nvme_dev_disable(pci_get_drvdata(pdev), false);
 +}
  
 -	if (prepare)
 -		nvme_dev_disable(dev, false);
 -	else
 -		nvme_reset_ctrl(&dev->ctrl);
 +static void nvme_reset_done(struct pci_dev *pdev)
 +{
- 	nvme_reset(pci_get_drvdata(pdev));
++	struct nvme_dev *dev = pci_get_drvdata(pdev);
++	nvme_reset_ctrl(&dev->ctrl);
  }
  
  static void nvme_shutdown(struct pci_dev *pdev)
