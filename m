From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the staging tree with the l2-mtd tree
Date: Mon, 2 Nov 2015 00:35:53 +1100
Message-ID: <20151102003553.75b8236d@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:34201 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751270AbbKANf5 (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Sun, 1 Nov 2015 08:35:57 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Greg KH <greg@kroah.com>, Brian Norris <computersforpeace@gmail.com>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Boris BREZILLON <boris.brezillon@free-electrons.com>, Eva Rachel Retuya <eraretuya@gmail.com>

Hi Greg,

Today's linux-next merge of the staging tree got a conflict in:

  drivers/staging/mt29f_spinand/mt29f_spinand.c

between commit:

  45aaeff94719 ("mtd: nand: pass page number to ecc->write_xxx() methods")

from the l2-mtd tree and commits:

  74f63bd664b6 ("Staging: mt29f_spinand: Use preferred kernel types")
  92fdd777976e ("Staging: mt29f_spinand: Indent to match open parenthesis")

from the staging tree.

I fixed it up (see below) and can carry the fix as necessary (no action
is required).

-- 
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au

diff --cc drivers/staging/mt29f_spinand/mt29f_spinand.c
index b2e6237ae913,20a3f8eeb264..000000000000
--- a/drivers/staging/mt29f_spinand/mt29f_spinand.c
+++ b/drivers/staging/mt29f_spinand/mt29f_spinand.c
@@@ -612,10 -612,10 +612,10 @@@ static int spinand_erase_block(struct s
  
  #ifdef CONFIG_MTD_SPINAND_ONDIEECC
  static int spinand_write_page_hwecc(struct mtd_info *mtd,
- 		struct nand_chip *chip, const uint8_t *buf, int oob_required,
- 		int page)
+ 				    struct nand_chip *chip,
 -				    const u8 *buf, int oob_required)
++				    const u8 *buf, int oob_required, int page)
  {
- 	const uint8_t *p = buf;
+ 	const u8 *p = buf;
  	int eccsize = chip->ecc.size;
  	int eccsteps = chip->ecc.steps;
  
