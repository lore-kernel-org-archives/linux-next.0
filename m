From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build failure after merge of the clk tree
Date: Mon, 5 Jun 2017 10:14:44 +1000
Message-ID: <20170605101444.0d89b151@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:49101 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1751161AbdFEAOr (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Sun, 4 Jun 2017 20:14:47 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Mike Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>

Hi all,

After merging the clk tree, today's linux-next build (arm
multi_v7_defconfig) failed like this:

drivers/clk/at91/clk-generated.c: In function 'at91_clk_register_generated':
drivers/clk/at91/clk-generated.c:273:20: error: invalid storage class for function 'of_sama5d2_clk_generated_setup'
 static void __init of_sama5d2_clk_generated_setup(struct device_node *np)
                    ^
drivers/clk/at91/clk-generated.c:273:1: warning: ISO C90 forbids mixed declarations and code [-Wdeclaration-after-statement]
 static void __init of_sama5d2_clk_generated_setup(struct device_node *np)
 ^
In file included from include/linux/clk-provider.h:15:0,
                 from drivers/clk/at91/clk-generated.c:14:
include/linux/of.h:1132:16: error: initializer element is not constant
        .data = (fn == (fn_type)NULL) ? fn : fn  }
                ^
include/linux/of.h:1146:3: note: in expansion of macro '_OF_DECLARE'
   _OF_DECLARE(table, name, compat, fn, of_init_fn_1)
   ^
include/linux/clk-provider.h:791:42: note: in expansion of macro 'OF_DECLARE_1'
 #define CLK_OF_DECLARE(name, compat, fn) OF_DECLARE_1(clk, name, compat, fn)
                                          ^
drivers/clk/at91/clk-generated.c:321:1: note: in expansion of macro 'CLK_OF_DECLARE'
 CLK_OF_DECLARE(of_sama5d2_clk_generated_setup, "atmel,sama5d2-clk-generated",
 ^
include/linux/of.h:1132:16: note: (near initialization for '__of_table_of_sama5d2_clk_generated_setup.data')
        .data = (fn == (fn_type)NULL) ? fn : fn  }
                ^
include/linux/of.h:1146:3: note: in expansion of macro '_OF_DECLARE'
   _OF_DECLARE(table, name, compat, fn, of_init_fn_1)
   ^
include/linux/clk-provider.h:791:42: note: in expansion of macro 'OF_DECLARE_1'
 #define CLK_OF_DECLARE(name, compat, fn) OF_DECLARE_1(clk, name, compat, fn)
                                          ^
drivers/clk/at91/clk-generated.c:321:1: note: in expansion of macro 'CLK_OF_DECLARE'
 CLK_OF_DECLARE(of_sama5d2_clk_generated_setup, "atmel,sama5d2-clk-generated",
 ^
include/linux/of.h:1129:22: error: expected declaration or statement at end of input
  static const struct of_device_id __of_table_##name  \
                      ^
include/linux/of.h:1146:3: note: in expansion of macro '_OF_DECLARE'
   _OF_DECLARE(table, name, compat, fn, of_init_fn_1)
   ^
include/linux/clk-provider.h:791:42: note: in expansion of macro 'OF_DECLARE_1'
 #define CLK_OF_DECLARE(name, compat, fn) OF_DECLARE_1(clk, name, compat, fn)
                                          ^
drivers/clk/at91/clk-generated.c:321:1: note: in expansion of macro 'CLK_OF_DECLARE'
 CLK_OF_DECLARE(of_sama5d2_clk_generated_setup, "atmel,sama5d2-clk-generated",
 ^

Caused by commit

  8e56133e5c7b ("clk: at91: fix clk-generated parenting")

A closing brace was lost ...

I have used the clk tree from next-20170602 for today.
-- 
Cheers,
Stephen Rothwell
