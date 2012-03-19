From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: linux-next: build warning after merge of the arm-soc tree
Date: Mon, 19 Mar 2012 09:40:01 +0000
Message-ID: <201203190940.02329.arnd@arndb.de>
References: <20120319183911.0cd46df560c714ee71184242@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: Text/Plain;
  charset="iso-8859-15"
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from moutng.kundenserver.de ([212.227.17.9]:56541 "EHLO
	moutng.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752605Ab2CSKAp (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Mon, 19 Mar 2012 06:00:45 -0400
In-Reply-To: <20120319183911.0cd46df560c714ee71184242@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Olof Johansson <olof@lixom.net>, linux-arm-kernel@lists.infradead.org, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, "Turquette, Mike" <mturquette@ti.com>

On Monday 19 March 2012, Stephen Rothwell wrote:
> Hi all,
> 
> After merging the arm-soc tree, today's linux-next build (all)
> produced this warning:
> 
> drivers/clk/Kconfig:22: warning: menuconfig statement without prompt
> 
> Introduced by commit c173033d154e ("clk: make CONFIG_COMMON_CLK invisible").

Thanks for the report. This is clearly my fault for not testing the last
minute patch.
I have now replaced it with the one below and tested that it works
as intended.

	Arnd


commit 8fb61e33507e5d76b69467b4f96290338e96b733
Author: Arnd Bergmann <arnd@arndb.de>
Date:   Sat Mar 17 21:10:51 2012 +0000

    clk: make CONFIG_COMMON_CLK invisible
    
    All platforms that use the common clk infrastructure should select
    COMMON_CLK from platform code, and on all other platforms, it must
    not be enabled, so there is no point making the option visible to
    users, and when it is visible, we break randconfig builds.
    
    Signed-off-by: Arnd Bergmann <arnd@arndb.de>

diff --git a/drivers/clk/Kconfig b/drivers/clk/Kconfig
index 2eaf17e..165e1fe 100644
--- a/drivers/clk/Kconfig
+++ b/drivers/clk/Kconfig
@@ -9,21 +9,18 @@ config HAVE_CLK_PREPARE
 config HAVE_MACH_CLKDEV
 	bool
 
-menuconfig COMMON_CLK
-	bool "Common Clock Framework"
+config COMMON_CLK
+	bool
 	select HAVE_CLK_PREPARE
 	---help---
 	  The common clock framework is a single definition of struct
 	  clk, useful across many platforms, as well as an
 	  implementation of the clock API in include/linux/clk.h.
 	  Architectures utilizing the common struct clk should select
-	  this automatically, but it may be necessary to manually select
-	  this option for loadable modules requiring the common clock
-	  framework.
-
-	  If in doubt, say "N".
+	  this option.
 
-if COMMON_CLK
+menu "Common Clock Framework"
+	depends on COMMON_CLK
 
 config COMMON_CLK_DISABLE_UNUSED
 	bool "Disabled unused clocks at boot"
@@ -47,4 +44,4 @@ config COMMON_CLK_DEBUG
 	  clk_flags, clk_prepare_count, clk_enable_count &
 	  clk_notifier_count.
 
-endif
+endmenu
