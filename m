From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next:  build failure
Date: Thu, 16 Oct 2008 20:29:07 +1100
Message-ID: <20081016202907.978d00b1.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:50163 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1753527AbYJPKeX (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Thu, 16 Oct 2008 06:34:23 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Jeremy Fitzhardinge <jeremy@goop.org>
Cc: linux-next@vger.kernel.org, ppc-dev <linuxppc-dev@ozlabs.org>, Ingo Molnar <mingo@elte.hu>, Andrew Morton <akpm@linux-foundation.org>

Hi all,

Today's linux-next build (powerpc allyesconfig) failed like this:

In file included from arch/powerpc/include/asm/mmu-hash64.h:17,
                 from arch/powerpc/include/asm/mmu.h:8,
                 from arch/powerpc/include/asm/pgtable.h:8,
                 from arch/powerpc/mm/slb.c:20:
arch/powerpc/include/asm/page.h:76: error: expected '=', ',', ';', 'asm' or '__attribute__' before 'memstart_addr'
arch/powerpc/include/asm/page.h:77: error: expected '=', ',', ';', 'asm' or '__attribute__' before 'kernstart_addr'

Caused by commit 600715dcdf567c86f8b2c6173fcfb4b873e25a19 ("generic: add
phys_addr_t for holding physical addresses") from the tip-core tree.
This only fails if CONFIG_RELOCATABLE is set.

I have applied the patch below.
-- 
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

>From 3e3a6a5f9479a4d35070c15f863a8635e9865058 Mon Sep 17 00:00:00 2001
From: Stephen Rothwell <sfr@canb.auug.org.au>
Date: Thu, 16 Oct 2008 20:07:00 +1100
Subject: [PATCH] tip-core/powerpc: phys_addr_t has moved to linux/types.h

So include that instead of asm/types.h in asm/page.h for
the CONFIG_RELOCATABLE case.

Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
---
 arch/powerpc/include/asm/page.h |    6 +++++-
 1 files changed, 5 insertions(+), 1 deletions(-)

diff --git a/arch/powerpc/include/asm/page.h b/arch/powerpc/include/asm/page.h
index 64e1445..5ac51e6 100644
--- a/arch/powerpc/include/asm/page.h
+++ b/arch/powerpc/include/asm/page.h
@@ -10,9 +10,13 @@
  * 2 of the License, or (at your option) any later version.
  */
 
+#ifndef __ASSEMBLY__
+#include <linux/types.h>
+#else
+#include <asm/types.h>
+#endif
 #include <asm/asm-compat.h>
 #include <asm/kdump.h>
-#include <asm/types.h>
 
 /*
  * On PPC32 page size is 4K. For PPC64 we support either 4K or 64K software
-- 
1.5.6.5
