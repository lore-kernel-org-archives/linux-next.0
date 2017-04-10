From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the kvms390 tree with the kvm, kvm-arm
 and kvm-ppc trees
Date: Mon, 10 Apr 2017 14:17:59 +1000
Message-ID: <20170410141759.27040704@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:60681 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1750722AbdDJESC (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Mon, 10 Apr 2017 00:18:02 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Christian Borntraeger <borntraeger@de.ibm.com>, Cornelia Huck <cornelia.huck@de.ibm.com>, Marcelo Tosatti <mtosatti@redhat.com>, Gleb Natapov <gleb@kernel.org>, KVM <kvm@vger.kernel.org>, Christoffer Dall <cdall@cs.columbia.edu>, Marc Zyngier <marc.zyngier@arm.com>, Paul Mackerras <paulus@ozlabs.org>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, James Hogan <james.hogan@imgtec.com>, Alexander Graf <agraf@suse.de>, Alexey Kardashevskiy <aik@ozlabs.ru>, Yi Min Zhao <zyimin@linux.vnet.ibm.com>, Fan Zhang <zhangfan@linux.vnet.ibm.com>, Fei Li <sherrylf@linux.vnet.ibm.com>

Hi all,

Today's linux-next merge of the kvms390 tree got a conflict in:

  include/uapi/linux/kvm.h

between commits:

  a8a3c426772e ("KVM: MIPS: Add VZ & TE capabilities")
  578fd61d2d21 ("KVM: MIPS: Add 64BIT capability")
  3fe17e682616 ("KVM: arm/arm64: Add ARM user space interrupt signaling ABI")
  2e60acebefd8 ("KVM: PPC: Reserve KVM_CAP_SPAPR_TCE_VFIO capability number")

from the kvm, kvm-arm and kvm-ppc trees and commits:

  4e0b1ab72b8a ("KVM: s390: gs support for kvm guests")
  47a4693e1d3e ("KVM: s390: introduce AIS capability")

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
index 7bf2f99ebe5a,33dd2a4e36dc..000000000000
--- a/include/uapi/linux/kvm.h
+++ b/include/uapi/linux/kvm.h
@@@ -887,11 -883,8 +887,13 @@@ struct kvm_ppc_resize_hpt 
  #define KVM_CAP_PPC_MMU_RADIX 134
  #define KVM_CAP_PPC_MMU_HASH_V3 135
  #define KVM_CAP_IMMEDIATE_EXIT 136
 -#define KVM_CAP_S390_GS 137
 -#define KVM_CAP_S390_AIS 138
 +#define KVM_CAP_MIPS_VZ 137
 +#define KVM_CAP_MIPS_TE 138
 +#define KVM_CAP_MIPS_64BIT 139
 +#define KVM_CAP_ARM_USER_IRQ 140
 +#define KVM_CAP_SPAPR_TCE_VFIO 141
++#define KVM_CAP_S390_GS 142
++#define KVM_CAP_S390_AIS 143
  
  #ifdef KVM_CAP_IRQ_ROUTING
  
