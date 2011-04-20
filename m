From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the percpu tree with the tip tree
Date: Wed, 20 Apr 2011 13:50:36 +1000
Message-ID: <20110420135036.b84035de.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:58004 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1753430Ab1DTDup (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Tue, 19 Apr 2011 23:50:45 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Tejun Heo <tj@kernel.org>, Rusty Russell <rusty@rustcorp.com.au>, Christoph Lameter <cl@linux-foundation.org>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>, "H. Peter Anvin" <hpa@zytor.com>, Peter Zijlstra <peterz@infradead.org>, Eric Dumazet <eric.dumazet@gmail.com>

Hi all,

Today's linux-next merge of the percpu tree got a conflict in
arch/x86/include/asm/percpu.h between commit b1e7734f024c ("x86, percpu:
Use ASM_NOP4 instead of hardcoding P6_NOP4") from the tip tree and commit
5f55924deaa6 ("percpu: Avoid extra NOP in percpu_cmpxchg16b_double") from
the percpu tree.

I fixed it up (see below) and can carry the fix as necessary.
-- 
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au

diff --cc arch/x86/include/asm/percpu.h
index 53278b0,d68fca6..0000000
--- a/arch/x86/include/asm/percpu.h
+++ b/arch/x86/include/asm/percpu.h
@@@ -509,6 -509,11 +509,11 @@@ do {									
   * it in software.  The address used in the cmpxchg16 instruction must be
   * aligned to a 16 byte boundary.
   */
+ #ifdef CONFIG_SMP
 -#define CMPXCHG16B_EMU_CALL "call this_cpu_cmpxchg16b_emu\n\t" P6_NOP3
++#define CMPXCHG16B_EMU_CALL "call this_cpu_cmpxchg16b_emu\n\t" ASM_NOP3
+ #else
 -#define CMPXCHG16B_EMU_CALL "call this_cpu_cmpxchg16b_emu\n\t" P6_NOP2
++#define CMPXCHG16B_EMU_CALL "call this_cpu_cmpxchg16b_emu\n\t" ASM_NOP2
+ #endif
  #define percpu_cmpxchg16b_double(pcp1, o1, o2, n1, n2)			\
  ({									\
  	char __ret;							\
