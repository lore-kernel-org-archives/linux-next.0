From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: origin tree build failure
Date: Thu, 10 Dec 2009 10:57:03 +1100
Message-ID: <20091210105703.3e62245d.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:35668 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1758706AbZLIX46 (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Wed, 9 Dec 2009 18:56:58 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Frederic Weisbecker <fweisbec@gmail.com>, Thomas Gleixner <tglx@linutronix.de>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>, Linus <torvalds@linux-foundation.org>

Hi all,

Today's linux-next build (x86_64 allmodconfig) failed like this:

drivers/char/nvram.c: In function 'nvram_open':
drivers/char/nvram.c:332: error: implicit declaration of function 'lock_kernel'
drivers/char/nvram.c:339: error: implicit declaration of function 'unlock_kernel'

Caused by commit 9e8ab74ddaa591575f599248080a1f0d917a56ee ("nvram: Drop
the bkl from non-generic nvram_llseek()").

I do wonder why I never saw this commit in linux-next ...

I have added this the patch you posted to lkml:

From: Frederic Weisbecker <fweisbec@gmail.com>
Date: Wed, 9 Dec 2009 18:31:53 +0100
Subject: [PATCH] nvram: Fix missing smp_lock.h in nvram

The bkl has been removed from nvram_llseek() and smp_lock.h was
removed because another patch in the same tree zapped the remaining
usage of bkl in the same file. But this patch must have been excluded
later, then we still need the smp_lock.h headers for the bkl use
in nvram_open().

This fixes the following build error:

drivers/char/nvram.c: In function _nvram_open_:
drivers/char/nvram.c:332: erreur: implicit declaration of function _lock_kernel_
drivers/char/nvram.c:339: erreur: implicit declaration of function
_unlock_kernel_
make[2]: *** [drivers/char/nvram.o] Erreur 1
make[1]: *** [drivers/char] Erreur 2
make: *** [drivers] Erreur 2

Signed-off-by: Frederic Weisbecker <fweisbec@gmail.com>
---
 drivers/char/nvram.c |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/drivers/char/nvram.c b/drivers/char/nvram.c
index 2100a8f..4008e2c 100644
--- a/drivers/char/nvram.c
+++ b/drivers/char/nvram.c
@@ -110,6 +110,7 @@
 #include <linux/spinlock.h>
 #include <linux/io.h>
 #include <linux/uaccess.h>
+#include <linux/smp_lock.h>

 #include <asm/system.h>

-- 
1.6.2.3

-- 
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/
