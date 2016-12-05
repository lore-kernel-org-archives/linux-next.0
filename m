From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the kvm-ppc-paulus tree with Linus'
 tree
Date: Mon, 5 Dec 2016 14:13:25 +1100
Message-ID: <20161205141325.4b05f028@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:48259 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1751120AbcLEDN2 (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Sun, 4 Dec 2016 22:13:28 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Paul Mackerras <paulus@ozlabs.org>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Nicholas Piggin <npiggin@gmail.com>, Michael Ellerman <mpe@ellerman.id.au>

Hi Paul,

Today's linux-next merge of the kvm-ppc-paulus tree got a conflict in:

  arch/powerpc/include/asm/asm-prototypes.h

between commit:

  9e5f68842276 ("powerpc: Fix missing CRCs, add more asm-prototypes.h declarations")

from Linus' tree and commit:

  e34af7849014 ("KVM: PPC: Book3S: Move prototypes for KVM functions into kvm_ppc.h")

from the kvm-ppc-paulus tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

-- 
Cheers,
Stephen Rothwell

diff --cc arch/powerpc/include/asm/asm-prototypes.h
index 96790ca8b5f5,d1492736d852..000000000000
--- a/arch/powerpc/include/asm/asm-prototypes.h
+++ b/arch/powerpc/include/asm/asm-prototypes.h
@@@ -13,13 -13,7 +13,10 @@@
   */
  
  #include <linux/threads.h>
 -#include <linux/kprobes.h>
 +#include <asm/cacheflush.h>
 +#include <asm/checksum.h>
 +#include <asm/uaccess.h>
 +#include <asm/epapr_hcalls.h>
- #ifdef CONFIG_KVM
- #include <linux/kvm_host.h>
- #endif
  
  #include <uapi/asm/ucontext.h>
  
@@@ -115,53 -109,4 +112,12 @@@ void early_setup_secondary(void)
  /* time */
  void accumulate_stolen_time(void);
  
 +/* misc runtime */
 +extern u64 __bswapdi2(u64);
 +extern s64 __lshrdi3(s64, int);
 +extern s64 __ashldi3(s64, int);
 +extern s64 __ashrdi3(s64, int);
 +extern int __cmpdi2(s64, s64);
 +extern int __ucmpdi2(u64, u64);
 +
- /* kvm */
- #ifdef CONFIG_KVM
- long kvmppc_rm_h_put_tce(struct kvm_vcpu *vcpu, unsigned long liobn,
- 			 unsigned long ioba, unsigned long tce);
- long kvmppc_rm_h_put_tce_indirect(struct kvm_vcpu *vcpu,
- 				  unsigned long liobn, unsigned long ioba,
- 				  unsigned long tce_list, unsigned long npages);
- long kvmppc_rm_h_stuff_tce(struct kvm_vcpu *vcpu,
- 			   unsigned long liobn, unsigned long ioba,
- 			   unsigned long tce_value, unsigned long npages);
- long int kvmppc_rm_h_confer(struct kvm_vcpu *vcpu, int target,
-                             unsigned int yield_count);
- long kvmppc_h_random(struct kvm_vcpu *vcpu);
- void kvmhv_commence_exit(int trap);
- long kvmppc_realmode_machine_check(struct kvm_vcpu *vcpu);
- void kvmppc_subcore_enter_guest(void);
- void kvmppc_subcore_exit_guest(void);
- long kvmppc_realmode_hmi_handler(void);
- long kvmppc_h_enter(struct kvm_vcpu *vcpu, unsigned long flags,
-                     long pte_index, unsigned long pteh, unsigned long ptel);
- long kvmppc_h_remove(struct kvm_vcpu *vcpu, unsigned long flags,
-                      unsigned long pte_index, unsigned long avpn);
- long kvmppc_h_bulk_remove(struct kvm_vcpu *vcpu);
- long kvmppc_h_protect(struct kvm_vcpu *vcpu, unsigned long flags,
-                       unsigned long pte_index, unsigned long avpn,
-                       unsigned long va);
- long kvmppc_h_read(struct kvm_vcpu *vcpu, unsigned long flags,
-                    unsigned long pte_index);
- long kvmppc_h_clear_ref(struct kvm_vcpu *vcpu, unsigned long flags,
-                         unsigned long pte_index);
- long kvmppc_h_clear_mod(struct kvm_vcpu *vcpu, unsigned long flags,
-                         unsigned long pte_index);
- long kvmppc_hpte_hv_fault(struct kvm_vcpu *vcpu, unsigned long addr,
-                           unsigned long slb_v, unsigned int status, bool data);
- unsigned long kvmppc_rm_h_xirr(struct kvm_vcpu *vcpu);
- int kvmppc_rm_h_ipi(struct kvm_vcpu *vcpu, unsigned long server,
-                     unsigned long mfrr);
- int kvmppc_rm_h_cppr(struct kvm_vcpu *vcpu, unsigned long cppr);
- int kvmppc_rm_h_eoi(struct kvm_vcpu *vcpu, unsigned long xirr);
- #endif
- 
  #endif /* _ASM_POWERPC_ASM_PROTOTYPES_H */
