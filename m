From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the mips tree with Linus' tree
Date: Mon, 25 Jan 2016 09:25:10 +1100
Message-ID: <20160125092510.50a6fb35@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Ralf Baechle <ralf@linux-mips.org>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Dan Williams <dan.j.williams@intel.com>, James Hogan <james.hogan@imgtec.com>
List-Id: linux-next.vger.kernel.org

Hi Ralf,

Today's linux-next merge of the mips tree got conflicts in:

  arch/mips/kvm/tlb.c

between commit:

  ba049e93aef7 ("kvm: rename pfn_t to kvm_pfn_t")

from Linus' tree and commit:

  cb1b447f0c36 ("MIPS: KVM: Convert EXPORT_SYMBOL to _GPL")

from the mips tree.

I fixed it up (see below) and can carry the fix as necessary (no action
is required).

-- 
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au

diff --cc arch/mips/kvm/tlb.c
index 570479c03bdc,0939b1d6f910..000000000000
--- a/arch/mips/kvm/tlb.c
+++ b/arch/mips/kvm/tlb.c
@@@ -35,17 -35,17 +35,17 @@@
  #define PRIx64 "llx"
  
  atomic_t kvm_mips_instance;
- EXPORT_SYMBOL(kvm_mips_instance);
+ EXPORT_SYMBOL_GPL(kvm_mips_instance);
  
  /* These function pointers are initialized once the KVM module is loaded */
 -pfn_t (*kvm_mips_gfn_to_pfn)(struct kvm *kvm, gfn_t gfn);
 +kvm_pfn_t (*kvm_mips_gfn_to_pfn)(struct kvm *kvm, gfn_t gfn);
- EXPORT_SYMBOL(kvm_mips_gfn_to_pfn);
+ EXPORT_SYMBOL_GPL(kvm_mips_gfn_to_pfn);
  
 -void (*kvm_mips_release_pfn_clean)(pfn_t pfn);
 +void (*kvm_mips_release_pfn_clean)(kvm_pfn_t pfn);
- EXPORT_SYMBOL(kvm_mips_release_pfn_clean);
+ EXPORT_SYMBOL_GPL(kvm_mips_release_pfn_clean);
  
 -bool (*kvm_mips_is_error_pfn)(pfn_t pfn);
 +bool (*kvm_mips_is_error_pfn)(kvm_pfn_t pfn);
- EXPORT_SYMBOL(kvm_mips_is_error_pfn);
+ EXPORT_SYMBOL_GPL(kvm_mips_is_error_pfn);
  
  uint32_t kvm_mips_get_kernel_asid(struct kvm_vcpu *vcpu)
  {
