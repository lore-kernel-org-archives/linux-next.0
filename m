From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: sparc tree build failure
Date: Thu, 9 Apr 2009 15:17:22 +1000
Message-ID: <20090409151722.c8eabb56.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:41315 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1754621AbZDIFR3 (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Thu, 9 Apr 2009 01:17:29 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>, "H. Peter Anvin" <hpa@zytor.com>
Cc: linux-next@vger.kernel.org, "David S. Miller" <davem@davemloft.net>, Darren Hart <dvhltc@us.ibm.com>

Hi all,

Today's linux-next build (sparc64 defconfig) failed like this:

arch/sparc/kernel/built-in.o: In function `trap_init':
(.init.text+0x4): undefined reference to `thread_info_offsets_are_bolixed_dave'

Caused by commit 52400ba946759af28442dee6265c5c0180ac7122 ("futex: add
requeue_pi functionality") (from the tip-core tree) which changed the
size of struct restart_block.

Dave, this might be a good time to suggest that sparc64 create its TI_
offsets automatically via asm-offsets ...

I applied the following patch for today.
-- 
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

>From 11f2623cf0416509193865acad7e36ae05e31b1a Mon Sep 17 00:00:00 2001
From: Stephen Rothwell <sfr@canb.auug.org.au>
Date: Thu, 9 Apr 2009 15:12:38 +1000
Subject: [PATCH] sparc64: update for restart_block size change

Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
---
 arch/sparc/include/asm/thread_info_64.h |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/sparc/include/asm/thread_info_64.h b/arch/sparc/include/asm/thread_info_64.h
index 639ac80..6586572 100644
--- a/arch/sparc/include/asm/thread_info_64.h
+++ b/arch/sparc/include/asm/thread_info_64.h
@@ -102,8 +102,8 @@ struct thread_info {
 #define TI_KERN_CNTD1	0x00000488
 #define TI_PCR		0x00000490
 #define TI_RESTART_BLOCK 0x00000498
-#define TI_KUNA_REGS	0x000004c0
-#define TI_KUNA_INSN	0x000004c8
+#define TI_KUNA_REGS	0x000004c8
+#define TI_KUNA_INSN	0x000004d0
 #define TI_FPREGS	0x00000500
 
 /* We embed this in the uppermost byte of thread_info->flags */
-- 
1.6.2.1
