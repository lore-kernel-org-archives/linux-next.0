From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the rr tree
Date: Fri, 24 Oct 2008 13:21:52 +1100
Message-ID: <20081024132152.9e4e8297.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:34311 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751369AbYJXCV4 (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Thu, 23 Oct 2008 22:21:56 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Rusty Russell <rusty@rustcorp.com.au>
Cc: linux-next@vger.kernel.org, Mike Travis <travis@sgi.com>

Hi Rusty,

Today's linux-next merge of the rr tree got a conflict in
arch/x86/include/asm/ipi.h between commit
1965aae3c98397aad957412413c07e97b1bd4e64 ("x86: Fix ASM_X86__ header
guards") from Linus' tree and commit
8bb673a4d8312a71783b8ff190622fd03dfe34b8 ("x86 smp: modify send_IPI_mask
interface to accept cpumask_t pointers") from the rr tree.

Just trivial context changes.  I fixed it up (see below).
-- 
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

diff --cc arch/x86/include/asm/ipi.h
index f89dffb,fcb7424..0000000
--- a/arch/x86/include/asm/ipi.h
+++ b/arch/x86/include/asm/ipi.h
@@@ -135,4 -135,21 +135,21 @@@ static inline void send_IPI_mask_sequen
  	local_irq_restore(flags);
  }
  
+ static inline void send_IPI_mask_allbutself(const cpumask_t *mask, int vector)
+ {
+ 	unsigned long flags;
+ 	unsigned int query_cpu;
+ 	unsigned int this_cpu = smp_processor_id();
+ 
+ 	/* See Hack comment above */
+ 
+ 	local_irq_save(flags);
+ 	for_each_cpu_mask_nr(query_cpu, *mask)
+ 		if (query_cpu != this_cpu)
+ 			__send_IPI_dest_field(
+ 				per_cpu(x86_cpu_to_apicid, query_cpu),
+ 				vector, APIC_DEST_PHYSICAL);
+ 	local_irq_restore(flags);
+ }
+ 
 -#endif /* ASM_X86__IPI_H */
 +#endif /* _ASM_X86_IPI_H */
