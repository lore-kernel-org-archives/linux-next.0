From: Paul Mundt <lethal@linux-sh.org>
Subject: [PATCH -next] lib: Move find_last_bit.o to obj-y to enable use by modules.
Date: Thu, 16 Apr 2009 12:07:04 +0900
Message-ID: <20090416030704.GH16961@linux-sh.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from 124x34x33x190.ap124.ftth.ucom.ne.jp ([124.34.33.190]:37482 "EHLO
	master.linux-sh.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751212AbZDPDME (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Wed, 15 Apr 2009 23:12:04 -0400
Content-Disposition: inline
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: linux-next@vger.kernel.org
Cc: Benny Halevy <bhalevy@panasas.com>, Andy Adamson <andros@netapp.com>, Trond Myklebust <Trond.Myklebust@netapp.com>

Caught with the sh allmodconfig:

	ERROR: "find_last_bit" [fs/nfs/nfs.ko] undefined!
	make[2]: *** [__modpost] Error 1
	make[1]: *** [modules] Error 2
	make: *** [sub-make] Error 2

find_last_bit.o is currently built with lib-y, which ends up breaking
the nfs module build after the ("nfs41: free slot") commit. Move it
to obj-y so the EXPORT_SYMBOL() actually has some effect.

Signed-off-by: Paul Mundt <lethal@linux-sh.org>
Cc: Benny Halevy <bhalevy@panasas.com>
Cc: Andy Adamson <andros@netapp.com>
Cc: Trond Myklebust <Trond.Myklebust@netapp.com>

---

diff --git a/lib/Makefile b/lib/Makefile
index d6edd67..33a40e4 100644
--- a/lib/Makefile
+++ b/lib/Makefile
@@ -38,7 +38,7 @@ lib-$(CONFIG_RWSEM_GENERIC_SPINLOCK) += rwsem-spinlock.o
 lib-$(CONFIG_RWSEM_XCHGADD_ALGORITHM) += rwsem.o
 lib-$(CONFIG_GENERIC_FIND_FIRST_BIT) += find_next_bit.o
 lib-$(CONFIG_GENERIC_FIND_NEXT_BIT) += find_next_bit.o
-lib-$(CONFIG_GENERIC_FIND_LAST_BIT) += find_last_bit.o
+obj-$(CONFIG_GENERIC_FIND_LAST_BIT) += find_last_bit.o
 obj-$(CONFIG_GENERIC_HWEIGHT) += hweight.o
 obj-$(CONFIG_LOCK_KERNEL) += kernel_lock.o
 obj-$(CONFIG_DEBUG_PREEMPT) += smp_processor_id.o
