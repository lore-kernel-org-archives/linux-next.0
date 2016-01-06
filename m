From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the tip tree with the h8300 tree
Date: Wed, 6 Jan 2016 14:43:46 +1100
Message-ID: <20160106144346.199bdc3c@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:52296 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751969AbcAFDns (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Tue, 5 Jan 2016 22:43:48 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>, "H. Peter Anvin" <hpa@zytor.com>, Peter Zijlstra <peterz@infradead.org>, Yoshinori Sato <ysato@users.sourceforge.jp>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Daniel Lezcano <daniel.lezcano@linaro.org>

Hi all,

Today's linux-next merge of the tip tree got a conflict in:

  arch/h8300/Kconfig

between commit:

  ff2b670fcb7b ("h8300: KGDB support")

from the h8300 tree and commit:

  97a23beb8db9 ("clocksource/drivers/h8300_timer8: Separate the Kconfig option from the arch")

from the tip tree.

I fixed it up (see below) and can carry the fix as necessary (no action
is required).

-- 
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au

diff --cc arch/h8300/Kconfig
index dc99ee1a86cf,2e20333cbce9..000000000000
--- a/arch/h8300/Kconfig
+++ b/arch/h8300/Kconfig
@@@ -17,8 -17,7 +17,9 @@@ config H830
  	select HAVE_MEMBLOCK
  	select HAVE_DMA_ATTRS
  	select CLKSRC_OF
 +	select HAVE_ARCH_KGDB
 +	select HAVE_KERNEL_LZO
+ 	select H8300_TMR8
  
  config RWSEM_GENERIC_SPINLOCK
  	def_bool y
