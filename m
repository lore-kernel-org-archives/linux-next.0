From: Randy Dunlap <rdunlap@xenotime.net>
Subject: [PATCH -next] x86: fix apic non-ISO code warnings
Date: Wed, 13 Jun 2012 09:25:21 -0700
Message-ID: <4FD8BEF1.6020304@xenotime.net>
References: <20120613155440.14672516ffaf5b01f91bb0a2@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from oproxy9.bluehost.com ([69.89.24.6]:51010 "HELO
	oproxy9.bluehost.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with SMTP id S1751899Ab2FMQZh (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Wed, 13 Jun 2012 12:25:37 -0400
In-Reply-To: <20120613155440.14672516ffaf5b01f91bb0a2@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, x86@kernel.org, Andrew Morton <akpm@linux-foundation.org>

From: Randy Dunlap <rdunlap@xenotime.net>

Fix x86 apic code warnings:

arch/x86/kernel/apic/summit_32.c:297:2: warning: ISO C90 forbids mixed declarations and code
arch/x86/kernel/apic/es7000_32.c:558:2: warning: ISO C90 forbids mixed declarations and code

Signed-off-by: Randy Dunlap <rdunlap@xenotime.net>
---
 arch/x86/kernel/apic/es7000_32.c |    3 ++-
 arch/x86/kernel/apic/summit_32.c |    3 ++-
 2 files changed, 4 insertions(+), 2 deletions(-)

--- linux-next-20120613.orig/arch/x86/kernel/apic/es7000_32.c
+++ linux-next-20120613/arch/x86/kernel/apic/es7000_32.c
@@ -554,9 +554,10 @@ es7000_cpu_mask_to_apicid_and(const stru
 			      const struct cpumask *andmask,
 			      unsigned int *apicid)
 {
-	*apicid = early_per_cpu(x86_cpu_to_logical_apicid, 0);
 	cpumask_var_t cpumask;
 
+	*apicid = early_per_cpu(x86_cpu_to_logical_apicid, 0);
+
 	if (!alloc_cpumask_var(&cpumask, GFP_ATOMIC))
 		return 0;
 
--- linux-next-20120613.orig/arch/x86/kernel/apic/summit_32.c
+++ linux-next-20120613/arch/x86/kernel/apic/summit_32.c
@@ -293,9 +293,10 @@ summit_cpu_mask_to_apicid_and(const stru
 			      const struct cpumask *andmask,
 			      unsigned int *apicid)
 {
-	*apicid = early_per_cpu(x86_cpu_to_logical_apicid, 0);
 	cpumask_var_t cpumask;
 
+	*apicid = early_per_cpu(x86_cpu_to_logical_apicid, 0);
+
 	if (!alloc_cpumask_var(&cpumask, GFP_ATOMIC))
 		return 0;
 
