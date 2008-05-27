From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: ftrace build failure
Date: Tue, 27 May 2008 12:56:37 +1000
Message-ID: <20080527125637.439933a4.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:45476 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1753304AbYE0C4z (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Mon, 26 May 2008 22:56:55 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Ingo Molnar <mingo@elte.hu>
Cc: linux-next@vger.kernel.org, Pekka Paalanen <pq@iki.fi>, Thomas Gleixner <tglx@linutronix.de>

Hi Ingo,

Today's linux-next build (x86_64 allmodconfig) failed like this:

arch/x86/mm/kmmio.c: In function 'get_kmmio_probe':
arch/x86/mm/kmmio.c:85: error: implicit declaration of function 'list_for_each_entry_rcu'
arch/x86/mm/kmmio.c:85: error: 'list' undeclared (first use in this function)
arch/x86/mm/kmmio.c:85: error: (Each undeclared identifier is reported only once
arch/x86/mm/kmmio.c:85: error: for each function it appears in.)
arch/x86/mm/kmmio.c:85: error: syntax error before '{' token
arch/x86/mm/kmmio.c:88: warning: no return statement in function returning non-void
arch/x86/mm/kmmio.c: In function 'get_kmmio_fault_page':
arch/x86/mm/kmmio.c:100: error: 'list' undeclared (first use in this function)
arch/x86/mm/kmmio.c:100: error: syntax error before '{' token
arch/x86/mm/kmmio.c:103: warning: no return statement in function returning non-void
arch/x86/mm/kmmio.c: In function 'add_kmmio_fault_page':
arch/x86/mm/kmmio.c:328: error: implicit declaration of function 'list_add_rcu'
arch/x86/mm/kmmio.c: In function 'remove_kmmio_fault_pages':
arch/x86/mm/kmmio.c:420: error: implicit declaration of function 'list_del_rcu'

This is caused by the merge with the sched tree which contains the
ruclist split.

I applied the patch below.
-- 
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

>From ee19aa543ada9ce11a0b3b8480f3a268ff86cb02 Mon Sep 17 00:00:00 2001
From: Stephen Rothwell <sfr@canb.auug.org.au>
Date: Tue, 27 May 2008 12:53:04 +1000
Subject: [PATCH] ftrace: fix rculist split fallout

Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
---
 arch/x86/mm/kmmio.c |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/arch/x86/mm/kmmio.c b/arch/x86/mm/kmmio.c
index b65871e..7bfdad7 100644
--- a/arch/x86/mm/kmmio.c
+++ b/arch/x86/mm/kmmio.c
@@ -23,6 +23,7 @@
 #include <linux/errno.h>
 #include <asm/debugreg.h>
 #include <linux/mmiotrace.h>
+#include <linux/rculist.h>
 
 #define KMMIO_PAGE_HASH_BITS 4
 #define KMMIO_PAGE_TABLE_SIZE (1 << KMMIO_PAGE_HASH_BITS)
-- 
1.5.5.1

