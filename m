From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the samsung-krzk tree with the omap
 tree
Date: Thu, 3 Mar 2016 09:16:31 +1100
Message-ID: <20160303091631.1ef24e87@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:56919 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1753536AbcCBWQe (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Wed, 2 Mar 2016 17:16:34 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Krzysztof Kozlowski <k.kozlowski@samsung.com>, Tony Lindgren <tony@atomide.com>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Michael Turquette <mturquette@baylibre.com>, James Liao <jamesjj.liao@mediatek.com>, Stephen Boyd <sboyd@codeaurora.org>

Hi Krzysztof,

Today's linux-next merge of the samsung-krzk tree got a conflict in:

  drivers/clk/Kconfig

between commit:

  21330497f303 ("clk: ti: Add support for dm814x ADPLL")

from the omap tree and commit:

  b9e65ebc654d ("clk: Move vendor's Kconfig into CCF menu section")

from the samsung-krzk tree.

I fixed it up (see below) and can carry the fix as necessary (no action
is required).

-- 
Cheers,
Stephen Rothwell

diff --cc drivers/clk/Kconfig
index 5bf16ccc010b,de707b2bfb73..000000000000
--- a/drivers/clk/Kconfig
+++ b/drivers/clk/Kconfig
@@@ -202,12 -202,9 +202,10 @@@ config COMMON_CLK_CDCE70
  
  source "drivers/clk/bcm/Kconfig"
  source "drivers/clk/hisilicon/Kconfig"
+ source "drivers/clk/mvebu/Kconfig"
  source "drivers/clk/qcom/Kconfig"
+ source "drivers/clk/samsung/Kconfig"
+ source "drivers/clk/tegra/Kconfig"
 +source "drivers/clk/ti/Kconfig"
  
  endmenu
- 
- source "drivers/clk/mvebu/Kconfig"
- 
- source "drivers/clk/samsung/Kconfig"
- source "drivers/clk/tegra/Kconfig"
