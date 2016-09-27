From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the kvm-arm tree with the tip tree
Date: Tue, 27 Sep 2016 13:46:31 +1000
Message-ID: <20160927134631.40e04c2a@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:60799 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1755546AbcI0Dqe (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Mon, 26 Sep 2016 23:46:34 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Christoffer Dall <cdall@cs.columbia.edu>, Marc Zyngier <marc.zyngier@arm.com>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>, "H. Peter Anvin" <hpa@zytor.com>, Peter Zijlstra <peterz@infradead.org>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Daniel Thompson <daniel.thompson@linaro.org>

Hi all,

Today's linux-next merge of the kvm-arm tree got a conflict in:

  arch/arm/include/asm/arch_gicv3.h

between commit:

  91ef84428a86 ("irqchip/gic-v3: Reset BPR during initialization")

from the tip tree and commit:

  3d9cd95f90b2 ("ARM: gic-v3: Work around definition of gic_write_bpr1")

from the kvm-arm tree.

I fixed it up (I just used the kvm-arm tree version) and can carry the
fix as necessary. This is now fixed as far as linux-next is concerned,
but any non trivial conflicts should be mentioned to your upstream
maintainer when your tree is submitted for merging.  You may also want
to consider cooperating with the maintainer of the conflicting tree to
minimise any particularly complex conflicts.



-- 
Cheers,
Stephen Rothwell
