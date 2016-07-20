From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the kvm-arm tree with the kvm tree
Date: Wed, 20 Jul 2016 15:27:56 +1000
Message-ID: <20160720152756.0b937ddb@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:40612 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751123AbcGTF17 (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Wed, 20 Jul 2016 01:27:59 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Christoffer Dall <cdall@cs.columbia.edu>, Marc Zyngier <marc.zyngier@arm.com>, Marcelo Tosatti <mtosatti@redhat.com>, Gleb Natapov <gleb@kernel.org>, kvm@vger.kernel.org
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Radim =?UTF-8?B?S3LEjW3DocWZ?= <rkrcmar@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>, Andre Przywara <andre.przywara@arm.com>

Hi all,

Today's linux-next merge of the kvm-arm tree got a conflict in:

  include/uapi/linux/kvm.h

between commit:

  3713131345fb ("KVM: x86: add KVM_CAP_X2APIC_API")

from the kvm tree and commit:

  2b8ddd9337ee ("KVM: Extend struct kvm_msi to hold a 32-bit device ID")

from the kvm-arm tree.

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
index 4f8030e5b05d,d8c4c324cfae..000000000000
--- a/include/uapi/linux/kvm.h
+++ b/include/uapi/linux/kvm.h
@@@ -866,7 -866,7 +866,8 @@@ struct kvm_ppc_smmu_info 
  #define KVM_CAP_ARM_PMU_V3 126
  #define KVM_CAP_VCPU_ATTRIBUTES 127
  #define KVM_CAP_MAX_VCPU_ID 128
 -#define KVM_CAP_MSI_DEVID 129
 +#define KVM_CAP_X2APIC_API 129
++#define KVM_CAP_MSI_DEVID 130
  
  #ifdef KVM_CAP_IRQ_ROUTING
  
