From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the kvm tree with Linus' tree
Date: Wed, 17 Jan 2018 14:48:17 +1100
Message-ID: <20180117144817.1cba736f@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Paolo Bonzini <pbonzini@redhat.com>, Radim =?UTF-8?B?S3LEjW3DocWZ?= <rkrcmar@redhat.com>, KVM <kvm@vger.kernel.org>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, David Woodhouse <dwmw@amazon.co.uk>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@kernel.org>
List-Id: linux-next.vger.kernel.org

Hi all,

[This is the same conflict I reported the day before yesterday, but one
of the commits has moved and another that contributed has been dropped.]

Today's linux-next merge of the kvm tree got a conflict in:

  arch/x86/include/asm/cpufeatures.h

between commits:

  a89f040fa34e ("x86/cpufeatures: Add X86_BUG_CPU_INSECURE")
  76b043848fd2 ("x86/retpoline: Add initial retpoline support")

from Linus' tree, commit:

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
index aa09559b2c0b,19f35be95f16..000000000000
--- a/arch/x86/include/asm/cpufeatures.h
+++ b/arch/x86/include/asm/cpufeatures.h
@@@ -211,7 -209,6 +211,8 @@@
  #define X86_FEATURE_AVX512_4FMAPS	( 7*32+17) /* AVX-512 Multiply Accumulation Single precision */
  
  #define X86_FEATURE_MBA			( 7*32+18) /* Memory Bandwidth Allocation */
 +#define X86_FEATURE_RSB_CTXSW		( 7*32+19) /* Fill RSB on context switches */
++#define X86_FEATURE_SEV			( 7*32+20) /* AMD Secure Encrypted Virtualization */
  
  /* Virtualization flags: Linux defined, word 8 */
  #define X86_FEATURE_TPR_SHADOW		( 8*32+ 0) /* Intel TPR Shadow */
