From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the kvm-arm tree with the tip tree
Date: Wed, 20 Jul 2016 15:28:40 +1000
Message-ID: <20160720152840.79590a71@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:41216 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751598AbcGTF2m (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Wed, 20 Jul 2016 01:28:42 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Christoffer Dall <cdall@cs.columbia.edu>, Marc Zyngier <marc.zyngier@arm.com>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>, "H. Peter Anvin" <hpa@zytor.com>, Peter Zijlstra <peterz@infradead.org>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Anna-Maria Gleixner <anna-maria@linutronix.de>, Andre Przywara <andre.przywara@arm.com>

Hi all,

Today's linux-next merge of the kvm-arm tree got a conflict in:

  virt/kvm/kvm_main.c

between commit:

  8c18b2d2d088 ("virt: Convert kvm hotplug to state machine")

from the tip tree and commit:

  8a39d00670f0 ("KVM: kvm_io_bus: Add kvm_io_bus_get_dev() call")

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

diff --cc virt/kvm/kvm_main.c
index fee1f29043f8,bd2eb92c5d0e..000000000000
--- a/virt/kvm/kvm_main.c
+++ b/virt/kvm/kvm_main.c
@@@ -3532,6 -3496,34 +3532,30 @@@ int kvm_io_bus_unregister_dev(struct kv
  	return r;
  }
  
+ struct kvm_io_device *kvm_io_bus_get_dev(struct kvm *kvm, enum kvm_bus bus_idx,
+ 					 gpa_t addr)
+ {
+ 	struct kvm_io_bus *bus;
+ 	int dev_idx, srcu_idx;
+ 	struct kvm_io_device *iodev = NULL;
+ 
+ 	srcu_idx = srcu_read_lock(&kvm->srcu);
+ 
+ 	bus = srcu_dereference(kvm->buses[bus_idx], &kvm->srcu);
+ 
+ 	dev_idx = kvm_io_bus_get_first_dev(bus, addr, 1);
+ 	if (dev_idx < 0)
+ 		goto out_unlock;
+ 
+ 	iodev = bus->range[dev_idx].dev;
+ 
+ out_unlock:
+ 	srcu_read_unlock(&kvm->srcu, srcu_idx);
+ 
+ 	return iodev;
+ }
+ EXPORT_SYMBOL_GPL(kvm_io_bus_get_dev);
+ 
 -static struct notifier_block kvm_cpu_notifier = {
 -	.notifier_call = kvm_cpu_hotplug,
 -};
 -
  static int kvm_debugfs_open(struct inode *inode, struct file *file,
  			   int (*get)(void *, u64 *), int (*set)(void *, u64),
  			   const char *fmt)
