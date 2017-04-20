From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the kvm-ppc tree with the kvm-arm tree
Date: Thu, 20 Apr 2017 13:36:46 +1000
Message-ID: <20170420133646.17d6794f@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:48035 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S937835AbdDTDgt (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Wed, 19 Apr 2017 23:36:49 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Paul Mackerras <paulus@ozlabs.org>, Christoffer Dall <cdall@cs.columbia.edu>, Marc Zyngier <marc.zyngier@arm.com>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Alexander Graf <agraf@suse.de>, Alexey Kardashevskiy <aik@ozlabs.ru>

Hi all,

Today's linux-next merge of the kvm-ppc tree got a conflict in:

  include/uapi/linux/kvm.h

between commit:

  3fe17e682616 ("KVM: arm/arm64: Add ARM user space interrupt signaling ABI")

from the kvm-arm tree and commit:

  4898d3f49b5b ("KVM: PPC: Reserve KVM_CAP_SPAPR_TCE_VFIO capability number")

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
index 5a147763a7df,3c168b6fd74b..000000000000
--- a/include/uapi/linux/kvm.h
+++ b/include/uapi/linux/kvm.h
@@@ -892,7 -892,7 +892,8 @@@ struct kvm_ppc_resize_hpt 
  #define KVM_CAP_MIPS_64BIT 139
  #define KVM_CAP_S390_GS 140
  #define KVM_CAP_S390_AIS 141
 -#define KVM_CAP_SPAPR_TCE_VFIO 142
 +#define KVM_CAP_ARM_USER_IRQ 142
++#define KVM_CAP_SPAPR_TCE_VFIO 143
  
  #ifdef KVM_CAP_IRQ_ROUTING
  
