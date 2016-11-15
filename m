From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build warnings after merge of the pinctrl tree
Date: Wed, 16 Nov 2016 10:11:33 +1100
Message-ID: <20161116101133.6ad1d974@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:43929 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S934589AbcKOXLg (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Tue, 15 Nov 2016 18:11:36 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Maxime Ripard <maxime.ripard@free-electrons.com>

Hi Linus,

After merging the pinctrl tree, today's linux-next build
(arm_multi_v7_defconfig) produced these warnings:

drivers/pinctrl/sunxi/pinctrl-sunxi.c: In function 'sunxi_pinctrl_init':
drivers/pinctrl/sunxi/pinctrl-sunxi.c:1191:8: warning: 'best_div' may be used uninitialized in this function [-Wmaybe-uninitialized]
    div = hosc_div;
        ^
drivers/pinctrl/sunxi/pinctrl-sunxi.c:1128:31: note: 'best_div' was declared here
  unsigned int best_diff = ~0, best_div;
                               ^
drivers/pinctrl/sunxi/pinctrl-sunxi.c:1194:8: warning: 'best_div' may be used uninitialized in this function [-Wmaybe-uninitialized]
    div = losc_div;
        ^
drivers/pinctrl/sunxi/pinctrl-sunxi.c:1128:31: note: 'best_div' was declared here
  unsigned int best_diff = ~0, best_div;
                               ^

Introduced by commit

  7c926492d38a ("pinctrl: sunxi: Add support for interrupt debouncing")

-- 
Cheers,
Stephen Rothwell
