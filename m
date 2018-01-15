From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the kvm tree with the tip tree
Date: Mon, 15 Jan 2018 13:39:02 +1100
Message-ID: <20180115133902.0abe39af@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:36573 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1752322AbeAOCjE (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Sun, 14 Jan 2018 21:39:04 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Paolo Bonzini <pbonzini@redhat.com>, Radim =?UTF-8?B?S3LEjW3DocWZ?= <rkrcmar@redhat.com>, KVM <kvm@vger.kernel.org>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>, "H. Peter Anvin" <hpa@zytor.com>, Peter Zijlstra <peterz@infradead.org>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, David Woodhouse <dwmw@amazon.co.uk>, Chao Peng <chao.p.peng@linux.intel.com>, Luwei Kang <luwei.kang@intel.com>

Hi all,

Today's linux-next merge of the kvm tree got a conflict in:

  arch/x86/kvm/vmx.c

between commit:

  117cc7a908c8 ("x86/retpoline: Fill return stack buffer on vmexit")

from the tip tree and commit:

  3e95fd6d0561 ("KVM: x86: Add Intel Processor Trace virtualization mode")

from the kvm tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

-- 
Cheers,
Stephen Rothwell

diff --cc arch/x86/kvm/vmx.c
index c829d89e2e63,87ac655760e5..000000000000
--- a/arch/x86/kvm/vmx.c
+++ b/arch/x86/kvm/vmx.c
@@@ -50,7 -50,7 +50,8 @@@
  #include <asm/apic.h>
  #include <asm/irq_remapping.h>
  #include <asm/mmu_context.h>
 +#include <asm/nospec-branch.h>
+ #include <asm/intel_pt.h>
  
  #include "trace.h"
  #include "pmu.h"
@@@ -9491,12 -9721,9 +9731,12 @@@ static void __noclone vmx_vcpu_run(stru
  #endif
  	      );
  
 +	/* Eliminate branch target predictions from guest mode */
 +	vmexit_fill_RSB();
 +
  	/* MSR_IA32_DEBUGCTLMSR is zeroed on vmexit. Restore it if needed */
- 	if (debugctlmsr)
- 		update_debugctlmsr(debugctlmsr);
+ 	if (vmx->host_debugctlmsr)
+ 		update_debugctlmsr(vmx->host_debugctlmsr);
  
  #ifndef CONFIG_X86_64
  	/*
