From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the kvm-arm tree with the kvm tree
Date: Fri, 16 Oct 2015 14:53:00 +1100
Message-ID: <20151016145300.7f03fbcb@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Christoffer Dall <cdall@cs.columbia.edu>, Marc Zyngier <marc.zyngier@arm.com>, Marcelo Tosatti <mtosatti@redhat.com>, Gleb Natapov <gleb@kernel.org>, kvm@vger.kernel.org
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Feng Wu <feng.wu@intel.com>, Paolo Bonzini <pbonzini@redhat.com>, Christian Borntraeger <borntraeger@de.ibm.com>, Cornelia Huck <cornelia.huck@de.ibm.com>
List-Id: linux-next.vger.kernel.org

Hi all,

Today's linux-next merge of the kvm-arm tree got a conflict in:

  arch/x86/include/asm/kvm_host.h

between commit:

  d84f1e0755ba ("KVM: make kvm_set_msi_irq() public")

from the kvm tree and commits:

  8feb4a04dc75 ("KVM: Define a new interface kvm_intr_is_single_vcpu()")
  8fc52eb9cee4 ("KVM: Add kvm_arch_vcpu_{un}blocking callbacks")

from the kvm-arm tree.

I fixed it up (see below) and can carry the fix as necessary (no action
is required).

-- 
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au

diff --cc arch/x86/include/asm/kvm_host.h
index 53deb2750bf6,b926137d591f..000000000000
--- a/arch/x86/include/asm/kvm_host.h
+++ b/arch/x86/include/asm/kvm_host.h
@@@ -1256,9 -1232,7 +1256,13 @@@ int x86_set_memory_region(struct kvm *k
  bool kvm_vcpu_is_reset_bsp(struct kvm_vcpu *vcpu);
  bool kvm_vcpu_is_bsp(struct kvm_vcpu *vcpu);
  
 +bool kvm_intr_is_single_vcpu(struct kvm *kvm, struct kvm_lapic_irq *irq,
 +			     struct kvm_vcpu **dest_vcpu);
 +
 +void kvm_set_msi_irq(struct kvm_kernel_irq_routing_entry *e,
 +		     struct kvm_lapic_irq *irq);
++
+ static inline void kvm_arch_vcpu_blocking(struct kvm_vcpu *vcpu) {}
+ static inline void kvm_arch_vcpu_unblocking(struct kvm_vcpu *vcpu) {}
+ 
  #endif /* _ASM_X86_KVM_HOST_H */
