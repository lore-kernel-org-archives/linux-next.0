From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the kmemcheck tree with the x86 tree
Date: Mon, 1 Jun 2009 17:55:38 +1000
Message-ID: <20090601175538.3b904a51.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:43753 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752307AbZFAILJ (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Mon, 1 Jun 2009 04:11:09 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Vegard Nossum <vegard.nossum@gmail.com>, Pekka Enberg <penberg@cs.helsinki.fi>, Ingo Molnar <mingo@elte.hu>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Thomas Gleixner <tglx@linutronix.de>, "H. Peter Anvin" <hpa@zytor.com>

Hi all,

Today's linux-next merge of the kmemcheck tree got a conflict in
arch/x86/mm/fault.c between commit
a2bcd4731f77cb77ae4b5e4a3d7f5471cf346c33 ("x86/mm: further cleanups of
fault.c's include file section") from the x86 tree and commit
787ecfaa503dc63ff1831ddc74b15dad49bace1d ("x86: add hooks for kmemcheck")
from the kmemcheck tree.

I fixed it up (see below) and can carry the fix as necessary.
-- 
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au

diff --cc arch/x86/mm/fault.c
index 5ec7ae3,3fcd79a..0000000
--- a/arch/x86/mm/fault.c
+++ b/arch/x86/mm/fault.c
@@@ -3,16 -3,41 +3,17 @@@
   *  Copyright (C) 2001, 2002 Andi Kleen, SuSE Labs.
   *  Copyright (C) 2008-2009, Red Hat Inc., Ingo Molnar
   */
 -#include <linux/interrupt.h>
 -#include <linux/mmiotrace.h>
 -#include <linux/bootmem.h>
 -#include <linux/compiler.h>
 -#include <linux/highmem.h>
 -#include <linux/kprobes.h>
 -#include <linux/uaccess.h>
 -#include <linux/vmalloc.h>
 -#include <linux/vt_kern.h>
 -#include <linux/signal.h>
 -#include <linux/kernel.h>
 -#include <linux/ptrace.h>
 -#include <linux/string.h>
 -#include <linux/module.h>
 -#include <linux/kdebug.h>
 -#include <linux/errno.h>
 -#include <linux/magic.h>
 -#include <linux/sched.h>
 -#include <linux/types.h>
 -#include <linux/init.h>
 -#include <linux/mman.h>
 -#include <linux/tty.h>
 -#include <linux/smp.h>
 -#include <linux/mm.h>
 -
 -#include <asm-generic/sections.h>
 -
 +#include <linux/magic.h>		/* STACK_END_MAGIC		*/
 +#include <linux/sched.h>		/* test_thread_flag(), ...	*/
 +#include <linux/kdebug.h>		/* oops_begin/end, ...		*/
 +#include <linux/module.h>		/* search_exception_table	*/
 +#include <linux/bootmem.h>		/* max_low_pfn			*/
 +#include <linux/kprobes.h>		/* __kprobes, ...		*/
 +#include <linux/mmiotrace.h>		/* kmmio_handler, ...		*/
 +
 +#include <asm/traps.h>			/* dotraplinkage, ...		*/
 +#include <asm/pgalloc.h>		/* pgd_*(), ...			*/
+ #include <asm/kmemcheck.h>
 -#include <asm/tlbflush.h>
 -#include <asm/pgalloc.h>
 -#include <asm/segment.h>
 -#include <asm/system.h>
 -#include <asm/proto.h>
 -#include <asm/traps.h>
 -#include <asm/desc.h>
  
  /*
   * Page fault error code bits:
