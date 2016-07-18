From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the kvm-arm tree with the tip tree
Date: Mon, 18 Jul 2016 16:09:36 +1000
Message-ID: <20160718160936.7bd0c4c9@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:45259 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1750732AbcGRGJj (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Mon, 18 Jul 2016 02:09:39 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Christoffer Dall <cdall@cs.columbia.edu>, Marc Zyngier <marc.zyngier@arm.com>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>, "H. Peter Anvin" <hpa@zytor.com>, Peter Zijlstra <peterz@infradead.org>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Richard Cochran <rcochran@linutronix.de>, Anna-Maria Gleixner <anna-maria@linutronix.de>

Hi all,

Today's linux-next merge of the kvm-arm tree got a conflict in:

  virt/kvm/arm/vgic.c

between commit:

  42ec50b5f257 ("arm/kvm/vgic: Convert to hotplug state machine")

from the tip tree and commit:

  50926d82fa27 ("KVM: arm/arm64: The GIC is dead, long live the GIC")

from the kvm-arm tree.

I fixed it up (the latter removed the file, so I did that -
CPUHP_AP_KVM_ARM_VGIC_STARTING should probably be removed as well) and
can carry the fix as necessary. This is now fixed as far as linux-next
is concerned, but any non trivial conflicts should be mentioned to your
upstream maintainer when your tree is submitted for merging.  You may
also want to consider cooperating with the maintainer of the conflicting
tree to minimise any particularly complex conflicts.

-- 
Cheers,
Stephen Rothwell
