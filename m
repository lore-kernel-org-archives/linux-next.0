From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the xen-tip tree with the tip tree
Date: Thu, 31 Aug 2017 14:37:54 +1000
Message-ID: <20170831143754.3136a6c6@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:60845 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1750813AbdHaEh4 (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Thu, 31 Aug 2017 00:37:56 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Juergen Gross <jgross@suse.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, Stefano Stabellini <sstabellini@kernel.org>, Boris Ostrovsky <boris.ostrovsky@oracle.com>, Xen Devel <Xen-devel@lists.xensource.com>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>, "H. Peter Anvin" <hpa@zytor.com>, Peter Zijlstra <peterz@infradead.org>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>

Hi all,

Today's linux-next merge of the xen-tip tree got a conflict in:

  arch/x86/xen/enlighten_pv.c

between commit:

  64b163fab684 ("x86/idt: Unify gate_struct handling for 32/64-bit kernels")

from the tip tree and commit:

  ad5b8c4ba323 ("xen: get rid of paravirt op adjust_exception_frame")

from the xen-tip tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

-- 
Cheers,
Stephen Rothwell

diff --cc arch/x86/xen/enlighten_pv.c
index c76f5ff4d0d7,148527c4e48a..000000000000
--- a/arch/x86/xen/enlighten_pv.c
+++ b/arch/x86/xen/enlighten_pv.c
@@@ -596,42 -651,10 +658,10 @@@ static int cvt_gate_to_trap(int vector
  
  	info->vector = vector;
  
 -	addr = gate_offset(*val);
 +	addr = gate_offset(val);
  #ifdef CONFIG_X86_64
- 	/*
- 	 * Look for known traps using IST, and substitute them
- 	 * appropriately.  The debugger ones are the only ones we care
- 	 * about.  Xen will handle faults like double_fault,
- 	 * so we should never see them.  Warn if
- 	 * there's an unexpected IST-using fault handler.
- 	 */
- 	if (addr == (unsigned long)debug)
- 		addr = (unsigned long)xen_debug;
- 	else if (addr == (unsigned long)int3)
- 		addr = (unsigned long)xen_int3;
- 	else if (addr == (unsigned long)stack_segment)
- 		addr = (unsigned long)xen_stack_segment;
- 	else if (addr == (unsigned long)double_fault) {
- 		/* Don't need to handle these */
 -	if (!get_trap_addr(&addr, val->ist))
++	if (!get_trap_addr(&addr, val->bits.ist))
  		return 0;
- #ifdef CONFIG_X86_MCE
- 	} else if (addr == (unsigned long)machine_check) {
- 		/*
- 		 * when xen hypervisor inject vMCE to guest,
- 		 * use native mce handler to handle it
- 		 */
- 		;
- #endif
- 	} else if (addr == (unsigned long)nmi)
- 		/*
- 		 * Use the native version as well.
- 		 */
- 		;
- 	else {
- 		/* Some other trap using IST? */
- 		if (WARN_ON(val->bits.ist != 0))
- 			return 0;
- 	}
  #endif	/* CONFIG_X86_64 */
  	info->address = addr;
  
