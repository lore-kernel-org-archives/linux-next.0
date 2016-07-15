From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the devicetree tree with the arc tree
Date: Fri, 15 Jul 2016 15:14:15 +1000
Message-ID: <20160715151415.048d6de8@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:44234 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751503AbcGOFOS (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Fri, 15 Jul 2016 01:14:18 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Rob Herring <robherring2@gmail.com>, Vineet Gupta <Vineet.Gupta1@synopsys.com>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Kefeng Wang <wangkefeng.wang@huawei.com>

Hi Rob,

Today's linux-next merge of the devicetree tree got a conflict in:

  arch/arc/kernel/setup.c

between commit:

  1ce0b5857f66 ("ARC: fix linux-next build breakage")

from the arc tree and commit:

  61c78644e7f1 ("arc: Remove unnecessary of_platform_populate with default match table")

from the devicetree tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

-- 
Cheers,
Stephen Rothwell

diff --cc arch/arc/kernel/setup.c
index 5f8c0b47045a,584c5f064ff3..000000000000
--- a/arch/arc/kernel/setup.c
+++ b/arch/arc/kernel/setup.c
@@@ -14,8 -14,6 +14,7 @@@
  #include <linux/module.h>
  #include <linux/cpu.h>
  #include <linux/of_fdt.h>
 +#include <linux/of.h>
- #include <linux/of_platform.h>
  #include <linux/cache.h>
  #include <asm/sections.h>
  #include <asm/arcregs.h>
