From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the perfmon3 tree
Date: Tue, 25 Nov 2008 21:03:27 +1100
Message-ID: <20081125210327.48e0eae0.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:41692 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751918AbYKYKDv (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Tue, 25 Nov 2008 05:03:51 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: stephane eranian <eranian@googlemail.com>
Cc: linux-next@vger.kernel.org, Hiroshi Shimamoto <h-shimamoto@ct.jp.nec.com>, Ingo Molnar <mingo@elte.hu>

Hi Stephane,

Today's linux-next merge of the perfmon3 tree got a conflict in
arch/x86/kernel/signal_32.c between commit
5c9b3a0c7b8be3cdef3d7418f0a49127e7cdc998 ("x86: signal: cosmetic
unification of including headers") from the x86 tree and commit
b8509b08e429bf36e4ac99dd03d24a3618428f71 ("perfmon: x86-32 hooks") from
the perfmon3 tree.

I fixed it up (see below) and can carry the fix.
-- 
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

diff --cc arch/x86/kernel/signal_32.c
index f7dd6c4,74da315..0000000
--- a/arch/x86/kernel/signal_32.c
+++ b/arch/x86/kernel/signal_32.c
@@@ -4,20 -4,24 +4,21 @@@
   *  1997-11-28  Modified for POSIX.1b signals by Richard Henderson
   *  2000-06-20  Pentium III FXSR, SSE support by Gareth Hughes
   */
 -#include <linux/list.h>
  
 -#include <linux/personality.h>
 -#include <linux/binfmts.h>
 -#include <linux/suspend.h>
 +#include <linux/sched.h>
 +#include <linux/mm.h>
 +#include <linux/smp.h>
  #include <linux/kernel.h>
 -#include <linux/ptrace.h>
  #include <linux/signal.h>
 -#include <linux/stddef.h>
 -#include <linux/unistd.h>
  #include <linux/errno.h>
 -#include <linux/sched.h>
  #include <linux/wait.h>
 +#include <linux/ptrace.h>
  #include <linux/tracehook.h>
 -#include <linux/elf.h>
 +#include <linux/unistd.h>
 +#include <linux/stddef.h>
 +#include <linux/personality.h>
 +#include <linux/uaccess.h>
+ #include <linux/perfmon_kern.h>
 -#include <linux/smp.h>
 -#include <linux/mm.h>
  
  #include <asm/processor.h>
  #include <asm/ucontext.h>
