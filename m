From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the clockevents tree with the h8300
 tree
Date: Fri, 13 Nov 2015 11:01:45 +1100
Message-ID: <20151113110145.2c554a13@canb.auug.org.au>
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

  f639eeb4a60c ("h8300: enable CLKSRC_OF")

from the h8300 tree and commit:

  3e1e4573ef65 ("clocksource/drivers/h8300_timer8: Separate the Kconfig option from the arch")

from the clockevents tree.

I fixed it up (see below) and can carry the fix as necessary (no action
is required).

There is a lot to be said for sorting ...
-- 
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au

diff --cc arch/h8300/Kconfig
index dd3ac75776ad,7a17112930a9..000000000000
--- a/arch/h8300/Kconfig
+++ b/arch/h8300/Kconfig
@@@ -16,7 -16,7 +16,8 @@@ config H830
  	select OF_EARLY_FLATTREE
  	select HAVE_MEMBLOCK
  	select HAVE_DMA_ATTRS
 +	select CLKSRC_OF
+ 	select H8300_TMR8
  
  config RWSEM_GENERIC_SPINLOCK
  	def_bool y
