From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the kvm-arm tree with the kvm tree
Date: Sun, 24 Jul 2016 16:04:31 +1000
Message-ID: <20160724160431.5c9ef32c@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Christoffer Dall <cdall@cs.columbia.edu>, Marc Zyngier <marc.zyngier@arm.com>, Marcelo Tosatti <mtosatti@redhat.com>, Gleb Natapov <gleb@kernel.org>, kvm@vger.kernel.org
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Radim =?UTF-8?B?S3LEjW3DocWZ?= <rkrcmar@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>, Eric Auger <eric.auger@redhat.com>
List-Id: linux-next.vger.kernel.org

Hi all,

Today's linux-next merge of the kvm-arm tree got a conflict in:

  virt/kvm/irqchip.c

between commit:

  c63cf538eb4b ("KVM: pass struct kvm to kvm_set_routing_entry")

from the kvm tree and commit:

  995a0ee9809b ("KVM: arm/arm64: Enable MSI routing")

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

diff --cc virt/kvm/irqchip.c
index df99e9c3b64d,c6202199e505..000000000000
--- a/virt/kvm/irqchip.c
+++ b/virt/kvm/irqchip.c
@@@ -208,15 -208,19 +209,19 @@@ int kvm_set_irq_routing(struct kvm *kvm
  			goto out;
  
  		r = -EINVAL;
- 		if (ue->flags) {
- 			kfree(e);
- 			goto out;
+ 		switch (ue->type) {
+ 		case KVM_IRQ_ROUTING_MSI:
+ 			if (ue->flags & ~KVM_MSI_VALID_DEVID)
+ 				goto free_entry;
+ 			break;
+ 		default:
+ 			if (ue->flags)
+ 				goto free_entry;
+ 			break;
  		}
 -		r = setup_routing_entry(new, e, ue);
 +		r = setup_routing_entry(kvm, new, e, ue);
- 		if (r) {
- 			kfree(e);
- 			goto out;
- 		}
+ 		if (r)
+ 			goto free_entry;
  		++ue;
  	}
  
