From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next:  build failure
Date: Mon, 25 Aug 2008 21:28:33 +1000
Message-ID: <20080825212833.38550575.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner+glk-linux-kernel-3=40m.gmane.org-S1754898AbYHYL2u@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Ingo Molnar <mingo@elte.hu>
Cc: linux-next@vger.kernel.org, David Miller <davem@davemloft.net>, LKML <linux-kernel@vger.kernel.org>
List-Id: linux-next.vger.kernel.org

Hi Ingo,

Today's linux-next build (sparc64 defconfig) failed like this:

ERROR: "__BUILD_BUG_ON_non_constant" [drivers/net/sunvnet.ko] undefined!
ERROR: "__BUILD_BUG_ON_non_constant" [drivers/block/sunvdc.ko] undefined!

Probably intorduced by commit f5b5d41dd51a31fe70e3a04fb80a3b90b84c6a4e
("debug: fix BUILD_BUG_ON() for non-constant expressions").

The preprocessed code looks like this:

static inline __attribute__((always_inline)) u32 vio_dring_avail(struct vio_dring_state *dr,
      unsigned int ring_size)
{
 do { (void)sizeof(char[1 - 2*!!(!is_power_of_2(ring_size))]); if (!__builtin_constant_p(!is_power_of_2(ring_size))) __BUILD_BUG_ON_non_constant++; } while (0);

 return (dr->pending -
  ((dr->prod - dr->cons) & (ring_size - 1)));
}

I tried turning the above inline function into a macro to no avail.

I applied the following patch (which is probably not what is wanted, but
puts back what was there before).

I see from LKML that this definition of BUILD_BUG_ON is to be replaced,
so this is just a temporary measure.

-- 
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

From: Stephen Rothwell <sfr@canb.auug.org.au>
Date: Mon, 25 Aug 2008 21:16:14 +1000
Subject: [PATCH] revert BUILD_BUG_ON change

Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
---
 include/linux/compiler.h |    6 ------
 1 files changed, 0 insertions(+), 6 deletions(-)

diff --git a/include/linux/compiler.h b/include/linux/compiler.h
index d7d313b..a1c082d 100644
--- a/include/linux/compiler.h
+++ b/include/linux/compiler.h
@@ -206,15 +206,9 @@ extern void __chk_io_ptr(const volatile void __iomem *);
  * ( The linker trick relies on gcc optimizing out a multiplication with
  *   constant zero - which should be reasonable enough. )
  */
-#ifndef __ASSEMBLY__
-extern unsigned int __BUILD_BUG_ON_non_constant;
-#endif
-
 #define BUILD_BUG_ON(condition)					\
 do {								\
 	(void)sizeof(char[1 - 2*!!(condition)]);		\
-	if (!__builtin_constant_p(condition))			\
-		__BUILD_BUG_ON_non_constant++;			\
 } while (0)
 
 /*
-- 
1.5.6.3
