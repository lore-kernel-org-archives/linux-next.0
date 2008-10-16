From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the sh tree
Date: Fri, 17 Oct 2008 10:54:02 +1100
Message-ID: <20081017105402.7994ff3e.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:58603 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751892AbYJPXyI (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Thu, 16 Oct 2008 19:54:08 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Paul Mundt <lethal@linux-sh.org>
Cc: linux-next@vger.kernel.org, Martin Schwidefsky <schwidefsky@de.ibm.com>

Hi Paul,

Today's linux-next merge of the sh tree got a conflict in
arch/sh/include/asm/elf.h between commit
0b59268285ca6cdc46191f2995bf632088e3e277 ("[PATCH] remove unused
ibcs2/PER_SVR4 in SET_PERSONALITY") from Linus' tree and commit
0e660d2d433393f983cd58fe8c54f831fa7c7713 ("sh: Tidy up ELF core dumps")
from the sh tree.

Just a context change.  I fixed it up (see below).
-- 
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

diff --cc arch/sh/include/asm/elf.h
index ee02db1,4da3a0b..0000000
--- a/arch/sh/include/asm/elf.h
+++ b/arch/sh/include/asm/elf.h
@@@ -189,13 -197,7 +197,7 @@@ do {									
  } while (0)
  #endif
  
 -#define SET_PERSONALITY(ex, ibcs2) set_personality(PER_LINUX_32BIT)
 +#define SET_PERSONALITY(ex) set_personality(PER_LINUX_32BIT)
- struct task_struct;
- extern int dump_task_regs (struct task_struct *, elf_gregset_t *);
- extern int dump_task_fpu (struct task_struct *, elf_fpregset_t *);
- 
- #define ELF_CORE_COPY_TASK_REGS(tsk, elf_regs) dump_task_regs(tsk, elf_regs)
- #define ELF_CORE_COPY_FPREGS(tsk, elf_fpregs) dump_task_fpu(tsk, elf_fpregs)
  
  #ifdef CONFIG_VSYSCALL
  /* vDSO has arch_setup_additional_pages */
