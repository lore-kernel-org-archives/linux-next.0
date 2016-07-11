From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the nvdimm tree with the block tree
Date: Mon, 11 Jul 2016 17:59:03 +1000
Message-ID: <20160711175903.2624fe5a@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:49900 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S933573AbcGKH7H (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Mon, 11 Jul 2016 03:59:07 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Dan Williams <dan.j.williams@intel.com>, Jens Axboe <axboe@kernel.dk>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org

Hi Dan,

Today's linux-next merge of the nvdimm tree got a conflict in:

  drivers/nvdimm/pmem.c

between commit:

  0d52c756a665 ("block: convert to device_add_disk()")

from the block tree and commit:

  f02716db951c ("libnvdimm: use devm_add_action_or_reset()")

from the nvdimm tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

-- 
Cheers,
Stephen Rothwell

diff --cc drivers/nvdimm/pmem.c
index 066e07d9330f,b6fcb97a601c..000000000000
--- a/drivers/nvdimm/pmem.c
+++ b/drivers/nvdimm/pmem.c
@@@ -303,7 -286,11 +285,11 @@@ static int pmem_attach_disk(struct devi
  		return -ENOMEM;
  	nvdimm_badblocks_populate(to_nd_region(dev->parent), &pmem->bb, res);
  	disk->bb = &pmem->bb;
 -	add_disk(disk);
 +	device_add_disk(dev, disk);
+ 
+ 	if (devm_add_action_or_reset(dev, pmem_release_disk, disk))
+ 		return -ENOMEM;
+ 
  	revalidate_disk(disk);
  
  	return 0;
