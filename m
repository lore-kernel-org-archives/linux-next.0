From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the clk tree with the fsl tree
Date: Mon, 2 Nov 2015 01:35:22 +1100
Message-ID: <20151102013522.6ee46cd4@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:41355 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751895AbbKAOf0 (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Sun, 1 Nov 2015 09:35:26 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Mike Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>, Scott Wood <scottwood@freescale.com>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Javier Martinez Canillas <javier@osg.samsung.com>

Hi all,

Today's linux-next merge of the clk tree got a conflict in:

  drivers/clk/Kconfig

between commit:

  9e19ca2f627e ("clk: qoriq: Add ls2080a support.")

from the fsl tree and commit:

  4a7748c3d641 ("clk: Allow drivers to build if COMPILE_TEST is enabled")

from the clk tree.

I fixed it up (see below) and can carry the fix as necessary (no action
is required).

-- 
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au

diff --cc drivers/clk/Kconfig
index 67826167a0e0,57316528e924..000000000000
--- a/drivers/clk/Kconfig
+++ b/drivers/clk/Kconfig
@@@ -131,7 -132,7 +142,7 @@@ config COMMON_CLK_AXI_CLKGE
  
  config CLK_QORIQ
  	bool "Clock driver for Freescale QorIQ platforms"
- 	depends on (PPC_E500MC || ARM || ARM64) && OF
 -	depends on (PPC_E500MC || ARM || COMPILE_TEST) && OF
++	depends on (PPC_E500MC || ARM || ARM64 || COMPILE_TEST) && OF
  	---help---
  	  This adds the clock driver support for Freescale QorIQ platforms
  	  using common clock framework.
