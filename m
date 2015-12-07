From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the clockevents tree with the h8300
 tree
Date: Mon, 7 Dec 2015 16:26:42 +1100
Message-ID: <20151207162642.72f5e38d@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:42458 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1750816AbbLGF0q (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Mon, 7 Dec 2015 00:26:46 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Daniel Lezcano <daniel.lezcano@linaro.org>, Yoshinori Sato <ysato@users.sourceforge.jp>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org

Hi Daniel,

Today's linux-next merge of the clockevents tree got a conflict in:

  arch/h8300/Kconfig

between commits:

  f639eeb4a60c ("h8300: enable CLKSRC_OF")
  a801eb26d124 ("h8300: Add LZO compression")

from the h8300 tree and commit:

  6a5c601bf048 ("clocksource/drivers/h8300_timer8: Separate the Kconfig option from the arch")

from the clockevents tree.

I fixed it up (see below) and can carry the fix as necessary (no action
is required).

-- 
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au

diff --cc arch/h8300/Kconfig
index 4e48d1224456,7a17112930a9..000000000000
--- a/arch/h8300/Kconfig
+++ b/arch/h8300/Kconfig
@@@ -16,9 -16,7 +16,10 @@@ config H830
  	select OF_EARLY_FLATTREE
  	select HAVE_MEMBLOCK
  	select HAVE_DMA_ATTRS
 +	select CLKSRC_OF
 +	select HAVE_KERNEL_GZIP
 +	select HAVE_KERNEL_LZO
+ 	select H8300_TMR8
  
  config RWSEM_GENERIC_SPINLOCK
  	def_bool y
