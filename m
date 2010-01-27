From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the kvm tree with Linus' tree
Date: Wed, 27 Jan 2010 12:57:30 +1100
Message-ID: <20100127125730.6fb414ec.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:59620 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1753477Ab0A0B5f (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Tue, 26 Jan 2010 20:57:35 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Avi Kivity <avi@qumranet.com>, Marcelo Tosatti <mtosatti@redhat.com>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Wei Yongjun <yjwei@cn.fujitsu.com>

Hi all,

Today's linux-next merge of the kvm tree got a conflict in
arch/x86/kvm/x86.c between commit
36cb93fd6b6bf7e9163a69a8bf20207aed5fea44 ("KVM: x86: Fix probable memory
leak of vcpu->arch.mce_banks") from Linus' tree and commit
kvm_arch_vcpu_uninit ("KVM: switch vcpu context to use SRCU") from the
kvm tree.

I fixed it up (I think ... see below) and can carry the fix for a while.
-- 
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au

diff --cc arch/x86/kvm/x86.c
index 1ddcad4,a311751..0000000
--- a/arch/x86/kvm/x86.c
+++ b/arch/x86/kvm/x86.c
@@@ -5089,11 -5468,12 +5469,13 @@@ fail
  
  void kvm_arch_vcpu_uninit(struct kvm_vcpu *vcpu)
  {
+ 	int idx;
+ 
 +	kfree(vcpu->arch.mce_banks);
  	kvm_free_lapic(vcpu);
- 	down_read(&vcpu->kvm->slots_lock);
+ 	idx = srcu_read_lock(&vcpu->kvm->srcu);
  	kvm_mmu_destroy(vcpu);
- 	up_read(&vcpu->kvm->slots_lock);
+ 	srcu_read_unlock(&vcpu->kvm->srcu, idx);
  	free_page((unsigned long)vcpu->arch.pio_data);
  }
  
