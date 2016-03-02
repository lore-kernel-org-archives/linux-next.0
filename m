From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the kvm-ppc-paulus tree with the
 kvm-arm tree
Date: Wed, 2 Mar 2016 13:47:14 +1100
Message-ID: <20160302134714.2629ee08@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:33084 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752132AbcCBCrR (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Tue, 1 Mar 2016 21:47:17 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Paul Mackerras <paulus@ozlabs.org>, Christoffer Dall <cdall@cs.columbia.edu>, Marc Zyngier <marc.zyngier@arm.com>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Alexey Kardashevskiy <aik@ozlabs.ru>, Shannon Zhao <shannon.zhao@linaro.org>

Hi Paul,

Today's linux-next merge of the kvm-ppc-paulus tree got a conflict in:

  include/uapi/linux/kvm.h

between commits:

  808e738142e7 ("arm64: KVM: Add a new feature bit for PMUv3")
  f577f6c2a6a5 ("arm64: KVM: Introduce per-vcpu kvm device controls")

from the kvm-arm tree and commit:

  01d01d69192e ("KVM: PPC: Reserve KVM_CAP_SPAPR_TCE_64 capability number")

from the kvm-ppc-paulus tree.

I fixed it up (see below) and can carry the fix as necessary (no action
is required).

-- 
Cheers,
Stephen Rothwell

diff --cc include/uapi/linux/kvm.h
index ba098d8ae5fc,b06208b2669c..000000000000
--- a/include/uapi/linux/kvm.h
+++ b/include/uapi/linux/kvm.h
@@@ -862,8 -850,7 +862,9 @@@ struct kvm_ppc_smmu_info 
  #define KVM_CAP_IOEVENTFD_ANY_LENGTH 122
  #define KVM_CAP_HYPERV_SYNIC 123
  #define KVM_CAP_S390_RI 124
 -#define KVM_CAP_SPAPR_TCE_64 125
 +#define KVM_CAP_ARM_PMU_V3 125
 +#define KVM_CAP_VCPU_ATTRIBUTES 126
++#define KVM_CAP_SPAPR_TCE_64 127
  
  #ifdef KVM_CAP_IRQ_ROUTING
  
