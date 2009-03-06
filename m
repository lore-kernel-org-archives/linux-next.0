From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the tip-core tree with the arm tree
Date: Fri, 6 Mar 2009 11:58:59 +1100
Message-ID: <20090306115859.ee147659.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:44239 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752565AbZCFA7E (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Thu, 5 Mar 2009 19:59:04 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>, "H. Peter Anvin" <hpa@zytor.com>
Cc: linux-next@vger.kernel.org, Catalin Marinas <catalin.marinas@arm.com>, Russell King <rmk@arm.linux.org.uk>, Peter Zijlstra <a.p.zijlstra@chello.nl>

Hi all,

Today's linux-next merge of the tip-core tree got a conflict in
lib/Kconfig.debug between commit adf8b37bafc1495393201a2ae4235846371870d0
("[ARM] 5386/2: unwind: Add Makefile and Kconfig entries for ARM stack
unwinding") from the arm tree and commit
1075414b06109a99b0e87601e84c74a95bd45681 ("lockdep: require framepointers
for x86") from the tip-core tree.

I fixed it up (see below) and can carry the fix as necessary.
-- 
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

diff --cc lib/Kconfig.debug
index 0626fa4,4742459..0000000
--- a/lib/Kconfig.debug
+++ b/lib/Kconfig.debug
@@@ -402,7 -440,7 +440,7 @@@ config LOCKDE
  	bool
  	depends on DEBUG_KERNEL && TRACE_IRQFLAGS_SUPPORT && STACKTRACE_SUPPORT && LOCKDEP_SUPPORT
  	select STACKTRACE
- 	select FRAME_POINTER if !X86 && !MIPS && !PPC && !ARM_UNWIND
 -	select FRAME_POINTER if !MIPS && !PPC
++	select FRAME_POINTER if !MIPS && !PPC && !ARM_UNWIND
  	select KALLSYMS
  	select KALLSYMS_ALL
  
