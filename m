From: "Randy.Dunlap" <rdunlap@xenotime.net>
Subject: [PATCH -next] x86: fix longstanding setup.c printk format warning
Date: Thu, 5 Jun 2008 11:10:59 -0700 (PDT)
Message-ID: <Pine.LNX.4.64.0806051107200.702@shark.he.net>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Return-path: <linux-next-owner@vger.kernel.org>
Received: from xenotime.net ([66.160.160.81]:46527 "HELO xenotime.net"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with SMTP
	id S1753231AbYFESLL (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Thu, 5 Jun 2008 14:11:11 -0400
Received: from shark.he.net ([66.160.160.2]) by xenotime.net for <linux-next@vger.kernel.org>; Thu, 5 Jun 2008 11:10:59 -0700
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: linux-kernel@vger.kernel.org, linux-next@vger.kernel.org
Cc: tglx@linutronix.de, mingo@redhat.com, hpa@zytor.com

From: Randy Dunlap <randy.dunlap@oracle.com>

Note: for -next only, not mainline.

Fix setup.c printk format warning:

linux-next-20080605/arch/x86/kernel/setup.c: In function 'setup_per_cpu_areas':
linux-next-20080605/arch/x86/kernel/setup.c:173: warning: format '%lu' expects type 'long unsigned int', but argument 2 has type 'ssize_t'

Signed-off-by: Randy Dunlap <randy.dunlap@oracle.com>
---
 arch/x86/kernel/setup.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

--- linux-next-20080605.orig/arch/x86/kernel/setup.c
+++ linux-next-20080605/arch/x86/kernel/setup.c
@@ -169,7 +169,7 @@ void __init setup_per_cpu_areas(void)
 
 	/* Copy section for each CPU (we discard the original) */
 	size = PERCPU_ENOUGH_ROOM;
-	printk(KERN_INFO "PERCPU: Allocating %lu bytes of per cpu data\n",
+	printk(KERN_INFO "PERCPU: Allocating %zd bytes of per cpu data\n",
 			  size);
 
 	for_each_possible_cpu(cpu) {
