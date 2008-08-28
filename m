From: Ingo Molnar <mingo@elte.hu>
Subject: Re: linux-next: m68k build failure
Date: Thu, 28 Aug 2008 08:59:07 +0200
Message-ID: <20080828065907.GD16186@elte.hu>
References: <20080828165004.4d833de6.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mx3.mail.elte.hu ([157.181.1.138]:43238 "EHLO mx3.mail.elte.hu"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751984AbYH1G7U (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Thu, 28 Aug 2008 02:59:20 -0400
Content-Disposition: inline
In-Reply-To: <20080828165004.4d833de6.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>, linux-next@vger.kernel.org, Yinghai Lu <yhlu.kernel@gmail.com>


* Stephen Rothwell <sfr@canb.auug.org.au> wrote:

> Hi Geert,
> 
> The m68k allmodconfig build of linux-next (next-20080827) failed like
> this:
> 
> ERROR: "nr_irqs" [drivers/serial/serial_core.ko] undefined!
> ERROR: "nr_irqs" [drivers/serial/8250.ko] undefined!
> ERROR: "nr_irqs" [drivers/net/hamradio/baycom_ser_fdx.ko] undefined!
> 
> Introduced by the sparseirq tree.
> 
> nr_irqs is not exported for m68k.  I will add a patch to add the 
> export to linux-next today.

should be fixed by the patch below (also pushed out into the sparseirq 
tree). Thanks,

	Ingo

--------------->
>From 3af7043c57080f1ae7cd80c661d3e1308f164e1b Mon Sep 17 00:00:00 2001
From: Ingo Molnar <mingo@elte.hu>
Date: Thu, 28 Aug 2008 08:56:33 +0200
Subject: [PATCH] sparseirq: export nr_irqs on m68k/sparc/s390

Stephen Rothwell reported such build failures on m68k/sparc/s390:

> ERROR: "nr_irqs" [drivers/net/hamradio/baycom_ser_fdx.ko] undefined!
> ERROR: "nr_irqs" [drivers/net/3c59x.ko] undefined!

export nr_irqs on these architectures too.

Reported-by: Stephen Rothwell <sfr@canb.auug.org.au>
Signed-off-by: Ingo Molnar <mingo@elte.hu>
---
 arch/m68k/kernel/ints.c |    1 +
 arch/s390/kernel/irq.c  |    1 +
 arch/sparc/kernel/irq.c |    1 +
 3 files changed, 3 insertions(+), 0 deletions(-)

diff --git a/arch/m68k/kernel/ints.c b/arch/m68k/kernel/ints.c
index d8aebfc..8dd5591 100644
--- a/arch/m68k/kernel/ints.c
+++ b/arch/m68k/kernel/ints.c
@@ -47,6 +47,7 @@
 #endif
 
 int nr_irqs = NR_IRQS;
+EXPORT_SYMBOL(nr_irqs);
 
 extern u32 auto_irqhandler_fixup[];
 extern u32 user_irqhandler_fixup[];
diff --git a/arch/s390/kernel/irq.c b/arch/s390/kernel/irq.c
index 14eb549..3624c4a 100644
--- a/arch/s390/kernel/irq.c
+++ b/arch/s390/kernel/irq.c
@@ -18,6 +18,7 @@
 #include <linux/profile.h>
 
 int nr_irqs = NR_IRQS;
+EXPORT_SYMBOL(nr_irqs);
 
 /*
  * show_interrupts is needed by /proc/interrupts.
diff --git a/arch/sparc/kernel/irq.c b/arch/sparc/kernel/irq.c
index 059598b..4b99e3c 100644
--- a/arch/sparc/kernel/irq.c
+++ b/arch/sparc/kernel/irq.c
@@ -57,6 +57,7 @@
 #endif /* SMP */
 
 int nr_irqs = NR_IRQS;
+EXPORT_SYMBOL(nr_irqs);
 
 unsigned long __raw_local_irq_save(void)
 {
