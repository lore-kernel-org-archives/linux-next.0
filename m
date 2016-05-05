From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the borntraeger tree with the kvms390
 tree
Date: Thu, 5 May 2016 14:23:22 +1000
Message-ID: <20160505142322.1b519280@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:51878 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1750905AbcEEEXZ (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Thu, 5 May 2016 00:23:25 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Christian Borntraeger <borntraeger@de.ibm.com>, Cornelia Huck <cornelia.huck@de.ibm.com>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Alexander Yarygin <yarygin@linux.vnet.ibm.com>

Hi Christian,

Today's linux-next merge of the borntraeger tree got a conflict in:

  arch/s390/kvm/kvm-s390.c

between commit:

  be7c9d7ba9e4 ("KVM: s390: Populate mask of non-hypervisor managed facility bits")

from the kvms390 tree and commit:

  5c14ad932491 ("KVM: halt_polling: provide a way to qualify wakeups during poll")

from the borntraeger tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

-- 
Cheers,
Stephen Rothwell

diff --cc arch/s390/kvm/kvm-s390.c
index c597201a5ca9,009a10e00e80..000000000000
--- a/arch/s390/kvm/kvm-s390.c
+++ b/arch/s390/kvm/kvm-s390.c
@@@ -2985,17 -2972,13 +2986,22 @@@ void kvm_arch_commit_memory_region(stru
  	return;
  }
  
 +static inline unsigned long nonhyp_mask(int i)
 +{
 +	unsigned int nonhyp_fai = (sclp.hmfai << i * 2) >> 30;
 +
 +	return 0x0000ffffffffffffUL >> (nonhyp_fai << 4);
 +}
 +
+ void kvm_arch_vcpu_block_finish(struct kvm_vcpu *vcpu)
+ {
+ 	vcpu->valid_wakeup = false;
+ }
+ 
  static int __init kvm_s390_init(void)
  {
 +	int i;
 +
  	if (!sclp.has_sief2) {
  		pr_info("SIE not available\n");
  		return -ENODEV;
