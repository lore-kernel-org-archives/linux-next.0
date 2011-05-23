From: Randy Dunlap <randy.dunlap@oracle.com>
Subject: [PATCH -next] x86: apic_flat_64.c needs module.h
Date: Mon, 23 May 2011 10:43:00 -0700
Message-ID: <20110523104300.dd532a99.randy.dunlap@oracle.com>
References: <20110523154518.5e27cfb0.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from rcsinet10.oracle.com ([148.87.113.121]:27108 "EHLO
	rcsinet10.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754898Ab1EWRn7 (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Mon, 23 May 2011 13:43:59 -0400
In-Reply-To: <20110523154518.5e27cfb0.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>, x86@kernel.org
Cc: linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>

From: Randy Dunlap <randy.dunlap@oracle.com>

apic_flat_64.c needs to include module.h to fix these warnings:

arch/x86/kernel/apic/apic_flat_64.c:31: warning: data definition has no type or storage class
arch/x86/kernel/apic/apic_flat_64.c:31: warning: type defaults to 'int' in declaration of 'EXPORT_SYMBOL_GPL'
arch/x86/kernel/apic/apic_flat_64.c:31: warning: parameter names (without types) in function declaration

Signed-off-by: Randy Dunlap <randy.dunlap@oracle.com>
---
 arch/x86/kernel/apic/apic_flat_64.c |    1 +
 1 file changed, 1 insertion(+)

--- linux-next-20110523.orig/arch/x86/kernel/apic/apic_flat_64.c
+++ linux-next-20110523/arch/x86/kernel/apic/apic_flat_64.c
@@ -16,6 +16,7 @@
 #include <linux/ctype.h>
 #include <linux/init.h>
 #include <linux/hardirq.h>
+#include <linux/module.h>
 #include <asm/smp.h>
 #include <asm/apic.h>
 #include <asm/ipi.h>
