From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the sched tree with the x86 tree
Date: Fri, 6 Mar 2009 12:17:39 +1100
Message-ID: <20090306121739.106eb63b.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:50503 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751258AbZCFCjz (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Thu, 5 Mar 2009 21:39:55 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>, "H. Peter Anvin" <hpa@zytor.com>
Cc: linux-next@vger.kernel.org, Peter Zijlstra <peterz@infradead.org>

Hi all,

Today's linux-next merge of the sched tree got a conflict in lib/Makefile
between commit 889c92d21db40be0b7d22a59395060237895bb85 ("bzip2/lzma:
centralize format detection") from the x86 tree and commit
ceacc2c1c85ac498ca4cf297bdfe5b4aaa9fd0e0 ("sched: make plist a library
facility") from the sched tree.

Just overlapping additions.  I fixed it up (see below) and can carry the
fix as necessary.
-- 
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

diff --cc lib/Makefile
index 1173a43,902d738..0000000
--- a/lib/Makefile
+++ b/lib/Makefile
@@@ -12,7 -12,7 +12,7 @@@ lib-y := ctype.o string.o vsprintf.o cm
  	 idr.o int_sqrt.o extable.o prio_tree.o \
  	 sha1.o irq_regs.o reciprocal_div.o argv_split.o \
  	 proportions.o prio_heap.o ratelimit.o show_mem.o \
- 	 is_single_threaded.o decompress.o
 -	 is_single_threaded.o plist.o
++	 is_single_threaded.o decompress.o plist.o
  
  lib-$(CONFIG_MMU) += ioremap.o
  lib-$(CONFIG_SMP) += cpumask.o
