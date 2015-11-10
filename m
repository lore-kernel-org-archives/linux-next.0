From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the nvdimm tree with Linus' tree
Date: Tue, 10 Nov 2015 11:52:33 +1100
Message-ID: <20151110115233.4f96c0e9@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:58653 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751561AbbKJAwg (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Mon, 9 Nov 2015 19:52:36 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Dan Williams <dan.j.williams@intel.com>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Takuya Yoshikawa <yoshikawa_takuya_b1@lab.ntt.co.jp>, Paolo Bonzini <pbonzini@redhat.com>

Hi Dan,

Today's linux-next merge of the nvdimm tree got a conflict in:

  arch/x86/kvm/mmu.c

between commit:

  cd1872f02855 ("KVM: x86: MMU: Make force_pt_level bool")
  fd1369021878 ("KVM: x86: MMU: Move mapping_level_dirty_bitmap() call in mapping_level()")

from Linus' tree and commit:

  8ddcb353467a ("kvm: rename pfn_t to kvm_pfn_t")

from the nvdimm tree.

I fixed it up (see below) and can carry the fix as necessary (no action
is required).

-- 
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au

diff --cc arch/x86/kvm/mmu.c
index 7d85bcae3332,6ab963ae0427..000000000000
--- a/arch/x86/kvm/mmu.c
+++ b/arch/x86/kvm/mmu.c
@@@ -2982,8 -2963,8 +2983,8 @@@ static int nonpaging_map(struct kvm_vcp
  {
  	int r;
  	int level;
 -	int force_pt_level;
 +	bool force_pt_level = false;
- 	pfn_t pfn;
+ 	kvm_pfn_t pfn;
  	unsigned long mmu_seq;
  	bool map_writable, write = error_code & PFERR_WRITE_MASK;
  
@@@ -3491,10 -3474,10 +3492,10 @@@ check_hugepage_cache_consistency(struc
  static int tdp_page_fault(struct kvm_vcpu *vcpu, gva_t gpa, u32 error_code,
  			  bool prefault)
  {
- 	pfn_t pfn;
+ 	kvm_pfn_t pfn;
  	int r;
  	int level;
 -	int force_pt_level;
 +	bool force_pt_level;
  	gfn_t gfn = gpa >> PAGE_SHIFT;
  	unsigned long mmu_seq;
  	int write = error_code & PFERR_WRITE_MASK;
