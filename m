From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the block tree with Linus' tree
Date: Wed, 13 Jan 2016 13:07:08 +1100
Message-ID: <20160113130708.3aa560ba@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from [103.22.144.67] ([103.22.144.67]:52356 "EHLO ozlabs.org"
	rhost-flags-FAIL-FAIL-OK-OK) by vger.kernel.org with ESMTP
	id S1753257AbcAMCIF (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Tue, 12 Jan 2016 21:08:05 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Jens Axboe <axboe@kernel.dk>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Christoph Hellwig <hch@lst.de>, Keith Busch <keith.busch@intel.com>

Hi Jens,

Today's linux-next merge of the block tree got a conflict in:

  drivers/nvme/host/Makefile

between commit:

  c4699e70d1db ("lightnvm: Simplify config when disabled")

from Linus' tree and commit:

  21d34711e1b5 ("nvme: split command submission helpers out of pci.c")

from the block tree.

I fixed it up (see below) and can carry the fix as necessary (no action
is required).

-- 
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au

diff --cc drivers/nvme/host/Makefile
index a5fe23952586,baf9f52bbfa5..000000000000
--- a/drivers/nvme/host/Makefile
+++ b/drivers/nvme/host/Makefile
@@@ -1,5 -1,5 +1,6 @@@
  
  obj-$(CONFIG_BLK_DEV_NVME)     += nvme.o
  
- lightnvm-$(CONFIG_NVM)	:= lightnvm.o
- nvme-y		+= pci.o scsi.o $(lightnvm-y)
 -nvme-y					+= core.o pci.o lightnvm.o
++lightnvm-$(CONFIG_NVM)			:= lightnvm.o
++nvme-y					+= core.o pci.o $(lightnvm-y)
+ nvme-$(CONFIG_BLK_DEV_NVME_SCSI)        += scsi.o
