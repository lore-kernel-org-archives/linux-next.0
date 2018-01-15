From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the bpf-next tree with Linus' tree
Date: Mon, 15 Jan 2018 11:15:53 +1100
Message-ID: <20180115111553.3687282a@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:48267 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1753099AbeAOAPz (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Sun, 14 Jan 2018 19:15:55 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Daniel Borkmann <daniel@iogearbox.net>, Alexei Starovoitov <ast@kernel.org>, Networking <netdev@vger.kernel.org>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, David Woodhouse <dwmw@amazon.co.uk>, Thomas Gleixner <tglx@linutronix.de>, Masami Hiramatsu <mhiramat@kernel.org>

Hi all,

Today's linux-next merge of the bpf-next tree got a conflict in:

  arch/x86/lib/Makefile

between commit:

  76b043848fd2 ("x86/retpoline: Add initial retpoline support")

from Linus' tree and commit:

  540adea3809f ("error-injection: Separate error-injection from kprobe")

from the bpf-next tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

-- 
Cheers,
Stephen Rothwell

diff --cc arch/x86/lib/Makefile
index f23934bbaf4e,171377b83be1..000000000000
--- a/arch/x86/lib/Makefile
+++ b/arch/x86/lib/Makefile
@@@ -26,7 -26,7 +26,8 @@@ lib-y += memcpy_$(BITS).
  lib-$(CONFIG_RWSEM_XCHGADD_ALGORITHM) += rwsem.o
  lib-$(CONFIG_INSTRUCTION_DECODER) += insn.o inat.o insn-eval.o
  lib-$(CONFIG_RANDOMIZE_BASE) += kaslr.o
 +lib-$(CONFIG_RETPOLINE) += retpoline.o
+ lib-$(CONFIG_FUNCTION_ERROR_INJECTION)	+= error-inject.o
  
  obj-y += msr.o msr-reg.o msr-reg-export.o hweight.o
  
