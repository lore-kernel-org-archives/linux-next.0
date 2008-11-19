From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the sched tree
Date: Wed, 19 Nov 2008 12:27:46 +1100
Message-ID: <20081119122746.29db6c3a.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:41266 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751321AbYKSB2A (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Tue, 18 Nov 2008 20:28:00 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>, "H. Peter Anvin" <hpa@zytor.com>
Cc: linux-next@vger.kernel.org, Peter Zijlstra <peterz@infradead.org>, Kumar Gala <galak@kernel.crashing.org>

Hi all,

Today's linux-next merge of the sched tree got a conflict in
kernel/Makefile between commit 65ecc14a30ad21bed9aabdfd6a2ae1a1aaaa6a00
("Remove -mno-spe flags as they dont belong") from Linus' tree and commit
8bb8c4386d08f2cc5d871d22f220d35032213f84 ("sched, ftrace: trace sched.c")
from the sched tree.

I fixed it up (see below) and can carry it for a short while.
-- 
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

diff --cc kernel/Makefile
index 03a45e7,46e67a3..0000000
--- a/kernel/Makefile
+++ b/kernel/Makefile
@@@ -19,12 -21,7 +19,11 @@@ CFLAGS_REMOVE_mutex-debug.o = -p
  CFLAGS_REMOVE_rtmutex-debug.o = -pg
  CFLAGS_REMOVE_cgroup-debug.o = -pg
  CFLAGS_REMOVE_sched_clock.o = -pg
- CFLAGS_REMOVE_sched.o = -pg
  endif
 +ifdef CONFIG_FUNCTION_RET_TRACER
 +CFLAGS_REMOVE_extable.o = -pg # For __kernel_text_address()
 +CFLAGS_REMOVE_module.o = -pg # For __module_text_address()
 +endif
  
  obj-$(CONFIG_FREEZER) += freezer.o
  obj-$(CONFIG_PROFILING) += profile.o
