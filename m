From: Guenter Roeck <linux@roeck-us.net>
Subject: Re: linux-next: Tree for Jan 30 (clk related WARNING on arm)
Date: Fri, 30 Jan 2015 11:07:09 -0800
Message-ID: <20150130190709.GA13943@roeck-us.net>
References: <20150130180209.2bd86cc4@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from bh-25.webhostbox.net ([208.91.199.152]:39621 "EHLO
	bh-25.webhostbox.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752561AbbA3THV (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Fri, 30 Jan 2015 14:07:21 -0500
Received: from mailnull by bh-25.webhostbox.net with sa-checked (Exim 4.82)
	(envelope-from <linux@roeck-us.net>)
	id 1YHGuX-002inu-9R
	for linux-next@vger.kernel.org; Fri, 30 Jan 2015 19:07:21 +0000
Content-Disposition: inline
In-Reply-To: <20150130180209.2bd86cc4@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Tomeu Vizoso <tomeu.vizoso@collabora.com>

On Fri, Jan 30, 2015 at 06:02:09PM +1100, Stephen Rothwell wrote:
> Hi all,
> 
> Changes since 20150129:
> 
> The arm-soc gained conflicts against the arm-current and arm trees.
> 
> The spi tree gained a build failure for which I reverted a commit.
> 
> Non-merge commits (relative to Linus' tree): 6300
>  6348 files changed, 255117 insertions(+), 131620 deletions(-)
> 
> ----------------------------------------------------------------------------
> 
I see the following runtime warning repeatedly (with different call
paths to vexpress_osc_round_rate) with my qemu vexpress test.

Bisect points to commit cb75a8fcd14e71 ("clk: Add rate constraints to clocks").

Guenter

---
WARNING: CPU: 0 PID: 1 at drivers/clk/versatile/clk-vexpress-osc.c:47
vexpress_osc_round_rate+0x58/0x64()
Modules linked in:
CPU: 0 PID: 1 Comm: swapper/0 Not tainted 3.19.0-rc6-next-20150130 #1
Hardware name: ARM-Versatile Express
[<80014360>] (unwind_backtrace) from [<80011170>] (show_stack+0x10/0x14)
[<80011170>] (show_stack) from [<8047ae10>] (dump_stack+0x74/0x90)
[<8047ae10>] (dump_stack) from [<80022230>] (warn_slowpath_common+0x74/0xb0)
[<80022230>] (warn_slowpath_common) from [<80022288>] (warn_slowpath_null+0x1c/0x24)
[<80022288>] (warn_slowpath_null) from [<8039033c>] (vexpress_osc_round_rate+0x58/0x64)
[<8039033c>] (vexpress_osc_round_rate) from [<8038c7c8>] (clk_calc_new_rates+0x184/0x1f0)
[<8038c7c8>] (clk_calc_new_rates) from [<8038cd28>] (clk_core_set_rate_nolock+0x48/0xb0)
[<8038cd28>] (clk_core_set_rate_nolock) from [<8038dcc4>] (__clk_put+0x50/0xd8)
[<8038dcc4>] (__clk_put) from [<8026e7a0>] (amba_device_add+0x114/0x1d4)
[<8026e7a0>] (amba_device_add) from [<80387db0>] (of_platform_bus_create+0x220/0x2d4)
[<80387db0>] (of_platform_bus_create) from [<80387ec0>] (of_platform_populate+0x5c/0xac)
[<80387ec0>] (of_platform_populate) from [<805ff89c>] (customize_machine+0x30/0x40)
[<805ff89c>] (customize_machine) from [<80008904>] (do_one_initcall+0x80/0x1d0)
[<80008904>] (do_one_initcall) from [<805fde00>] (kernel_init_freeable+0x194/0x264)
[<805fde00>] (kernel_init_freeable) from [<80475eb4>] (kernel_init+0x8/0xe4)
[<80475eb4>] (kernel_init) from [<8000e680>] (ret_from_fork+0x14/0x34)

---
bisect log:

# bad: [827e3bdf1bb2401c1a1e5586eb3977d228d298b2] Add linux-next specific files for 20150130
# good: [26bc420b59a38e4e6685a73345a0def461136dce] Linux 3.19-rc6
git bisect start 'HEAD' 'v3.19-rc6'
# good: [1a34190dd8293cb0f7bae0a3986eade642ea5aff] Merge remote-tracking branch 'drm/drm-next'
git bisect good 1a34190dd8293cb0f7bae0a3986eade642ea5aff
# good: [3a32e801433db8fab0d3ae2254ae62ca2f1c7328] Merge remote-tracking branch 'tty/tty-next'
git bisect good 3a32e801433db8fab0d3ae2254ae62ca2f1c7328
# good: [817dd6b22c9862d0e9620d7bfe092d82886dbde7] Merge remote-tracking branch 'staging/staging-next'
git bisect good 817dd6b22c9862d0e9620d7bfe092d82886dbde7
# good: [8a4d1d643337044052b3c9e8db824d7b07748c25] ipc,sem: use current->state helpers
git bisect good 8a4d1d643337044052b3c9e8db824d7b07748c25
# good: [aad220f241ded9a6ff5141606d76e195cbaa304b] Merge remote-tracking branch 'pinctrl/for-next'
git bisect good aad220f241ded9a6ff5141606d76e195cbaa304b
# bad: [7903f1485864e817dd882c04244ddce051d17d92] Merge remote-tracking branch 'clk/clk-next'
git bisect bad 7903f1485864e817dd882c04244ddce051d17d92
# good: [59cf3fcf9bafe8fdb6183f13dafb81fc8213a8f9] clk: Make clk API return per-user struct clk instances
git bisect good 59cf3fcf9bafe8fdb6183f13dafb81fc8213a8f9
# good: [a0b66e3f5a2522d1a5cf1127bc8cba0834b0fbf6] gpio: ge: fix compilation error
git bisect good a0b66e3f5a2522d1a5cf1127bc8cba0834b0fbf6
# good: [257e10752c13f2698d53e5df1744f4d7e41fdfa7] gpio: mpc8xxx: Use of_mm_gpiochip_remove
git bisect good 257e10752c13f2698d53e5df1744f4d7e41fdfa7
# good: [82807bf973d3e8825c35220266dd17d05d19cef8] Merge remote-tracking branch 'pwm/for-next'
git bisect good 82807bf973d3e8825c35220266dd17d05d19cef8
# good: [4eb2440ed60fb5793f7aa6da89b3d517cc59de43] reservation: Remove shadowing local variable 'ret'
git bisect good 4eb2440ed60fb5793f7aa6da89b3d517cc59de43
# bad: [daaed1492a40ea28c36ccfec5ad7060a1b24116e] clkdev: Export clk_register_clkdev
git bisect bad daaed1492a40ea28c36ccfec5ad7060a1b24116e
# bad: [cb75a8fcd14e71c115decc416dd8d223e7c8b2e0] clk: Add rate constraints to clocks
git bisect bad cb75a8fcd14e71c115decc416dd8d223e7c8b2e0
# first bad commit: [cb75a8fcd14e71c115decc416dd8d223e7c8b2e0] clk: Add rate constraints to clocks
