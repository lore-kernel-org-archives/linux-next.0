From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: linux-next: manual merge of the clk tree with the arm-soc tree
Date: Tue, 1 Mar 2016 15:00:54 +1100
Message-ID: <20160301150054.2cb0e728@canb.auug.org.au>
References: <20160301145700.784f5fcf@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:33401 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1750849AbcCAEA4 (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Mon, 29 Feb 2016 23:00:56 -0500
In-Reply-To: <20160301145700.784f5fcf@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Mike Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>, Olof Johansson <olof@lixom.net>, Arnd Bergmann <arnd@arndb.de>, linux-arm-kernel@lists.infradead.org
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Alexandre Belloni <alexandre.belloni@free-electrons.com>

Hi all,

On Tue, 1 Mar 2016 14:57:00 +1100 Stephen Rothwell <sfr@canb.auug.org.au> wrote:
>
> Today's linux-next merge of the clk tree got a conflict in:
> 
>   drivers/clk/at91/clk-main.c
> 
> between commit:
> 
>   99a81706526f ("clk: at91: remove IRQ handling and use polling")
> 
> from the arm-soc tree and commit:
> 
>   8c1b1e54faed ("clk: at91: Remove impossible checks for of_clk_get_parent_count()")
> 
> from the clk tree.

And the same for drivers/clk/at91/clk-master.c

-- 
Cheers,
Stephen Rothwell

diff --cc drivers/clk/at91/clk-master.c
index 7d4a1864ea7c,016fe110b5ba..000000000000
--- a/drivers/clk/at91/clk-master.c
+++ b/drivers/clk/at91/clk-master.c
@@@ -199,14 -221,14 +199,14 @@@ of_at91_clk_master_setup(struct device_
  			 const struct clk_master_layout *layout)
  {
  	struct clk *clk;
- 	int num_parents;
+ 	unsigned int num_parents;
 -	unsigned int irq;
  	const char *parent_names[MASTER_SOURCE_MAX];
  	const char *name = np->name;
  	struct clk_master_characteristics *characteristics;
 +	struct regmap *regmap;
  
  	num_parents = of_clk_get_parent_count(np);
- 	if (num_parents <= 0 || num_parents > MASTER_SOURCE_MAX)
+ 	if (num_parents == 0 || num_parents > MASTER_SOURCE_MAX)
  		return;
  
  	of_clk_parent_fill(np, parent_names, num_parents);
