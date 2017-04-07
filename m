From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the kvms390 tree with the kvm and
 kvm-ppc trees
Date: Fri, 7 Apr 2017 14:14:38 +1000
Message-ID: <20170407141438.6c88509c@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <kvm-owner@vger.kernel.org>
Sender: kvm-owner@vger.kernel.org
To: Christian Borntraeger <borntraeger@de.ibm.com>, Cornelia Huck <cornelia.huck@de.ibm.com>, Marcelo Tosatti <mtosatti@redhat.com>, Gleb Natapov <gleb@kernel.org>, KVM <kvm@vger.kernel.org>, Paul Mackerras <paulus@ozlabs.org>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Yi Min Zhao <zyimin@linux.vnet.ibm.com>, Fei Li <sherrylf@linux.vnet.ibm.com>, Fan Zhang <zhangfan@linux.vnet.ibm.com>, James Hogan <james.hogan@imgtec.com>, Alexey Kardashevskiy <aik@ozlabs.ru>
List-Id: linux-next.vger.kernel.org

Hi all,

Today's linux-next merge of the kvms390 tree got a conflict in:

  include/uapi/linux/kvm.h

between commits:

  a8a3c426772e ("KVM: MIPS: Add VZ & TE capabilities")
  578fd61d2d21 ("KVM: MIPS: Add 64BIT capability")

from the kvm tree, commit:

  2e60acebefd8 ("KVM: PPC: Reserve KVM_CAP_SPAPR_TCE_VFIO capability number")

from the kvm-ppc tree and commits

  4e0b1ab72b8a ("KVM: s390: gs support for kvm guests")
  1721ee7d57c4 ("KVM: s390: introduce AIS capability")

from the kvms390 tree.

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
index 1c7418d8f404,acfee5f4b5b2..000000000000
--- a/include/uapi/linux/kvm.h
+++ b/include/uapi/linux/kvm.h
@@@ -887,10 -883,9 +887,13 @@@ struct kvm_ppc_resize_hpt 
  #define KVM_CAP_PPC_MMU_RADIX 134
  #define KVM_CAP_PPC_MMU_HASH_V3 135
  #define KVM_CAP_IMMEDIATE_EXIT 136
 -#define KVM_CAP_S390_GS 137
 -#define KVM_CAP_S390_AIS 138
 +#define KVM_CAP_MIPS_VZ 137
 +#define KVM_CAP_MIPS_TE 138
 +#define KVM_CAP_MIPS_64BIT 139
 +#define KVM_CAP_SPAPR_TCE_VFIO 140
++#define KVM_CAP_S390_GS 141
++#define KVM_CAP_S390_AIS 142
+ #define KVM_CAP_S390_CMMA_MIGRATION 216
  
  #ifdef KVM_CAP_IRQ_ROUTING
  
