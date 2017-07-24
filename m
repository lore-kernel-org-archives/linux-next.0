From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the clk tree with Linus' tree
Date: Mon, 24 Jul 2017 10:37:34 +1000
Message-ID: <20170724103734.6316c868@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:56163 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1751768AbdGXAhg (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Sun, 23 Jul 2017 20:37:36 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Mike Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>, Randy Dunlap <rdunlap@infradead.org>, Linus Torvalds <torvalds@linux-foundation.org>

Hi all,

Today's linux-next merge of the clk tree got a conflict in:

  MAINTAINERS

between commit:

  82abbea734d6 ("MAINTAINERS: fix alphabetical ordering")

from Linus' tree and commit:

  6d7489c74a6e ("clk: axs10x: introduce AXS10X pll driver")

from the clk tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

BTW, Linus, I am using your perl script to check my resolution results
(thanks), but could you please make it executable?
-- 
Cheers,
Stephen Rothwell

diff --cc MAINTAINERS
index fdbe3da4d5de,c571fcf62740..000000000000
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@@ -12599,6 -12738,6 +12599,12 @@@ F:	drivers/clocksource/arc_timer.
  F:	drivers/tty/serial/arc_uart.c
  T:	git git://git.kernel.org/pub/scm/linux/kernel/git/vgupta/arc.git
  
++SYNOPSYS ARC SDP clock driver
++M:	Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>
++S:	Supported
++F:	drivers/clk/axs10x/*
++F:	Documentation/devicetree/bindings/clock/snps,pll-clock.txt
++
  SYNOPSYS ARC SDP platform support
  M:	Alexey Brodkin <abrodkin@synopsys.com>
  S:	Supported
