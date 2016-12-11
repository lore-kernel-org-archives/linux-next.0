From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build warning after merge of the clk tree
Date: Mon, 12 Dec 2016 08:39:44 +1100
Message-ID: <20161212083944.5b6f2b54@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:48521 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1753859AbcLKVjs (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Sun, 11 Dec 2016 16:39:48 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Mike Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Boris Brezillon <boris.brezillon@free-electrons.com>

Hi all,

After merging the clk tree, today's linux-next build (arm
multi_v7_defconfig) produced this warning:

drivers/clk/bcm/clk-bcm2835.c: In function 'bcm2835_clock_determine_rate':
drivers/clk/bcm/clk-bcm2835.c:1069:18: warning: 'best_rate' may be used uninitialized in this function [-Wmaybe-uninitialized]
  *prate = curdiv * best_rate;
                  ^
drivers/clk/bcm/clk-bcm2835.c:1032:16: note: 'best_rate' was declared here
  unsigned long best_rate;
                ^

Introduced by commit

  155e8b3b0ee3 ("clk: bcm: Support rate change propagation on bcm2835 clocks")

-- 
Cheers,
Stephen Rothwell
