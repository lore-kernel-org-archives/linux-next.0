From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the akpm-current tree with the tip tree
Date: Fri, 26 Feb 2016 16:07:12 +1100
Message-ID: <20160226160712.754b765c@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:49286 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1750869AbcBZFHP (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Fri, 26 Feb 2016 00:07:15 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Andrew Morton <akpm@linux-foundation.org>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>, "H. Peter Anvin" <hpa@zytor.com>, Peter Zijlstra <peterz@infradead.org>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Dave Hansen <dave.hansen@linux.intel.com>, Piotr Kwapulinski <kwapulinski.piotr@gmail.com>

Hi Andrew,

Today's linux-next merge of the akpm-current tree got a conflict in:

  mm/mprotect.c

between commit:

  62b5f7d013fc ("mm/core, x86/mm/pkeys: Add execute-only protection keys support")

from the tip tree and commit:

  aff3915ff831 ("mm/mprotect.c: don't imply PROT_EXEC on non-exec fs")

from the akpm-current tree.

I fixed it up (I think - see below) and can carry the fix as necessary
(no action is required).

-- 
Cheers,
Stephen Rothwell

diff --cc mm/mprotect.c
index fa37c4cd973a,6ff5dfa65b33..000000000000
--- a/mm/mprotect.c
+++ b/mm/mprotect.c
@@@ -414,7 -409,11 +411,11 @@@ SYSCALL_DEFINE3(mprotect, unsigned long
  
  		/* Here we know that vma->vm_start <= nstart < vma->vm_end. */
  
+ 		/* Does the application expect PROT_READ to imply PROT_EXEC */
+ 		if (rier && (vma->vm_flags & VM_MAYEXEC))
+ 			prot |= PROT_EXEC;
+ 
 -		newflags = calc_vm_prot_bits(prot);
 +		newflags = calc_vm_prot_bits(prot, pkey);
  		newflags |= (vma->vm_flags & ~(VM_READ | VM_WRITE | VM_EXEC));
  
  		/* newflags >> 4 shift VM_MAY% in place of VM_% */
