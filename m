From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the kvm tree with the tip tree
Date: Fri, 25 Aug 2017 14:39:30 +1000
Message-ID: <20170825143930.494744fe@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Marcelo Tosatti <mtosatti@redhat.com>, Gleb Natapov <gleb@kernel.org>, KVM <kvm@vger.kernel.org>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>, "H. Peter Anvin" <hpa@zytor.com>, Peter Zijlstra <peterz@infradead.org>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Tom Lendacky <thomas.lendacky@amd.com>, Yu Zhang <yu.c.zhang@linux.intel.com>, Paolo Bonzini <pbonzini@redhat.com>
List-Id: linux-next.vger.kernel.org

Hi all,

Today's linux-next merge of the kvm tree got a conflict in:

  arch/x86/kvm/mmu.h

between commit:

  d0ec49d4de90 ("kvm/x86/svm: Support Secure Memory Encryption within KVM")

from the tip tree and commit:

  d1cd3ce90044 ("KVM: MMU: check guest CR3 reserved bits based on its physical address width.")

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

diff --cc arch/x86/kvm/mmu.h
index 3cc725590ab9,e2999f57bfc4..000000000000
--- a/arch/x86/kvm/mmu.h
+++ b/arch/x86/kvm/mmu.h
@@@ -48,7 -49,10 +49,10 @@@
  
  static inline u64 rsvd_bits(int s, int e)
  {
+ 	if (e < s)
+ 		return 0;
+ 
 -	return ((1ULL << (e - s + 1)) - 1) << s;
 +	return __sme_clr(((1ULL << (e - s + 1)) - 1) << s);
  }
  
  void kvm_mmu_set_mmio_spte_mask(u64 mmio_mask, u64 mmio_value);
