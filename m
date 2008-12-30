From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the kmemcheck tree
Date: Tue, 30 Dec 2008 23:14:52 +1100
Message-ID: <20081230231452.8c8b9c58.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:52306 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751683AbYL3MOz (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Tue, 30 Dec 2008 07:14:55 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Vegard Nossum <vegard.nossum@gmail.com>, Pekka Enberg <penberg@cs.helsinki.fi>, Ingo Molnar <mingo@elte.hu>
Cc: linux-next@vger.kernel.org, Akinobu Mita <akinobu.mita@gmail.com>

Hi all,

Today's linux-next merge of the kmemcheck tree got a conflict in
mm/Makefile between commit 773ff60e841461cb1f9374a713ffcda029b8c317
("SLUB: failslab support") from the slab tree and commit
e6df1035b1b488cafde1e69f1a25f2706c3ac1f7 ("kmemcheck: add mm functions")
from the kmemcheck tree.

I fixed it up (see below) and can carry the fix as necessary.
-- 
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

diff --cc mm/Makefile
index 51c2770,399aaf1..0000000
--- a/mm/Makefile
+++ b/mm/Makefile
@@@ -28,7 -28,7 +28,8 @@@ obj-$(CONFIG_SLOB) += slob.
  obj-$(CONFIG_MMU_NOTIFIER) += mmu_notifier.o
  obj-$(CONFIG_SLAB) += slab.o
  obj-$(CONFIG_SLUB) += slub.o
 +obj-$(CONFIG_FAILSLAB) += failslab.o
+ obj-$(CONFIG_KMEMCHECK) += kmemcheck.o
  obj-$(CONFIG_MEMORY_HOTPLUG) += memory_hotplug.o
  obj-$(CONFIG_FS_XIP) += filemap_xip.o
  obj-$(CONFIG_MIGRATION) += migrate.o
