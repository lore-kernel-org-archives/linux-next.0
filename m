From: Olof Johansson <olof@lixom.net>
Subject: Re: linux-next: build failure after merge of the clk tree
Date: Thu, 13 Aug 2015 13:04:21 +0200
Message-ID: <20150813110421.GA21502@localhost>
References: <20150727141117.1153348e@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-lb0-f175.google.com ([209.85.217.175]:33857 "EHLO
	mail-lb0-f175.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752922AbbHMM2t (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Thu, 13 Aug 2015 08:28:49 -0400
Received: by lbbtg9 with SMTP id tg9so26260444lbb.1
        for <linux-next@vger.kernel.org>; Thu, 13 Aug 2015 05:28:47 -0700 (PDT)
Content-Disposition: inline
In-Reply-To: <20150727141117.1153348e@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Mike Turquette <mturquette@linaro.org>, Stephen Boyd <sboyd@codeaurora.org>, Tony Lindgren <tony@atomide.com>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Tero Kristo <t-kristo@ti.com>

On Mon, Jul 27, 2015 at 02:11:17PM +1000, Stephen Rothwell wrote:
> Hi all,
> 
> After merging the clk tree, today's linux-next build (arm
> multi_v7_defconfig) failed like this:
> 
> drivers/clk/ti/clk-814x.c:11:25: error: array type has incomplete element type
>  static struct ti_dt_clk dm814_clks[] = {
>                          ^
> drivers/clk/ti/clk-814x.c:12:2: error: implicit declaration of function 'DT_CLK' [-Werror=implicit-function-declaration]
>   DT_CLK(NULL, "devosc_ck", "devosc_ck"),
>   ^
> drivers/clk/ti/clk-814x.c:21:2: error: field name not in record or union initializer
>   { .node_name = NULL },
>   ^
> drivers/clk/ti/clk-814x.c:21:2: error: (near initialization for 'dm814_clks')
> drivers/clk/ti/clk-814x.c: In function 'dm814x_dt_clk_init':
> drivers/clk/ti/clk-814x.c:26:2: error: implicit declaration of function 'ti_dt_clocks_register' [-Werror=implicit-function-declaration]
>   ti_dt_clocks_register(dm814_clks);
>   ^
> drivers/clk/ti/clk-814x.c:28:2: error: implicit declaration of function 'omap2_clk_enable_init_clocks' [-Werror=implicit-function-declaration]
>   omap2_clk_enable_init_clocks(NULL, 0);
>   ^
> drivers/clk/ti/clk-814x.c: At top level:
> drivers/clk/ti/clk-814x.c:11:25: warning: 'dm814_clks' defined but not used [-Wunused-variable]
>  static struct ti_dt_clk dm814_clks[] = {
>                          ^
> 
> Caused by commit
> 
>   9cf705de06a2 ("ARM: OMAP2+: Add support for initializing dm814x clocks")
> 
> from the omap tree interacting with commit
> 
>   a3314e9cf69c ("clk: ti: move some public definitions to private header")
> 
> from the clk tree.
> 
> I have applied the following merge fix patch:
> 
> From: Stephen Rothwell <sfr@canb.auug.org.au>
> Date: Mon, 27 Jul 2015 14:07:23 +1000
> Subject: [PATCH] clk: ti: fix for definition movement
> 
> Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
> ---
>  drivers/clk/ti/clk-814x.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/drivers/clk/ti/clk-814x.c b/drivers/clk/ti/clk-814x.c
> index d490d427cc20..e172920798ea 100644
> --- a/drivers/clk/ti/clk-814x.c
> +++ b/drivers/clk/ti/clk-814x.c
> @@ -8,6 +8,8 @@
>  #include <linux/clk-provider.h>
>  #include <linux/clk/ti.h>
>  
> +#include "clock.h"
> +
>  static struct ti_dt_clk dm814_clks[] = {
>  	DT_CLK(NULL, "devosc_ck", "devosc_ck"),
>  	DT_CLK(NULL, "mpu_ck", "mpu_ck"),

Thanks, I've now applied this to the same branch where 9cf705de06a2 was merged.


-Olof
