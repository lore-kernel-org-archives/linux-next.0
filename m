From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the clk tree with the omap tree
Date: Mon, 27 Jul 2015 14:02:54 +1000
Message-ID: <20150727140254.1a61d721@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:44345 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1750703AbbG0EC4 (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Mon, 27 Jul 2015 00:02:56 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Mike Turquette <mturquette@linaro.org>, Stephen Boyd <sboyd@codeaurora.org>, Tony Lindgren <tony@atomide.com>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Tero Kristo <t-kristo@ti.com>

Hi all,

Today's linux-next merge of the clk tree got a conflict in:

  drivers/clk/ti/Makefile

between commit:

  9cf705de06a2 ("ARM: OMAP2+: Add support for initializing dm814x clocks")

from the omap tree and commit:

  0565fb168d63 ("clk: ti: dpll: move omap3 DPLL functionality to clock driver")

from the clk tree.

I fixed it up (see below) and can carry the fix as necessary (no action
is required).

-- 
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au

diff --cc drivers/clk/ti/Makefile
index 80b42884a0e9,9b93e6904359..000000000000
--- a/drivers/clk/ti/Makefile
+++ b/drivers/clk/ti/Makefile
@@@ -1,16 -1,19 +1,19 @@@
  obj-y					+= clk.o autoidle.o clockdomain.o
  clk-common				= dpll.o composite.o divider.o gate.o \
- 					  fixed-factor.o mux.o apll.o
- obj-$(CONFIG_SOC_AM33XX)		+= $(clk-common) clk-33xx.o
+ 					  fixed-factor.o mux.o apll.o \
+ 					  clkt_dpll.o clkt_iclk.o clkt_dflt.o
+ obj-$(CONFIG_SOC_AM33XX)		+= $(clk-common) clk-33xx.o dpll3xxx.o
 -obj-$(CONFIG_SOC_TI81XX)		+= $(clk-common) fapll.o clk-816x.o
 +obj-$(CONFIG_SOC_TI81XX)		+= $(clk-common) fapll.o clk-814x.o clk-816x.o
  obj-$(CONFIG_ARCH_OMAP2)		+= $(clk-common) interface.o clk-2xxx.o
  obj-$(CONFIG_ARCH_OMAP3)		+= $(clk-common) interface.o \
- 					   clk-3xxx.o
- obj-$(CONFIG_ARCH_OMAP4)		+= $(clk-common) clk-44xx.o
- obj-$(CONFIG_SOC_OMAP5)			+= $(clk-common) clk-54xx.o
+ 					   clk-3xxx.o dpll3xxx.o
+ obj-$(CONFIG_ARCH_OMAP4)		+= $(clk-common) clk-44xx.o \
+ 					   dpll3xxx.o dpll44xx.o
+ obj-$(CONFIG_SOC_OMAP5)			+= $(clk-common) clk-54xx.o \
+ 					   dpll3xxx.o dpll44xx.o
  obj-$(CONFIG_SOC_DRA7XX)		+= $(clk-common) clk-7xx.o \
- 					   clk-dra7-atl.o
- obj-$(CONFIG_SOC_AM43XX)		+= $(clk-common) clk-43xx.o
+ 					   clk-dra7-atl.o dpll3xxx.o dpll44xx.o
+ obj-$(CONFIG_SOC_AM43XX)		+= $(clk-common) dpll3xxx.o clk-43xx.o
  
  ifdef CONFIG_ATAGS
  obj-$(CONFIG_ARCH_OMAP3)                += clk-3xxx-legacy.o
