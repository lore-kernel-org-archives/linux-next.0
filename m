From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the akpm tree with the tip tree
Date: Wed, 12 Apr 2017 17:08:29 +1000
Message-ID: <20170412170829.3b4e3294@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:34535 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1751042AbdDLHIc (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Wed, 12 Apr 2017 03:08:32 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Andrew Morton <akpm@linux-foundation.org>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>, "H. Peter Anvin" <hpa@zytor.com>, Peter Zijlstra <peterz@infradead.org>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Laura Abbott <labbott@redhat.com>

Hi Andrew,

Today's linux-next merge of the akpm tree got conflicts in:

  arch/x86/mm/init.c
  arch/x86/mm/ioremap.c

between commit:

  66441bd3cfdc ("x86/boot/e820: Move asm/e820.h to asm/e820/api.h")

from the tip tree and patch:

  "x86: use set_memory.h header"

from the akpm tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

-- 
Cheers,
Stephen Rothwell

diff --cc arch/x86/mm/init.c
index 2193799ca800,adbfb095bade..000000000000
--- a/arch/x86/mm/init.c
+++ b/arch/x86/mm/init.c
@@@ -5,8 -5,8 +5,8 @@@
  #include <linux/memblock.h>
  #include <linux/bootmem.h>	/* for max_low_pfn */
  
- #include <asm/cacheflush.h>
+ #include <asm/set_memory.h>
 -#include <asm/e820.h>
 +#include <asm/e820/api.h>
  #include <asm/init.h>
  #include <asm/page.h>
  #include <asm/page_types.h>
diff --cc arch/x86/mm/ioremap.c
index e4f7b25df18e,1924c4ab8be5..000000000000
--- a/arch/x86/mm/ioremap.c
+++ b/arch/x86/mm/ioremap.c
@@@ -14,8 -13,8 +14,8 @@@
  #include <linux/vmalloc.h>
  #include <linux/mmiotrace.h>
  
- #include <asm/cacheflush.h>
+ #include <asm/set_memory.h>
 -#include <asm/e820.h>
 +#include <asm/e820/api.h>
  #include <asm/fixmap.h>
  #include <asm/pgtable.h>
  #include <asm/tlbflush.h>
