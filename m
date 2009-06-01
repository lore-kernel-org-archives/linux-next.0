From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the mtd tree with Linus' tree
Date: Mon, 1 Jun 2009 14:00:44 +1000
Message-ID: <20090601140044.4786a99f.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:48601 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1750790AbZFAEAw (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Mon, 1 Jun 2009 00:00:52 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: David Woodhouse <dwmw2@infradead.org>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Vladimir Barinov <vova.barinov@gmail.com>, Lothar Wassmann <LW@KARO-electronics.de>, Artem Bityutskiy <Artem.Bityutskiy@nokia.com>

Hi David,

Today's linux-next merge of the mtd tree got a conflict in
drivers/mtd/nand/mxc_nand.c between commit
8541c1180a355c4da283fc6b03a92c0233823c1b ("mtd: MXC NAND driver fixes
(v5)") from Linus' tree and commit
ccd93854d44710adaa02cecf0ef5f24ab383dd20 ("[MTD] Remove mtd->
{suspend,resume} calls from board drivers") from the mtd tree.

I fixed it up (see below) and can carry the fix for a while.
-- 
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au

diff --cc drivers/mtd/nand/mxc_nand.c
index 40c2608,65040de..0000000
--- a/drivers/mtd/nand/mxc_nand.c
+++ b/drivers/mtd/nand/mxc_nand.c
@@@ -1021,11 -1015,9 +1021,10 @@@ static int mxcnd_suspend(struct platfor
  	int ret = 0;
  
  	DEBUG(MTD_DEBUG_LEVEL0, "MXC_ND : NAND suspend\n");
 -
 -	/* Disable the NFC clock */
 -	clk_disable(nfc_clk);	/* FIXME */
 +	if (mtd) {
- 		ret = mtd->suspend(mtd);
 +		/* Disable the NFC clock */
 +		clk_disable(host->clk);
 +	}
  
  	return ret;
  }
@@@ -1038,12 -1028,8 +1037,11 @@@ static int mxcnd_resume(struct platform
  	int ret = 0;
  
  	DEBUG(MTD_DEBUG_LEVEL0, "MXC_ND : NAND resume\n");
 -	/* Enable the NFC clock */
 -	clk_enable(nfc_clk);	/* FIXME */
 +
 +	if (mtd) {
 +		/* Enable the NFC clock */
 +		clk_enable(host->clk);
- 		mtd->resume(mtd);
 +	}
  
  	return ret;
  }
