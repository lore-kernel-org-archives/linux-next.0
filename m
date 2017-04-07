From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the kvm-ppc tree with the kvm tree
Date: Fri, 7 Apr 2017 14:06:13 +1000
Message-ID: <20170407140613.52df3583@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <kvm-owner@vger.kernel.org>
Sender: kvm-owner@vger.kernel.org
To: Paul Mackerras <paulus@ozlabs.org>, Marcelo Tosatti <mtosatti@redhat.com>, Gleb Natapov <gleb@kernel.org>, KVM <kvm@vger.kernel.org>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Alexey Kardashevskiy <aik@ozlabs.ru>, James Hogan <james.hogan@imgtec.com>
List-Id: linux-next.vger.kernel.org

Hi Paul,

Today's linux-next merge of the kvm-ppc tree got a conflict in:

  include/uapi/linux/kvm.h

between commit:

  a8a3c426772e ("KVM: MIPS: Add VZ & TE capabilities")

from the kvm tree and commit:

  2e60acebefd8 ("KVM: PPC: Reserve KVM_CAP_SPAPR_TCE_VFIO capability number")

from the kvm-ppc tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

-- 
Cheers,
Stephen Rothwell

diff --cc include/uapi/linux/kvm.h
index 1e1a6c728a18,0f8a5e6528aa..000000000000
--- a/include/uapi/linux/kvm.h
+++ b/include/uapi/linux/kvm.h
@@@ -887,9 -883,7 +887,10 @@@ struct kvm_ppc_resize_hpt 
  #define KVM_CAP_PPC_MMU_RADIX 134
  #define KVM_CAP_PPC_MMU_HASH_V3 135
  #define KVM_CAP_IMMEDIATE_EXIT 136
 -#define KVM_CAP_SPAPR_TCE_VFIO 137
 +#define KVM_CAP_MIPS_VZ 137
 +#define KVM_CAP_MIPS_TE 138
 +#define KVM_CAP_MIPS_64BIT 139
++#define KVM_CAP_SPAPR_TCE_VFIO 140
  
  #ifdef KVM_CAP_IRQ_ROUTING
  
