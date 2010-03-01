From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the mtd tree with the  tree
Date: Mon, 1 Mar 2010 14:52:38 +1100
Message-ID: <20100301145238.97ebb36c.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:49138 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751660Ab0CADwl (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Sun, 28 Feb 2010 22:52:41 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: David Woodhouse <dwmw2@infradead.org>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Magnus Damm <damm@opensource.se>

Hi David,

Today's linux-next merge of the mtd tree got a conflict in
drivers/mtd/nand/sh_flctl.c between commit
010ab820582d03bcd3648416b5837107e8a9c5f3 ("mtd: sh_flctl SHBUSSEL and
SEL_16BIT support") from Linus' tree and commit
5e81e88a4c140586d9212999cea683bcd66a15c6 ("mtd: nand: Allow caller to
pass alternative ID table to nand_scan_ident()") from the mtd tree.

Just context changes.  I fixed it up (see below) and can carry the fix as
necessary.
-- 
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au

diff --cc drivers/mtd/nand/sh_flctl.c
index 1842df8,dbc09a8..0000000
--- a/drivers/mtd/nand/sh_flctl.c
+++ b/drivers/mtd/nand/sh_flctl.c
@@@ -849,12 -825,7 +849,12 @@@ static int __devinit flctl_probe(struc
  	nand->select_chip = flctl_select_chip;
  	nand->cmdfunc = flctl_cmdfunc;
  
 +	if (pdata->flcmncr_val & SEL_16BIT) {
 +		nand->options |= NAND_BUSWIDTH_16;
 +		nand->read_word = flctl_read_word;
 +	}
 +
- 	ret = nand_scan_ident(flctl_mtd, 1);
+ 	ret = nand_scan_ident(flctl_mtd, 1, NULL);
  	if (ret)
  		goto err;
  
