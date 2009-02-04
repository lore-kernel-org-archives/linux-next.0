From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the trivial tree with the  tree
Date: Wed, 4 Feb 2009 17:59:05 +1100
Message-ID: <20090204175905.09624475.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:52110 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751239AbZBDG7K (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Wed, 4 Feb 2009 01:59:10 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Jiri Kosina <jkosina@suse.cz>
Cc: linux-next@vger.kernel.org, Nick Andrew <nick@nick-andrew.net>, Tejun Heo <tj@kernel.org>, Jeff Garzik <jgarzik@redhat.com>

Hi Jiri,

Today's linux-next merge of the trivial tree got a conflict in
include/linux/libata.h between commit
9062712fa9ed13b531dfc2228086650b8bd6a255 ("libata: implement
HORKAGE_1_5_GBPS and apply it to WD My Book") from the libata tree tree
and commit 71e75a63456e0bb39afcae3c28dd5e211fb2b637 ("trivial: Fix
misspelling of firmware") from the trivial tree.

Juts trivial context overlap.  I fixed it up (see below) and can carry
the fix as necessary.
-- 
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

diff --cc include/linux/libata.h
index 5d87bc0,2632f8e..0000000
--- a/include/linux/libata.h
+++ b/include/linux/libata.h
@@@ -379,8 -379,7 +379,8 @@@ enum 
  	ATA_HORKAGE_BRIDGE_OK	= (1 << 10),	/* no bridge limits */
  	ATA_HORKAGE_ATAPI_MOD16_DMA = (1 << 11), /* use ATAPI DMA for commands
  						    not multiple of 16 bytes */
- 	ATA_HORKAGE_FIRMWARE_WARN = (1 << 12),	/* firwmare update warning */
+ 	ATA_HORKAGE_FIRMWARE_WARN = (1 << 12),	/* firmware update warning */
 +	ATA_HORKAGE_1_5_GBPS	= (1 << 13),	/* force 1.5 Gbps */
  
  	 /* DMA mask for user DMA control: User visible values; DO NOT
  	    renumber */
