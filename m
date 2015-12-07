From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the block tree with Linus' tree
Date: Mon, 7 Dec 2015 15:16:36 +1100
Message-ID: <20151207151636.0ef047f0@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:46340 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1755246AbbLGEQi (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Sun, 6 Dec 2015 23:16:38 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Jens Axboe <axboe@kernel.dk>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Keith Busch <keith.busch@intel.com>, Matias =?UTF-8?B?QmrDuHJsaW5n?= <m@bjorling.me>, Christoph Hellwig <hch@lst.de>

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
index a5fe23952586,3e26dc921c38..000000000000
--- a/drivers/nvme/host/Makefile
+++ b/drivers/nvme/host/Makefile
@@@ -1,5 -1,4 +1,5 @@@
  
  obj-$(CONFIG_BLK_DEV_NVME)     += nvme.o
  
 -nvme-y		+= core.o pci.o scsi.o lightnvm.o
 +lightnvm-$(CONFIG_NVM)	:= lightnvm.o
- nvme-y		+= pci.o scsi.o $(lightnvm-y)
++nvme-y		+= core.o pci.o scsi.o $(lightnvm-y)
