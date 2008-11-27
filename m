From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the mtd tree
Date: Thu, 27 Nov 2008 15:15:48 +1100
Message-ID: <20081127151548.eb40da3c.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:60551 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752168AbYK0EQH (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Wed, 26 Nov 2008 23:16:07 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: David Woodhouse <dwmw2@infradead.org>
Cc: linux-next@vger.kernel.org, Atsushi Nemoto <anemo@mba.ocn.ne.jp>, Andrew Morton <akpm@linux-foundation.org>, Kay Sievers <kay.sievers@vrfy.org>, Greg KH <greg@kroah.com>

Hi David,

Today's linux-next merge of the mtd tree got a conflict in
drivers/mtd/maps/physmap.c between commit
a64cbdb4da5c8482929e7bc9c542e9757ad3e0f1 ("mtd: struct device - replace
bus_id with dev_name(), dev_set_name()") from the driver-core tree and
commit 3136e903fa2d493ebc1b8a8fbdde2d3a17f85acd ("[MTD] physmap: fix
memory leak on physmap_flash_remove by using devres") from the mtd tree.

I fixed it up (see below) and can carry it for a short while.

Dave, you should apply the patch from the driver-core tree (which was
cc:d to you) (and cope with the rejects :-)) and let Greg KH know when
you have.
-- 
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

diff --cc drivers/mtd/maps/physmap.c
index 8e2ee92,dfbf3f2..0000000
--- a/drivers/mtd/maps/physmap.c
+++ b/drivers/mtd/maps/physmap.c
@@@ -114,10 -105,10 +105,10 @@@ static int physmap_flash_probe(struct p
  		       (unsigned long long)(dev->resource[i].end - dev->resource[i].start + 1),
  		       (unsigned long long)dev->resource[i].start);
  
- 		info->res = request_mem_region(dev->resource[i].start,
- 					       dev->resource[i].end - dev->resource[i].start + 1,
- 					       dev_name(&dev->dev));
- 		if (info->res == NULL) {
+ 		if (!devm_request_mem_region(&dev->dev,
+ 			dev->resource[i].start,
+ 			dev->resource[i].end - dev->resource[i].start + 1,
 -			dev->dev.bus_id)) {
++			dev_name(&dev->dev))) {
  			dev_err(&dev->dev, "Could not reserve memory region\n");
  			err = -ENOMEM;
  			goto err_out;
