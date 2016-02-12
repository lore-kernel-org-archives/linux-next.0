From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the kvm-arm tree with the arm64 tree
Date: Fri, 12 Feb 2016 13:26:16 +1100
Message-ID: <20160212132616.57973c38@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:45189 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751309AbcBLC0T (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Thu, 11 Feb 2016 21:26:19 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Christoffer Dall <cdall@cs.columbia.edu>, Marc Zyngier <marc.zyngier@arm.com>, Catalin Marinas <catalin.marinas@arm.com>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Ard Biesheuvel <ard.biesheuvel@linaro.org>

Hi all,

Today's linux-next merge of the kvm-arm tree got a conflict in:

  arch/arm/kvm/arm.c

between commit:

  6a26b548a2c4 ("arm64: kvm: deal with kernel symbols outside of linear mapping")

from the arm64 tree and commit:

  aa0bf2030bca ("ARM: KVM: Remove __kvm_hyp_code_start/__kvm_hyp_code_end")

from the kvm-arm tree.

I fixed it up (see below) and can carry the fix as necessary (no action
is required).

-- 
Cheers,
Stephen Rothwell

diff --cc arch/arm/kvm/arm.c
index 975da6cfbf59,fcf6c130c986..000000000000
--- a/arch/arm/kvm/arm.c
+++ b/arch/arm/kvm/arm.c
@@@ -982,9 -982,10 +982,10 @@@ static void cpu_init_hyp_mode(void *dum
  	pgd_ptr = kvm_mmu_get_httbr();
  	stack_page = __this_cpu_read(kvm_arm_hyp_stack_page);
  	hyp_stack_ptr = stack_page + PAGE_SIZE;
 -	vector_ptr = (unsigned long)__kvm_hyp_vector;
 +	vector_ptr = (unsigned long)kvm_ksym_ref(__kvm_hyp_vector);
  
  	__cpu_init_hyp_mode(boot_pgd_ptr, pgd_ptr, hyp_stack_ptr, vector_ptr);
+ 	__cpu_init_stage2();
  
  	kvm_arm_init_debug();
  }
@@@ -1074,8 -1075,7 +1075,8 @@@ static int init_hyp_mode(void
  	/*
  	 * Map the Hyp-code called directly from the host
  	 */
- 	err = create_hyp_mappings(kvm_ksym_ref(__kvm_hyp_code_start),
- 				  kvm_ksym_ref(__kvm_hyp_code_end));
 -	err = create_hyp_mappings(__hyp_text_start, __hyp_text_end);
++	err = create_hyp_mappings(kvm_ksym_ref(__hyp_text_start),
++				  kvm_ksym_ref(__hyp_text_end));
  	if (err) {
  		kvm_err("Cannot map world-switch code\n");
  		goto out_free_mappings;
