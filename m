From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the kvm-ppc tree with the kvm and
 kvm-arm trees
Date: Mon, 10 Apr 2017 14:10:16 +1000
Message-ID: <20170410141016.23c1cd81@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:50639 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1750722AbdDJEKU (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Mon, 10 Apr 2017 00:10:20 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Paul Mackerras <paulus@ozlabs.org>, Marcelo Tosatti <mtosatti@redhat.com>, Gleb Natapov <gleb@kernel.org>, KVM <kvm@vger.kernel.org>, Christoffer Dall <cdall@cs.columbia.edu>, Marc Zyngier <marc.zyngier@arm.com>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Alexey Kardashevskiy <aik@ozlabs.ru>, Alexander Graf <agraf@suse.de>, James Hogan <james.hogan@imgtec.com>

Hi Paul,

Today's linux-next merge of the kvm-ppc tree got a conflict in:

  include/uapi/linux/kvm.h

between commits:

  a8a3c426772e ("KVM: MIPS: Add VZ & TE capabilities")
  578fd61d2d21 ("KVM: MIPS: Add 64BIT capability")
  3fe17e682616 ("KVM: arm/arm64: Add ARM user space interrupt signaling ABI")

from the kvm and kvm-arm trees and commit:

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
index f46b8e317f84,0f8a5e6528aa..000000000000
--- a/include/uapi/linux/kvm.h
+++ b/include/uapi/linux/kvm.h
@@@ -887,10 -883,7 +887,11 @@@ struct kvm_ppc_resize_hpt 
  #define KVM_CAP_PPC_MMU_RADIX 134
  #define KVM_CAP_PPC_MMU_HASH_V3 135
  #define KVM_CAP_IMMEDIATE_EXIT 136
 -#define KVM_CAP_SPAPR_TCE_VFIO 137
 +#define KVM_CAP_MIPS_VZ 137
 +#define KVM_CAP_MIPS_TE 138
 +#define KVM_CAP_MIPS_64BIT 139
 +#define KVM_CAP_ARM_USER_IRQ 140
++#define KVM_CAP_SPAPR_TCE_VFIO 141
  
  #ifdef KVM_CAP_IRQ_ROUTING
  
