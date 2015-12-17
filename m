From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the clockevents tree with the h8300
 tree
Date: Thu, 17 Dec 2015 13:48:36 +1100
Message-ID: <20151217134836.43dc67d5@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Daniel Lezcano <daniel.lezcano@linaro.org>, Yoshinori Sato <ysato@users.sourceforge.jp>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-next.vger.kernel.org

Hi Daniel,

Today's linux-next merge of the clockevents tree got a conflict in:

  arch/h8300/Kconfig

between commit:

  a801eb26d124 ("h8300: Add LZO compression")

from the h8300 tree and commit:

  97a23beb8db9 ("clocksource/drivers/h8300_timer8: Separate the Kconfig option from the arch")

from the clockevents tree.

I fixed it up (see below) and can carry the fix as necessary (no action
is required).

-- 
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au

diff --cc arch/h8300/Kconfig
index 4e48d1224456,2e20333cbce9..000000000000
--- a/arch/h8300/Kconfig
+++ b/arch/h8300/Kconfig
@@@ -17,8 -17,7 +17,9 @@@ config H830
  	select HAVE_MEMBLOCK
  	select HAVE_DMA_ATTRS
  	select CLKSRC_OF
 +	select HAVE_KERNEL_GZIP
 +	select HAVE_KERNEL_LZO
+ 	select H8300_TMR8
  
  config RWSEM_GENERIC_SPINLOCK
  	def_bool y
