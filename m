From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the kvms390 tree with the kvm-ppc tree
Date: Thu, 29 Jun 2017 13:37:52 +1000
Message-ID: <20170629133752.294bef54@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:34411 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1751602AbdF2Dhz (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Wed, 28 Jun 2017 23:37:55 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Christian Borntraeger <borntraeger@de.ibm.com>, Cornelia Huck <cornelia.huck@de.ibm.com>, Paul Mackerras <paulus@ozlabs.org>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Aravinda Prasad <aravinda@linux.vnet.ibm.com>, Claudio Imbrenda <imbrenda@linux.vnet.ibm.com>, Marcelo Tosatti <mtosatti@redhat.com>, Gleb Natapov <gleb@kernel.org>, KVM <kvm@vger.kernel.org>

Hi all,

Today's linux-next merge of the kvms390 tree got a conflict in:

  include/uapi/linux/kvm.h

between commits:

  134764ed6e12 ("KVM: PPC: Book3S HV: Add new capability to control MCE behaviour")
  2ed4f9dd19c0 ("KVM: PPC: Book3S HV: Add capability to report possible virtual SMT modes")

from the kvm-ppc tree and commit:

  4036e3874a1c ("KVM: s390: ioctls to get and set guest storage attributes")

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
index 36ea74aa3422,2b8dc1ca18d4..000000000000
--- a/include/uapi/linux/kvm.h
+++ b/include/uapi/linux/kvm.h
@@@ -895,8 -924,7 +924,9 @@@ struct kvm_ppc_resize_hpt 
  #define KVM_CAP_SPAPR_TCE_VFIO 142
  #define KVM_CAP_X86_GUEST_MWAIT 143
  #define KVM_CAP_ARM_USER_IRQ 144
 -#define KVM_CAP_S390_CMMA_MIGRATION 145
 +#define KVM_CAP_PPC_FWNMI 145
 +#define KVM_CAP_PPC_SMT_POSSIBLE 146
++#define KVM_CAP_S390_CMMA_MIGRATION 147
  
  #ifdef KVM_CAP_IRQ_ROUTING
  
