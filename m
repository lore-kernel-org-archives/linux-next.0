From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the kvm tree
Date: Mon, 15 Sep 2008 10:14:07 +1000
Message-ID: <20080915101407.2e45a509.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:43328 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1750924AbYIOAOP (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Sun, 14 Sep 2008 20:14:15 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Avi Kivity <avi@qumranet.com>
Cc: linux-next@vger.kernel.org, Sheng Yang <sheng.yang@intel.com>, Vegard Nossum <vegard.nossum@gmail.com>

Hi Avi,

Today's linux-next merge of the kvm tree got a trivial conflict in
include/asm-x86/msr-index.h between commit
77ef50a522717fa040636ee1017179ceba12ff62 ("x86: consolidate header
guards") from the x86 tree and commit
370ad813e210ac91935c6b5fa2e9cf80a0305fad ("x86: Move VMX MSRs to
msr-index.h") from the kvm tree.

I fixed it up (see below) and can carry the fixup.
-- 
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

diff --cc include/asm-x86/msr-index.h
index 3052f05,715f951..0000000
--- a/include/asm-x86/msr-index.h
+++ b/include/asm-x86/msr-index.h
@@@ -310,4 -314,19 +314,19 @@@
  /* Geode defined MSRs */
  #define MSR_GEODE_BUSCONT_CONF0		0x00001900
  
+ /* Intel VT MSRs */
+ #define MSR_IA32_VMX_BASIC              0x00000480
+ #define MSR_IA32_VMX_PINBASED_CTLS      0x00000481
+ #define MSR_IA32_VMX_PROCBASED_CTLS     0x00000482
+ #define MSR_IA32_VMX_EXIT_CTLS          0x00000483
+ #define MSR_IA32_VMX_ENTRY_CTLS         0x00000484
+ #define MSR_IA32_VMX_MISC               0x00000485
+ #define MSR_IA32_VMX_CR0_FIXED0         0x00000486
+ #define MSR_IA32_VMX_CR0_FIXED1         0x00000487
+ #define MSR_IA32_VMX_CR4_FIXED0         0x00000488
+ #define MSR_IA32_VMX_CR4_FIXED1         0x00000489
+ #define MSR_IA32_VMX_VMCS_ENUM          0x0000048a
+ #define MSR_IA32_VMX_PROCBASED_CTLS2    0x0000048b
+ #define MSR_IA32_VMX_EPT_VPID_CAP       0x0000048c
+ 
 -#endif /* __ASM_MSR_INDEX_H */
 +#endif /* ASM_X86__MSR_INDEX_H */
