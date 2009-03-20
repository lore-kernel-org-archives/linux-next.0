From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the watchdog tree with the arm tree
Date: Fri, 20 Mar 2009 13:58:49 +1100
Message-ID: <20090320135849.8f71cdbc.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:33623 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751689AbZCTC6z (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Thu, 19 Mar 2009 22:58:55 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Wim Van Sebroeck <wim@iguana.be>
Cc: linux-next@vger.kernel.org, Russell King <rmk@arm.linux.org.uk>

Hi Wim,

Today's linux-next merge of the watchdog tree got a conflict in
drivers/watchdog/omap_wdt.c between commit
39a80c7f379e1c1d3e63b204b8353b7381d0a3d5 ("[ARM] omap: watchdog: convert
clocks to match by devid and conid") from the arm tree and commit
47efb2337f6f450c995712762c0bcf6ce073171f ("[WATCHDOG] More coding-style
and trivial clean-up") from the watchdog tree.

I fixed it up (see below) and can carry the fix as necessary.
-- 
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

diff --cc drivers/watchdog/omap_wdt.c
index aa5ad6e,0b86ef1..0000000
--- a/drivers/watchdog/omap_wdt.c
+++ b/drivers/watchdog/omap_wdt.c
@@@ -145,8 -146,13 +145,8 @@@ static int omap_wdt_open(struct inode *
  	if (test_and_set_bit(1, (unsigned long *)&(wdev->omap_wdt_users)))
  		return -EBUSY;
  
- 	clk_enable(wdev->ick);    /* Enable the interface clock */
- 	clk_enable(wdev->fck);    /* Enable the functional clock */
 -	if (cpu_is_omap16xx())
 -		clk_enable(wdev->armwdt_ck);	/* Enable the clock */
 -
 -	if (cpu_is_omap24xx() || cpu_is_omap34xx()) {
 -		clk_enable(wdev->mpu_wdt_ick); /* Enable the interface clock */
 -		clk_enable(wdev->mpu_wdt_fck); /* Enable the functional clock */
 -	}
++	clk_enable(wdev->ick);	/* Enable the interface clock */
++	clk_enable(wdev->fck);	/* Enable the functional clock */
  
  	/* initialize prescaler */
  	while (__raw_readl(base + OMAP_WATCHDOG_WPS) & 0x01)
