From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build failure after merge of the clk tree
Date: Mon, 27 Jul 2015 14:11:17 +1000
Message-ID: <20150727141117.1153348e@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:45289 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1750723AbbG0ELS (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Mon, 27 Jul 2015 00:11:18 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Mike Turquette <mturquette@linaro.org>, Stephen Boyd <sboyd@codeaurora.org>, Tony Lindgren <tony@atomide.com>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Tero Kristo <t-kristo@ti.com>

Hi all,

After merging the clk tree, today's linux-next build (arm
multi_v7_defconfig) failed like this:

drivers/clk/ti/clk-814x.c:11:25: error: array type has incomplete element type
 static struct ti_dt_clk dm814_clks[] = {
                         ^
drivers/clk/ti/clk-814x.c:12:2: error: implicit declaration of function 'DT_CLK' [-Werror=implicit-function-declaration]
  DT_CLK(NULL, "devosc_ck", "devosc_ck"),
  ^
drivers/clk/ti/clk-814x.c:21:2: error: field name not in record or union initializer
  { .node_name = NULL },
  ^
drivers/clk/ti/clk-814x.c:21:2: error: (near initialization for 'dm814_clks')
drivers/clk/ti/clk-814x.c: In function 'dm814x_dt_clk_init':
drivers/clk/ti/clk-814x.c:26:2: error: implicit declaration of function 'ti_dt_clocks_register' [-Werror=implicit-function-declaration]
  ti_dt_clocks_register(dm814_clks);
  ^
drivers/clk/ti/clk-814x.c:28:2: error: implicit declaration of function 'omap2_clk_enable_init_clocks' [-Werror=implicit-function-declaration]
  omap2_clk_enable_init_clocks(NULL, 0);
  ^
drivers/clk/ti/clk-814x.c: At top level:
drivers/clk/ti/clk-814x.c:11:25: warning: 'dm814_clks' defined but not used [-Wunused-variable]
 static struct ti_dt_clk dm814_clks[] = {
                         ^

Caused by commit

  9cf705de06a2 ("ARM: OMAP2+: Add support for initializing dm814x clocks")

from the omap tree interacting with commit

  a3314e9cf69c ("clk: ti: move some public definitions to private header")

from the clk tree.

I have applied the following merge fix patch:

From: Stephen Rothwell <sfr@canb.auug.org.au>
Date: Mon, 27 Jul 2015 14:07:23 +1000
Subject: [PATCH] clk: ti: fix for definition movement

Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
---
 drivers/clk/ti/clk-814x.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/clk/ti/clk-814x.c b/drivers/clk/ti/clk-814x.c
index d490d427cc20..e172920798ea 100644
--- a/drivers/clk/ti/clk-814x.c
+++ b/drivers/clk/ti/clk-814x.c
@@ -8,6 +8,8 @@
 #include <linux/clk-provider.h>
 #include <linux/clk/ti.h>
 
+#include "clock.h"
+
 static struct ti_dt_clk dm814_clks[] = {
 	DT_CLK(NULL, "devosc_ck", "devosc_ck"),
 	DT_CLK(NULL, "mpu_ck", "mpu_ck"),
-- 
2.4.6

-- 
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
