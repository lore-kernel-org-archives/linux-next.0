From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the kvms390 tree with the kvm-arm tree
Date: Wed, 20 Jul 2016 15:34:37 +1000
Message-ID: <20160720153437.7cddb065@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:58679 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752267AbcGTFej (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Wed, 20 Jul 2016 01:34:39 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Christian Borntraeger <borntraeger@de.ibm.com>, Cornelia Huck <cornelia.huck@de.ibm.com>, Christoffer Dall <cdall@cs.columbia.edu>, Marc Zyngier <marc.zyngier@arm.com>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, David Hildenbrand <dahi@linux.vnet.ibm.com>, Andre Przywara <andre.przywara@arm.com>

Hi all,

Today's linux-next merge of the kvms390 tree got a conflict in:

  include/uapi/linux/kvm.h

between commit:

  2b8ddd9337ee ("KVM: Extend struct kvm_msi to hold a 32-bit device ID")

from the kvm-arm tree and commit:

  6502a34cfd66 ("KVM: s390: allow user space to handle instr 0x0000")

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
index 84d9e5f8ab4b,70941f4ab6d8..000000000000
--- a/include/uapi/linux/kvm.h
+++ b/include/uapi/linux/kvm.h
@@@ -867,7 -867,7 +867,8 @@@ struct kvm_ppc_smmu_info 
  #define KVM_CAP_VCPU_ATTRIBUTES 127
  #define KVM_CAP_MAX_VCPU_ID 128
  #define KVM_CAP_X2APIC_API 129
 -#define KVM_CAP_S390_USER_INSTR0 130
 +#define KVM_CAP_MSI_DEVID 130
++#define KVM_CAP_S390_USER_INSTR0 131
  
  #ifdef KVM_CAP_IRQ_ROUTING
  
