From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the kvm tree with Linus' tree
Date: Fri, 25 Aug 2017 14:34:16 +1000
Message-ID: <20170825143416.1673621d@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Marcelo Tosatti <mtosatti@redhat.com>, Gleb Natapov <gleb@kernel.org>, KVM <kvm@vger.kernel.org>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Janakarajan Natarajan <Janakarajan.Natarajan@amd.com>, Borislav Petkov <bp@suse.de>, Ingo Molnar <mingo@kernel.org>, Paolo Bonzini <pbonzini@redhat.com>
List-Id: linux-next.vger.kernel.org

Hi all,

Today's linux-next merge of the kvm tree got a conflict in:

  arch/x86/include/asm/cpufeatures.h

between commit:

  5442c2699552 ("x86/cpufeature, kvm/svm: Rename (shorten) the new "virtualized VMSAVE/VMLOAD" CPUID flag")

from Linus' tree and commit:

  d837312dfd5b ("KVM: SVM: Add Virtual GIF feature definition")

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
index 42bbbf0f173d,0e25e7a8ab03..000000000000
--- a/arch/x86/include/asm/cpufeatures.h
+++ b/arch/x86/include/asm/cpufeatures.h
@@@ -287,7 -286,8 +287,8 @@@
  #define X86_FEATURE_PAUSEFILTER (15*32+10) /* filtered pause intercept */
  #define X86_FEATURE_PFTHRESHOLD (15*32+12) /* pause filter threshold */
  #define X86_FEATURE_AVIC	(15*32+13) /* Virtual Interrupt Controller */
 -#define X86_FEATURE_VIRTUAL_VMLOAD_VMSAVE (15*32+15) /* Virtual VMLOAD VMSAVE */
 +#define X86_FEATURE_V_VMSAVE_VMLOAD (15*32+15) /* Virtual VMSAVE VMLOAD */
+ #define X86_FEATURE_VGIF	(15*32+16) /* Virtual GIF */
  
  /* Intel-defined CPU features, CPUID level 0x00000007:0 (ecx), word 16 */
  #define X86_FEATURE_AVX512VBMI  (16*32+ 1) /* AVX512 Vector Bit Manipulation instructions*/
