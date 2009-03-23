From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the mtd tree with the sh tree
Date: Mon, 23 Mar 2009 15:37:07 +1100
Message-ID: <20090323153707.9b32d086.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:51726 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1750774AbZCWEhN (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Mon, 23 Mar 2009 00:37:13 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: David Woodhouse <dwmw2@infradead.org>
Cc: linux-next@vger.kernel.org, Adrian McMenamin <adrian@newgolddream.dyndns.info>, Paul Mundt <lethal@linux-sh.org>, Atsushi Nemoto <anemo@mba.ocn.ne.jp>

Hi David,

Today's linux-next merge of the mtd tree got a conflict in
drivers/mtd/maps/Makefile between commit
47a72688fae7298e1ad5fdc9bff7e04b6a549620 ("mtd: flash mapping support for
Dreamcast VMU") from the sh tree and commit
610f75e74b636f933bc3e379a88a10f883b91332 ("[MTD] RBTX4939 map driver")
from the mtd tree.

Just overlapping additions.  I fixed it up (see below) and can carry the
fix as necessary.
-- 
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

diff --cc drivers/mtd/maps/Makefile
index 26b28a7,f53a7dc..0000000
--- a/drivers/mtd/maps/Makefile
+++ b/drivers/mtd/maps/Makefile
@@@ -61,4 -61,4 +61,5 @@@ obj-$(CONFIG_MTD_PLATRAM)	+= plat-ram.
  obj-$(CONFIG_MTD_OMAP_NOR)	+= omap_nor.o
  obj-$(CONFIG_MTD_INTEL_VR_NOR)	+= intel_vr_nor.o
  obj-$(CONFIG_MTD_BFIN_ASYNC)	+= bfin-async-flash.o
 +obj-$(CONFIG_MTD_VMU)		+= vmu-flash.o
+ obj-$(CONFIG_MTD_RBTX4939)	+= rbtx4939-flash.o
