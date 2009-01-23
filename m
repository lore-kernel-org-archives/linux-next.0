From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the kmemcheck tree with the x86 tree
Date: Fri, 23 Jan 2009 15:44:09 +1100
Message-ID: <20090123154409.e3d1cd1d.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:50599 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1753570AbZAWEoN (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Thu, 22 Jan 2009 23:44:13 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Vegard Nossum <vegard.nossum@gmail.com>, Pekka Enberg <penberg@cs.helsinki.fi>, Ingo Molnar <mingo@elte.hu>
Cc: linux-next@vger.kernel.org, Nick Piggin <npiggin@suse.de>

Hi all,

Today's linux-next merge of the kmemcheck tree got a conflict in
arch/x86/mm/fault.c between commit do_page_fault ("x86: optimise x86's
do_page_fault (C entry point for the page fault path)") from the x86 tree
and commit 787ecfaa503dc63ff1831ddc74b15dad49bace1d ("x86: add hooks for
kmemcheck") from the kmemcheck tree.

I fixed it up (see below) but it is worth a check.  I can carry the fix
as necessary.
-- 
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

diff --cc arch/x86/mm/fault.c
index d3eee74,c73afbb..0000000
--- a/arch/x86/mm/fault.c
+++ b/arch/x86/mm/fault.c
@@@ -806,7 -602,16 +807,14 @@@ void __kprobes do_page_fault(struct pt_
  	/* get the address */
  	address = read_cr2();
  
 -	si_code = SEGV_MAPERR;
 -
+ 	/*
+ 	 * Detect and handle instructions that would cause a page fault for
+ 	 * both a tracked kernel page and a userspace page.
+ 	 */
+ 	if(kmemcheck_active(regs))
+ 		kmemcheck_hide(regs);
+ 
 -	if (notify_page_fault(regs))
 +	if (unlikely(notify_page_fault(regs)))
  		return;
  	if (unlikely(kmmio_fault(regs, address)))
  		return;
@@@ -829,12 -634,16 +837,16 @@@
  #else
  	if (unlikely(address >= TASK_SIZE64)) {
  #endif
- 		if (!(error_code & (PF_RSVD|PF_USER|PF_PROT)) &&
- 		    vmalloc_fault(address) >= 0)
- 			return;
+ 		if (!(error_code & (PF_RSVD | PF_USER | PF_PROT))) {
+ 			if (vmalloc_fault(address) >= 0)
+ 				return;
+ 
+ 			if (kmemcheck_fault(regs, address, error_code))
+ 				return;
+ 		}
  
  		/* Can handle a stale RO->RW TLB */
 -		if (spurious_fault(address, error_code))
 +		if (spurious_fault(error_code, address))
  			return;
  
  		/*
