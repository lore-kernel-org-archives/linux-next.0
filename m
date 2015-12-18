From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the akpm-current tree with the kvm tree
Date: Fri, 18 Dec 2015 16:26:57 +1100
Message-ID: <20151218162657.6becb2dd@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:33319 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751484AbbLRF1F (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Fri, 18 Dec 2015 00:27:05 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Andrew Morton <akpm@linux-foundation.org>, Marcelo Tosatti <mtosatti@redhat.com>, Gleb Natapov <gleb@kernel.org>, kvm@vger.kernel.org
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Dan Williams <dan.j.williams@intel.com>, Takuya Yoshikawa <yoshikawa_takuya_b1@lab.ntt.co.jp>, Paolo Bonzini <pbonzini@redhat.com>

Hi Andrew,

Today's linux-next merge of the akpm-current tree got a conflict in:

  arch/x86/kvm/mmu.c

between commits:

  7ee0e5b29d27 ("KVM: x86: MMU: Remove unused parameter of __direct_map()")
  029499b47738 ("KVM: x86: MMU: Make mmu_set_spte() return emulate value")

from the kvm tree and commit:

  7fd3f3e7c320 ("kvm: rename pfn_t to kvm_pfn_t")

from the akpm-current tree.

I fixed it up (see below) and can carry the fix as necessary (no action
is required).

-- 
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au

diff --cc arch/x86/kvm/mmu.c
index a1a3d1907fdc,2dd83650d867..000000000000
--- a/arch/x86/kvm/mmu.c
+++ b/arch/x86/kvm/mmu.c
@@@ -2546,9 -2564,10 +2546,9 @@@ done
  	return ret;
  }
  
 -static void mmu_set_spte(struct kvm_vcpu *vcpu, u64 *sptep,
 -			 unsigned pte_access, int write_fault, int *emulate,
 -			 int level, gfn_t gfn, kvm_pfn_t pfn, bool speculative,
 -			 bool host_writable)
 +static bool mmu_set_spte(struct kvm_vcpu *vcpu, u64 *sptep, unsigned pte_access,
- 			 int write_fault, int level, gfn_t gfn, pfn_t pfn,
++			 int write_fault, int level, gfn_t gfn, kvm_pfn_t pfn,
 +			 bool speculative, bool host_writable)
  {
  	int was_rmapped = 0;
  	int rmap_count;
@@@ -2606,11 -2624,9 +2606,11 @@@
  	}
  
  	kvm_release_pfn_clean(pfn);
 +
 +	return emulate;
  }
  
- static pfn_t pte_prefetch_gfn_to_pfn(struct kvm_vcpu *vcpu, gfn_t gfn,
+ static kvm_pfn_t pte_prefetch_gfn_to_pfn(struct kvm_vcpu *vcpu, gfn_t gfn,
  				     bool no_dirty_log)
  {
  	struct kvm_memory_slot *slot;
@@@ -2691,8 -2708,9 +2691,8 @@@ static void direct_pte_prefetch(struct 
  	__direct_pte_prefetch(vcpu, sp, sptep);
  }
  
 -static int __direct_map(struct kvm_vcpu *vcpu, gpa_t v, int write,
 -			int map_writable, int level, gfn_t gfn, kvm_pfn_t pfn,
 -			bool prefault)
 +static int __direct_map(struct kvm_vcpu *vcpu, int write, int map_writable,
- 			int level, gfn_t gfn, pfn_t pfn, bool prefault)
++			int level, gfn_t gfn, kvm_pfn_t pfn, bool prefault)
  {
  	struct kvm_shadow_walk_iterator iterator;
  	struct kvm_mmu_page *sp;
