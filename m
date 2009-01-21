From: Heiko Carstens <heiko.carstens@de.ibm.com>
Subject: [PATCH] sysrq: include interrupt.h instead of irq.h
Date: Wed, 21 Jan 2009 14:49:18 +0100
Message-ID: <1232545758.31303.2.camel@osiris.boeblingen.de.ibm.com>
References: <20090121150249.a87aca09.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner+glk-linux-kernel-3=40m.gmane.org-S1759437AbZAUNu4@vger.kernel.org>
In-Reply-To: <20090121150249.a87aca09.sfr@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>, Andrew Morton <akpm@linux-foundation.org>, Mike Travis <travis@sgi.com>
Cc: linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, Martin Schwidefsky <schwidefsky@de.ibm.com>
List-Id: linux-next.vger.kernel.org

From: Heiko Carstens <heiko.carstens@de.ibm.com>

With "cpumask: update irq_desc to use cpumask_var_t" in linux-next
we get this compile bug on s390:

  CC      drivers/char/sysrq.o
In file included from drivers/char/sysrq.c:38:
include/linux/irq.h: In function 'init_alloc_desc_masks':
include/linux/irq.h:442: error: dereferencing pointer to incomplete type

drivers/char/sysrq.c should include interrupt.h instead of irq.h.

Cc: Mike Travis <travis@sgi.com>
Cc: Martin Schwidefsky <schwidefsky@de.ibm.com>
Signed-off-by: Heiko Carstens <heiko.carstens@de.ibm.com>
---
 drivers/char/sysrq.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

Index: linux-next/drivers/char/sysrq.c
===================================================================
--- linux-next.orig/drivers/char/sysrq.c
+++ linux-next/drivers/char/sysrq.c
@@ -35,7 +35,7 @@
 #include <linux/vt_kern.h>
 #include <linux/workqueue.h>
 #include <linux/kexec.h>
-#include <linux/irq.h>
+#include <linux/interrupt.h>
 #include <linux/hrtimer.h>
 #include <linux/oom.h>
 
