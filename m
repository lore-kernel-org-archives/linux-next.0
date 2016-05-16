From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the clk tree with the mips tree
Date: Mon, 16 May 2016 13:37:39 +1000
Message-ID: <20160516133739.5ba22a63@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:45196 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752137AbcEPDhm (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Sun, 15 May 2016 23:37:42 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Mike Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>, Ralf Baechle <ralf@linux-mips.org>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Neil Armstrong <narmstrong@baylibre.com>, Purna Chandra Mandal <purna.mandal@microchip.com>

Hi all,

Today's linux-next merge of the clk tree got a conflict in:

  drivers/clk/Kconfig

between commit:

  ce6e11884659 ("CLK: microchip: Add Microchip PIC32 clock driver.")

from the mips tree and commit:

  0bbd72b4c64f ("clk: Add Oxford Semiconductor OXNAS Standard Clocks")

from the clk tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

-- 
Cheers,
Stephen Rothwell

diff --cc drivers/clk/Kconfig
index 90518cd7fc9c,2dd371deb23b..000000000000
--- a/drivers/clk/Kconfig
+++ b/drivers/clk/Kconfig
@@@ -197,9 -197,12 +197,15 @@@ config COMMON_CLK_PX
  	---help---
  	  Support for the Marvell PXA SoC.
  
 +config COMMON_CLK_PIC32
 +	def_bool COMMON_CLK && MACH_PIC32
 +
+ config COMMON_CLK_OXNAS
+ 	bool "Clock driver for the OXNAS SoC Family"
+ 	select MFD_SYSCON
+ 	---help---
+ 	  Support for the OXNAS SoC Family clocks.
+ 
  source "drivers/clk/bcm/Kconfig"
  source "drivers/clk/hisilicon/Kconfig"
  source "drivers/clk/mvebu/Kconfig"
