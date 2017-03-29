From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the kvms390 tree with the kvm-mips tree
Date: Wed, 29 Mar 2017 14:08:32 +1100
Message-ID: <20170329140832.5cbfb6ce@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:39969 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1752045AbdC2DIp (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Tue, 28 Mar 2017 23:08:45 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Christian Borntraeger <borntraeger@de.ibm.com>, Cornelia Huck <cornelia.huck@de.ibm.com>, James Hogan <james.hogan@imgtec.com>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Fan Zhang <zhangfan@linux.vnet.ibm.com>

Hi all,

Today's linux-next merge of the kvms390 tree got a conflict in:

  include/uapi/linux/kvm.h

between commits:

  a8a3c426772e ("KVM: MIPS: Add VZ & TE capabilities")
  578fd61d2d21 ("KVM: MIPS: Add 64BIT capability")

from the kvm-mips tree and commit:

  4e0b1ab72b8a ("KVM: s390: gs support for kvm guests")

from the kvms390 tree.

It looks like someone needs to arbitrate on these KVM_CAP_ numbers ...

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
index 1e1a6c728a18,c9d522765f8f..000000000000
--- a/include/uapi/linux/kvm.h
+++ b/include/uapi/linux/kvm.h
@@@ -887,9 -883,7 +887,10 @@@ struct kvm_ppc_resize_hpt 
  #define KVM_CAP_PPC_MMU_RADIX 134
  #define KVM_CAP_PPC_MMU_HASH_V3 135
  #define KVM_CAP_IMMEDIATE_EXIT 136
 -#define KVM_CAP_S390_GS 137
 +#define KVM_CAP_MIPS_VZ 137
 +#define KVM_CAP_MIPS_TE 138
 +#define KVM_CAP_MIPS_64BIT 139
++#define KVM_CAP_S390_GS 140
  
  #ifdef KVM_CAP_IRQ_ROUTING
  
