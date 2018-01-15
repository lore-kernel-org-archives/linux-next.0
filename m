From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the kvm tree with Linus' and the tip
 trees
Date: Mon, 15 Jan 2018 13:34:59 +1100
Message-ID: <20180115133459.27b8f7f1@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:48585 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1752322AbeAOCfC (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Sun, 14 Jan 2018 21:35:02 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Paolo Bonzini <pbonzini@redhat.com>, Radim =?UTF-8?B?S3LEjW3DocWZ?= <rkrcmar@redhat.com>, KVM <kvm@vger.kernel.org>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>, "H. Peter Anvin" <hpa@zytor.com>, Peter Zijlstra <peterz@infradead.org>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, David Woodhouse <dwmw@amazon.co.uk>, Tom Lendacky <thomas.lendacky@amd.com>, Brijesh Singh <brijesh.singh@amd.com>

Hi all,

Today's linux-next merge of the kvm tree got a conflict in:

  arch/x86/include/asm/cpufeatures.h

between commit:

  a89f040fa34e ("x86/cpufeatures: Add X86_BUG_CPU_INSECURE")

from Linus' tree, commit:

  76b043848fd2 ("x86/retpoline: Add initial retpoline support")

from the tip tree and commit:

  18c71ce9c882 ("x86/CPU/AMD: Add the Secure Encrypted Virtualization CPU feature")

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

diff --cc arch/x86/include/asm/cpufeatures.h
index f275447862f4,13143dd8bdc2..000000000000
--- a/arch/x86/include/asm/cpufeatures.h
+++ b/arch/x86/include/asm/cpufeatures.h
@@@ -202,11 -201,9 +202,11 @@@
  #define X86_FEATURE_HW_PSTATE		( 7*32+ 8) /* AMD HW-PState */
  #define X86_FEATURE_PROC_FEEDBACK	( 7*32+ 9) /* AMD ProcFeedbackInterface */
  #define X86_FEATURE_SME			( 7*32+10) /* AMD Secure Memory Encryption */
 -#define X86_FEATURE_SEV			( 7*32+11) /* AMD Secure Encrypted Virtualization */
 -
 +#define X86_FEATURE_PTI			( 7*32+11) /* Kernel Page Table Isolation enabled */
 +#define X86_FEATURE_RETPOLINE		( 7*32+12) /* Generic Retpoline mitigation for Spectre variant 2 */
 +#define X86_FEATURE_RETPOLINE_AMD	( 7*32+13) /* AMD Retpoline mitigation for Spectre variant 2 */
  #define X86_FEATURE_INTEL_PPIN		( 7*32+14) /* Intel Processor Inventory Number */
- #define X86_FEATURE_INTEL_PT		( 7*32+15) /* Intel Processor Trace */
++#define X86_FEATURE_SEV			( 7*32+15) /* AMD Secure Encrypted Virtualization */
  #define X86_FEATURE_AVX512_4VNNIW	( 7*32+16) /* AVX-512 Neural Network Instructions */
  #define X86_FEATURE_AVX512_4FMAPS	( 7*32+17) /* AVX-512 Multiply Accumulation Single precision */
  
