From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: powerpc/generic-ipi tree build failure
Date: Mon, 14 Jul 2008 19:55:03 +1000
Message-ID: <20080714195503.38728a34.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:44284 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1753352AbYGNJzI (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Mon, 14 Jul 2008 05:55:08 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Paul Mackerras <paulus@samba.org>, Benjamin Herrenschmidt <benh@kernel.crashing.org>, linuxppc-dev@ozlabs.org
Cc: linux-next@vger.kernel.org, Ingo Molnar <mingo@elte.hu>

Hi all,

Today's linux-next build (powerpc allmodconfig) failed like this:

ERROR: ".save_stack_trace" [tests/backtracetest.ko] undefined!

But save_stack_trace is exported in arch/powerpc/kernel/stacktrace.c

I couldn't figure it out until I noticed these earlier warnings:

arch/powerpc/kernel/stacktrace.c:47: warning: data definition has no type or storage class
arch/powerpc/kernel/stacktrace.c:47: warning: type defaults to 'int' in declaration of 'EXPORT_SYMBOL_GPL'
arch/powerpc/kernel/stacktrace.c:47: warning: parameter names (without types) in function declaration

I applied the patch below.
-- 
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

>From 91ec767c487ff260455e416fee161015a8bdb0c5 Mon Sep 17 00:00:00 2001
From: Stephen Rothwell <sfr@canb.auug.org.au>
Date: Mon, 14 Jul 2008 19:45:59 +1000
Subject: [PATCH] powerpc/stacktrace: EXPORT SYMBOL_GPL needs module.h

Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
---
 arch/powerpc/kernel/stacktrace.c |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/arch/powerpc/kernel/stacktrace.c b/arch/powerpc/kernel/stacktrace.c
index 9861f17..3cf0d94 100644
--- a/arch/powerpc/kernel/stacktrace.c
+++ b/arch/powerpc/kernel/stacktrace.c
@@ -12,6 +12,7 @@
 
 #include <linux/sched.h>
 #include <linux/stacktrace.h>
+#include <linux/module.h>
 #include <asm/ptrace.h>
 
 /*
-- 
1.5.6.2
