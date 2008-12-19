From: Bartlomiej Zolnierkiewicz <bzolnier@gmail.com>
Subject: Re: linux-next: Tree for December 19 (new CONFIG_NUMA_MIGRATE_IRQ_DESC option)
Date: Fri, 19 Dec 2008 22:01:28 +0100
Message-ID: <200812192201.28665.bzolnier@gmail.com>
References: <20081219235757.6b94d9ef.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain;
  charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-bw0-f21.google.com ([209.85.218.21]:55497 "EHLO
	mail-bw0-f21.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751144AbYLSVCF (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Fri, 19 Dec 2008 16:02:05 -0500
In-Reply-To: <20081219235757.6b94d9ef.sfr@canb.auug.org.au>
Content-Disposition: inline
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, Yinghai Lu <yinghai@kernel.org>, Ingo Molnar <mingo@elte.hu>

On Friday 19 December 2008, Stephen Rothwell wrote:
> Hi all,
> 
> Changes since 20081218:
 
Just few very minor issues w.r.t. "x86, sparseirq: move irq_desc according
to smp_affinity, v7" (commit 48a1b10aff588833b73994704c47bbd0deb73e9c):

+config NUMA_MIGRATE_IRQ_DESC
+	bool "Move irq desc when changing irq smp_affinity"
+	depends on SPARSE_IRQ && SMP
+	default n
+	help
+	  This enables moving irq_desc to cpu/node that irq will use handled.
+
+	  If you don't know what to do here, say N.

This is a bit confusing (at least I was confused since I don't have NUMA
set in my config) -- either it should depend on NUMA or the config option
name should be changed.

@@ -2346,14 +2466,34 @@ static void irq_complete_move(struct irq_desc **descp)
 	struct irq_cfg *cfg = desc->chip_data;
 	unsigned vector, me;
 
-	if (likely(!cfg->move_in_progress))
+	if (likely(!cfg->move_in_progress)) {
+#ifdef CONFIG_NUMA_MIGRATE_IRQ_DESC
+		if (likely(!cfg->move_desc_pending))
+			return;
+
+		/* domain is not change, but affinity is changed */

this comment sounds weird

perhaps: /* only affinity is changed */ would be better?

+++ b/kernel/irq/numa_migrate.c
@@ -0,0 +1,127 @@
+/*
+ * linux/kernel/irq/handle.c
+ *
+ * Copyright (C) 1992, 1998-2006 Linus Torvalds, Ingo Molnar
+ * Copyright (C) 2005-2006, Thomas Gleixner, Russell King
+ *
+ * This file contains the core interrupt handling code.
+ *
+ * Detailed information is available in Documentation/DocBook/genericirq
+ *
+ */

hmmm? ;-)
