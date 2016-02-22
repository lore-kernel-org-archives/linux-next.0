From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the kvm-arm tree with the arm64 tree
Date: Mon, 22 Feb 2016 13:33:22 +1100
Message-ID: <20160222133322.04517906@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:35075 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752557AbcBVCdY (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Sun, 21 Feb 2016 21:33:24 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Christoffer Dall <cdall@cs.columbia.edu>, Marc Zyngier <marc.zyngier@arm.com>, Catalin Marinas <catalin.marinas@arm.com>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Ard Biesheuvel <ard.biesheuvel@linaro.org>

Hi all,

Today's linux-next merge of the kvm-arm tree got a conflict in:

  arch/arm64/kvm/hyp.S

between commit:

  a0bf9776cd0b ("arm64: kvm: deal with kernel symbols outside of linear mapping")

from the arm64 tree and commit:

  253dcab4c363 ("arm64: KVM: VHE: Patch out use of HVC")

from the kvm-arm tree.

I fixed it up (see below) and can carry the fix as necessary (no action
is required).

-- 
Cheers,
Stephen Rothwell

diff --cc arch/arm64/kvm/hyp.S
index 870578f84b1c,0689a74e6ba0..000000000000
--- a/arch/arm64/kvm/hyp.S
+++ b/arch/arm64/kvm/hyp.S
@@@ -17,10 -17,12 +17,12 @@@
  
  #include <linux/linkage.h>
  
+ #include <asm/alternative.h>
  #include <asm/assembler.h>
+ #include <asm/cpufeature.h>
  
  /*
 - * u64 kvm_call_hyp(void *hypfn, ...);
 + * u64 __kvm_call_hyp(void *hypfn, ...);
   *
   * This is not really a variadic function in the classic C-way and care must
   * be taken when calling this to ensure parameters are passed in registers
@@@ -37,7 -39,12 +39,12 @@@
   * used to implement __hyp_get_vectors in the same way as in
   * arch/arm64/kernel/hyp_stub.S.
   */
 -ENTRY(kvm_call_hyp)
 +ENTRY(__kvm_call_hyp)
+ alternative_if_not ARM64_HAS_VIRT_HOST_EXTN	
  	hvc	#0
  	ret
+ alternative_else
+ 	b	__vhe_hyp_call
+ 	nop
+ alternative_endif
 -ENDPROC(kvm_call_hyp)
 +ENDPROC(__kvm_call_hyp)
