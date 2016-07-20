From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the kvm-arm tree with the tip tree
Date: Wed, 20 Jul 2016 15:21:17 +1000
Message-ID: <20160720152117.2c87afeb@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:46690 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1750917AbcGTFVU (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Wed, 20 Jul 2016 01:21:20 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Christoffer Dall <cdall@cs.columbia.edu>, Marc Zyngier <marc.zyngier@arm.com>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>, "H. Peter Anvin" <hpa@zytor.com>, Peter Zijlstra <peterz@infradead.org>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Shanker Donthineni <shankerd@codeaurora.org>, Andre Przywara <andre.przywara@arm.com>

Hi all,

Today's linux-next merge of the kvm-arm tree got a conflict in:

  include/linux/irqchip/arm-gic-v3.h

between commits:

  9347359ad0ae ("irqchip/gicv3-its: Split its_alloc_tables() into two functions")
  3faf24ea894a ("irqchip/gicv3-its: Implement two-level(indirect) device table support")

from the tip tree and commit:

  645b9e49a8c0 ("irqchip/gic-v3: Refactor and add GICv3 definitions")

from the kvm-arm tree.

I fixed it up (see below and I chose ULL over UL in the definition of
GITS_BASER_INDIRECT) and can carry the fix as necessary. This is now
fixed as far as linux-next is concerned, but any non trivial conflicts
should be mentioned to your upstream maintainer when your tree is
submitted for merging.  You may also want to consider cooperating with
the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

-- 
Cheers,
Stephen Rothwell

diff --cc include/linux/irqchip/arm-gic-v3.h
index 107eed475b94,700b4216c87a..000000000000
--- a/include/linux/irqchip/arm-gic-v3.h
+++ b/include/linux/irqchip/arm-gic-v3.h
@@@ -229,7 -300,7 +300,8 @@@
  #define GITS_BASER_PAGE_SIZE_64K	(2UL << GITS_BASER_PAGE_SIZE_SHIFT)
  #define GITS_BASER_PAGE_SIZE_MASK	(3UL << GITS_BASER_PAGE_SIZE_SHIFT)
  #define GITS_BASER_PAGES_MAX		256
 +#define GITS_BASER_PAGES_SHIFT		(0)
+ #define GITS_BASER_NR_PAGES(r)		(((r) & 0xff) + 1)
  
  #define GITS_BASER_TYPE_NONE		0
  #define GITS_BASER_TYPE_DEVICE		1
