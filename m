From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the clk tree with the arm-soc tree
Date: Tue, 1 Mar 2016 14:57:00 +1100
Message-ID: <20160301145700.784f5fcf@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:56833 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1750849AbcCAD5C (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Mon, 29 Feb 2016 22:57:02 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Mike Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>, Olof Johansson <olof@lixom.net>, Arnd Bergmann <arnd@arndb.de>, linux-arm-kernel@lists.infradead.org
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Alexandre Belloni <alexandre.belloni@free-electrons.com>

Hi all,

Today's linux-next merge of the clk tree got a conflict in:

  drivers/clk/at91/clk-main.c

between commit:

  99a81706526f ("clk: at91: remove IRQ handling and use polling")

from the arm-soc tree and commit:

  8c1b1e54faed ("clk: at91: Remove impossible checks for of_clk_get_parent_count()")

from the clk tree.

I fixed it up (see below) and can carry the fix as necessary (no action
is required).

-- 
Cheers,
Stephen Rothwell

diff --cc drivers/clk/at91/clk-main.c
index 4bfc94d6c26e,b85f43529396..000000000000
--- a/drivers/clk/at91/clk-main.c
+++ b/drivers/clk/at91/clk-main.c
@@@ -572,12 -611,12 +572,12 @@@ static void __init of_at91sam9x5_clk_ma
  {
  	struct clk *clk;
  	const char *parent_names[2];
- 	int num_parents;
+ 	unsigned int num_parents;
 -	unsigned int irq;
  	const char *name = np->name;
 +	struct regmap *regmap;
  
  	num_parents = of_clk_get_parent_count(np);
- 	if (num_parents <= 0 || num_parents > 2)
+ 	if (num_parents == 0 || num_parents > 2)
  		return;
  
  	of_clk_parent_fill(np, parent_names, num_parents);
