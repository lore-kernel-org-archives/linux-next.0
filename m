From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the kvm-arm tree with the arm64 tree
Date: Wed, 24 Feb 2016 13:38:43 +1100
Message-ID: <20160224133843.59859796@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:35986 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751957AbcBXCip (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Tue, 23 Feb 2016 21:38:45 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Christoffer Dall <cdall@cs.columbia.edu>, Marc Zyngier <marc.zyngier@arm.com>, Catalin Marinas <catalin.marinas@arm.com>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Ard Biesheuvel <ard.biesheuvel@linaro.org>

Hi all,

Today's linux-next merge of the kvm-arm tree got a conflict in:

  arch/arm64/include/asm/kvm_host.h

between commit:

  a0bf9776cd0b ("arm64: kvm: deal with kernel symbols outside of linear mapping")

from the arm64 tree and commit:

  67aaab4cff18 ("arm64: KVM: Move __cpu_init_stage2 after kvm_call_hyp")

from the kvm-arm tree.

This was an expected conflict (see the kvm-arm tree commit message.

I fixed it up (as expected - see below) and can carry the fix as necessary
(no action is required).

-- 
Cheers,
Stephen Rothwell

diff --cc arch/arm64/include/asm/kvm_host.h
index e3d67ff8798b,31fe7d6f32de..000000000000
--- a/arch/arm64/include/asm/kvm_host.h
+++ b/arch/arm64/include/asm/kvm_host.h
@@@ -343,6 -344,11 +344,11 @@@ void kvm_arm_setup_debug(struct kvm_vcp
  void kvm_arm_clear_debug(struct kvm_vcpu *vcpu);
  void kvm_arm_reset_debug_ptr(struct kvm_vcpu *vcpu);
  
 -/* #define kvm_call_hyp(f, ...) __kvm_call_hyp(kvm_ksym_ref(f), ##__VA_ARGS__) */
 +#define kvm_call_hyp(f, ...) __kvm_call_hyp(kvm_ksym_ref(f), ##__VA_ARGS__)
  
+ static inline void __cpu_init_stage2(void)
+ {
+ 	kvm_call_hyp(__init_stage2_translation);
+ }
+ 
  #endif /* __ARM64_KVM_HOST_H__ */
