From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the kvm tree with the tip tree
Date: Mon, 28 Aug 2017 14:52:09 +1000
Message-ID: <20170828145209.25a97c49@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:45373 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1750866AbdH1EwL (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Mon, 28 Aug 2017 00:52:11 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Marcelo Tosatti <mtosatti@redhat.com>, Gleb Natapov <gleb@kernel.org>, KVM <kvm@vger.kernel.org>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>, "H. Peter Anvin" <hpa@zytor.com>, Peter Zijlstra <peterz@infradead.org>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Radim =?UTF-8?B?S3LEjW3DocWZ?= <rkrcmar@redhat.com>, Brijesh Singh <brijesh.singh@amd.com>

Hi all,

Today's linux-next merge of the kvm tree got a conflict in:

  arch/x86/kvm/mmu.c

between commit:

  ea2800ddb20d ("kvm/x86: Avoid clearing the C-bit in rsvd_bits()")

from the tip tree and commit:

  d6321d493319 ("KVM: x86: generalize guest_cpuid_has_ helpers")

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

diff --cc arch/x86/kvm/mmu.c
index 04d750813c9d,2a8a6e3e2a31..000000000000
--- a/arch/x86/kvm/mmu.c
+++ b/arch/x86/kvm/mmu.c
@@@ -4116,21 -4157,11 +4162,21 @@@ reset_shadow_zero_bits_mask(struct kvm_
  	 * Passing "true" to the last argument is okay; it adds a check
  	 * on bit 8 of the SPTEs which KVM doesn't use anyway.
  	 */
 -	__reset_rsvds_bits_mask(vcpu, &context->shadow_zero_check,
 +	shadow_zero_check = &context->shadow_zero_check;
 +	__reset_rsvds_bits_mask(vcpu, shadow_zero_check,
  				boot_cpu_data.x86_phys_bits,
  				context->shadow_root_level, uses_nx,
- 				guest_cpuid_has_gbpages(vcpu), is_pse(vcpu),
- 				true);
+ 				guest_cpuid_has(vcpu, X86_FEATURE_GBPAGES),
+ 				is_pse(vcpu), true);
 +
 +	if (!shadow_me_mask)
 +		return;
 +
 +	for (i = context->shadow_root_level; --i >= 0;) {
 +		shadow_zero_check->rsvd_bits_mask[0][i] &= ~shadow_me_mask;
 +		shadow_zero_check->rsvd_bits_mask[1][i] &= ~shadow_me_mask;
 +	}
 +
  }
  EXPORT_SYMBOL_GPL(reset_shadow_zero_bits_mask);
  
