From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the kvm tree with the tip tree
Date: Thu, 17 Nov 2016 14:50:35 +1100
Message-ID: <20161117145035.3891820c@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:48031 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1753617AbcKQDui (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Wed, 16 Nov 2016 22:50:38 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Marcelo Tosatti <mtosatti@redhat.com>, Gleb Natapov <gleb@kernel.org>, KVM <kvm@vger.kernel.org>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>, "H. Peter Anvin" <hpa@zytor.com>, Peter Zijlstra <peterz@infradead.org>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Fenghua Yu <fenghua.yu@intel.com>, He Chen <he.chen@linux.intel.com>

Hi all,

Today's linux-next merge of the kvm tree got a conflict in:

  arch/x86/kernel/cpu/scattered.c

between commit:

  4ab1586488cb ("x86/cpufeature: Add RDT CPUID feature bits")

from the tip tree and commits:

  47f10a36003e ("x86/cpuid: Cleanup cpuid_regs definitions")
  47bdf3378d62 ("x86/cpuid: Provide get_scattered_cpuid_leaf()")

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

diff --cc arch/x86/kernel/cpu/scattered.c
index 49fb680bb0e5,d1316f9c8329..000000000000
--- a/arch/x86/kernel/cpu/scattered.c
+++ b/arch/x86/kernel/cpu/scattered.c
@@@ -17,11 -17,17 +17,20 @@@ struct cpuid_bit 
  	u32 sub_leaf;
  };
  
- enum cpuid_regs {
- 	CR_EAX = 0,
- 	CR_ECX,
- 	CR_EDX,
- 	CR_EBX
+ /* Please keep the leaf sorted by cpuid_bit.level for faster search. */
+ static const struct cpuid_bit cpuid_bits[] = {
+ 	{ X86_FEATURE_APERFMPERF,       CPUID_ECX,  0, 0x00000006, 0 },
+ 	{ X86_FEATURE_EPB,              CPUID_ECX,  3, 0x00000006, 0 },
++	{ X86_FEATURE_CAT_L3,		CPUID_EBX,  1, 0x00000010, 0 },
++	{ X86_FEATURE_CAT_L2,		CPUID_EBX,  2, 0x00000010, 0 },
++	{ X86_FEATURE_CDP_L3,		CPUID_ECX,  2, 0x00000010, 1 },
+ 	{ X86_FEATURE_INTEL_PT,         CPUID_EBX, 25, 0x00000007, 0 },
+ 	{ X86_FEATURE_AVX512_4VNNIW,    CPUID_EDX,  2, 0x00000007, 0 },
+ 	{ X86_FEATURE_AVX512_4FMAPS,    CPUID_EDX,  3, 0x00000007, 0 },
+ 	{ X86_FEATURE_HW_PSTATE,        CPUID_EDX,  7, 0x80000007, 0 },
+ 	{ X86_FEATURE_CPB,              CPUID_EDX,  9, 0x80000007, 0 },
+ 	{ X86_FEATURE_PROC_FEEDBACK,    CPUID_EDX, 11, 0x80000007, 0 },
+ 	{ 0, 0, 0, 0, 0 }
  };
  
  void init_scattered_cpuid_features(struct cpuinfo_x86 *c)
