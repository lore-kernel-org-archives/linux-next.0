From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build failure after merge of the sunxi tree
Date: Fri, 5 Feb 2016 10:14:12 +1100
Message-ID: <20160205101412.56e4631b@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:39676 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1757537AbcBDXOO (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Thu, 4 Feb 2016 18:14:14 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Maxime Ripard <maxime.ripard@free-electrons.com>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org

Hi Maxime,

After merging the sunxi tree, today's linux-next build (arm
multi_v7_defconfig) failed like this:

drivers/clk/sunxi/clk-sunxi.c: In function 'sunxi_mux_clk_setup':
drivers/clk/sunxi/clk-sunxi.c:712:2: warning: 'return' with no value, in function returning non-void [-Wreturn-type]
  return;
  ^
drivers/clk/sunxi/clk-sunxi.c:718:20: error: invalid storage class for function 'sun4i_cpu_clk_setup'
 static void __init sun4i_cpu_clk_setup(struct device_node *node)
                    ^
drivers/clk/sunxi/clk-sunxi.c:718:1: warning: ISO C90 forbids mixed declarations and code [-Wdeclaration-after-statement]
 static void __init sun4i_cpu_clk_setup(struct device_node *node)
 ^
In file included from include/linux/clk-provider.h:15:0,
                 from drivers/clk/sunxi/clk-sunxi.c:18:
include/linux/of.h:937:16: error: initializer element is not constant
        .data = (fn == (fn_type)NULL) ? fn : fn  }
                ^
include/linux/of.h:950:3: note: in expansion of macro '_OF_DECLARE'
   _OF_DECLARE(table, name, compat, fn, of_init_fn_1)
   ^

and on and on ...

Caused by commit

  1190461d5ad8 ("clk: sunxi: Remove clk_register_clkdev calls")

I have used the sunxi tree from next-20160204 for today.

-- 
Cheers,
Stephen Rothwell
