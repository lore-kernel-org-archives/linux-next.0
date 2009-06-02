From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the asm-generic tree with the
 arm-current tree
Date: Tue, 2 Jun 2009 16:33:31 +1000
Message-ID: <20090602163331.c1ca31e1.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:41762 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1757469AbZFBGdg (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Tue, 2 Jun 2009 02:33:36 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Arnd Bergmann <arnd@arndb.de>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Remis Lima Baima <remis.developer@googlemail.com>, Martin Fuzzey <mfuzzey@gmail.com>, Russell King <rmk@arm.linux.org.uk>

Hi Arnd,

Today's linux-next merge of the asm-generic tree got a conflict in
arch/arm/include/asm/page.h between commit
c0cbcd96d13ca0a90ff07babcd77c7d18cd2630d ("[ARM] 5534/1: kmalloc must
return a cache line aligned buffer") from the arm-current tree and commit
846d55eb38e14bbbd809e12a4b9d3fd2faf53c47 ("asm-generic: rename page.h and
uaccess.h") from the asm-generic tree.

I fixed it up (see below) and can carry the fix as necessary.
-- 
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au

diff --cc arch/arm/include/asm/page.h
index 7b52277,dee70a3..0000000
--- a/arch/arm/include/asm/page.h
+++ b/arch/arm/include/asm/page.h
@@@ -202,6 -202,13 +202,6 @@@ typedef struct page *pgtable_t
  	(((current->personality & READ_IMPLIES_EXEC) ? VM_EXEC : 0) | \
  	 VM_READ | VM_WRITE | VM_MAYREAD | VM_MAYWRITE | VM_MAYEXEC)
  
- #include <asm-generic/page.h>
 -/*
 - * With EABI on ARMv5 and above we must have 64-bit aligned slab pointers.
 - */
 -#if defined(CONFIG_AEABI) && (__LINUX_ARM_ARCH__ >= 5)
 -#define ARCH_SLAB_MINALIGN 8
 -#endif
 -
+ #include <asm-generic/getorder.h>
  
  #endif
