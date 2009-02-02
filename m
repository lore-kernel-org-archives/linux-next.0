From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the kmemcheck tree with the  tree
Date: Mon, 2 Feb 2009 17:13:18 +1100
Message-ID: <20090202171318.16e1857e.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:35390 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751888AbZBBGNX (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Mon, 2 Feb 2009 01:13:23 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Vegard Nossum <vegard.nossum@gmail.com>, Pekka Enberg <penberg@cs.helsinki.fi>, Ingo Molnar <mingo@elte.hu>
Cc: linux-next@vger.kernel.org, Nick Piggin <npiggin@suse.de>

Hi all,

Today's linux-next merge of the kmemcheck tree got a conflict in
mm/Makefile between commit 32efb35b328d0e87fa5358239c54c889226cc6e7
("SLQB slab allocator (try 2)") from the slab tree and commit
e6df1035b1b488cafde1e69f1a25f2706c3ac1f7 ("kmemcheck: add mm functions")
from the kmemcheck tree.

Just trivial overlapping additions.  I fixed it up (see below) and can
carry the fix as necessary.
-- 
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

diff --cc mm/Makefile
index 658ba14,1d353e3..0000000
--- a/mm/Makefile
+++ b/mm/Makefile
@@@ -26,7 -26,7 +26,8 @@@ obj-$(CONFIG_SLOB) += slob.
  obj-$(CONFIG_MMU_NOTIFIER) += mmu_notifier.o
  obj-$(CONFIG_SLAB) += slab.o
  obj-$(CONFIG_SLUB) += slub.o
 +obj-$(CONFIG_SLQB) += slqb.o
+ obj-$(CONFIG_KMEMCHECK) += kmemcheck.o
  obj-$(CONFIG_FAILSLAB) += failslab.o
  obj-$(CONFIG_MEMORY_HOTPLUG) += memory_hotplug.o
  obj-$(CONFIG_FS_XIP) += filemap_xip.o
