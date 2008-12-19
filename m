From: Ingo Molnar <mingo@elte.hu>
Subject: Re: [PATCH] sparseirq: fix numa_migrate_irq_desc dependency and
	comments
Date: Fri, 19 Dec 2008 22:57:33 +0100
Message-ID: <20081219215733.GI2351@elte.hu>
References: <20081219235757.6b94d9ef.sfr@canb.auug.org.au> <200812192201.28665.bzolnier@gmail.com> <494C0D28.6040002@kernel.org> <20081219214221.GE2351@elte.hu> <494C16B2.9000005@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mx3.mail.elte.hu ([157.181.1.138]:55068 "EHLO mx3.mail.elte.hu"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1755950AbYLSV5t (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Fri, 19 Dec 2008 16:57:49 -0500
Content-Disposition: inline
In-Reply-To: <494C16B2.9000005@kernel.org>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Yinghai Lu <yinghai@kernel.org>
Cc: Bartlomiej Zolnierkiewicz <bzolnier@gmail.com>, Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, Thomas Gleixner <tglx@linutronix.de>, "H. Peter Anvin" <hpa@zytor.com>


* Yinghai Lu <yinghai@kernel.org> wrote:

> Impact: clean up
> 
> Bartlomiej Zolnierkiewicz <bzolnier@gmail.com> pointed out config and comments
> are not right.
> 
> update it depend to NUMA, and fix some comments
> 
> Signed-off-by: Yinghai Lu <yinghai@kernel.org>
> 
> ---
>  arch/x86/Kconfig          |    2 +-
>  arch/x86/kernel/io_apic.c |    2 +-
>  kernel/irq/numa_migrate.c |   11 +++--------
>  3 files changed, 5 insertions(+), 10 deletions(-)

applied to tip/irq/sparseirq, thanks!

Note, the usual way to credit review/bug feedback is to add this line:

  Reported-by: Bartlomiej Zolnierkiewicz <bzolnier@gmail.com>

and then you dont have to mention a full email in the changelog itself. 
See below how the final commit ended up looking like.

	Ingo

-------------->
>From b909895739427874c089bc0e03dc119f99cab2dd Mon Sep 17 00:00:00 2001
From: Yinghai Lu <yinghai@kernel.org>
Date: Fri, 19 Dec 2008 13:48:34 -0800
Subject: [PATCH] sparseirq: fix numa_migrate_irq_desc dependency and comments

Impact: reduce kconfig variable scope and clean up

Bartlomiej pointed out that the config dependencies and comments are not right.

update it depend to NUMA, and fix some comments

Reported-by: Bartlomiej Zolnierkiewicz <bzolnier@gmail.com>
Signed-off-by: Yinghai Lu <yinghai@kernel.org>
Signed-off-by: Ingo Molnar <mingo@elte.hu>
---
 arch/x86/Kconfig          |    2 +-
 arch/x86/kernel/io_apic.c |    2 +-
 kernel/irq/numa_migrate.c |   11 +++--------
 3 files changed, 5 insertions(+), 10 deletions(-)

diff --git a/arch/x86/Kconfig b/arch/x86/Kconfig
index 60a0088..5c24382 100644
--- a/arch/x86/Kconfig
+++ b/arch/x86/Kconfig
@@ -250,7 +250,7 @@ config SPARSE_IRQ
 
 config NUMA_MIGRATE_IRQ_DESC
 	bool "Move irq desc when changing irq smp_affinity"
-	depends on SPARSE_IRQ && SMP
+	depends on SPARSE_IRQ && NUMA
 	default n
 	help
 	  This enables moving irq_desc to cpu/node that irq will use handled.
diff --git a/arch/x86/kernel/io_apic.c b/arch/x86/kernel/io_apic.c
index bfe1245..a74887b 100644
--- a/arch/x86/kernel/io_apic.c
+++ b/arch/x86/kernel/io_apic.c
@@ -2471,7 +2471,7 @@ static void irq_complete_move(struct irq_desc **descp)
 		if (likely(!cfg->move_desc_pending))
 			return;
 
-		/* domain is not change, but affinity is changed */
+		/* domain has not changed, but affinity did */
 		me = smp_processor_id();
 		if (cpu_isset(me, desc->affinity)) {
 			*descp = desc = move_irq_desc(desc, me);
diff --git a/kernel/irq/numa_migrate.c b/kernel/irq/numa_migrate.c
index 0178e22..089c374 100644
--- a/kernel/irq/numa_migrate.c
+++ b/kernel/irq/numa_migrate.c
@@ -1,13 +1,8 @@
 /*
- * linux/kernel/irq/handle.c
- *
- * Copyright (C) 1992, 1998-2006 Linus Torvalds, Ingo Molnar
- * Copyright (C) 2005-2006, Thomas Gleixner, Russell King
- *
- * This file contains the core interrupt handling code.
- *
- * Detailed information is available in Documentation/DocBook/genericirq
+ * NUMA irq-desc migration code
  *
+ * Migrate IRQ data structures (irq_desc, chip_data, etc.) over to
+ * the new "home node" of the IRQ.
  */
 
 #include <linux/irq.h>
