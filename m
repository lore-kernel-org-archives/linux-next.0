From: Paul Gortmaker <paul.gortmaker@windriver.com>
Subject: [PATCH] ppc-6xx: fix build failure in flipper-pic.c and hlwd-pic.c
Date: Wed, 22 Feb 2012 18:35:03 -0500
Message-ID: <1329953703-25806-1-git-send-email-paul.gortmaker@windriver.com>
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail.windriver.com ([147.11.1.11]:36174 "EHLO
	mail.windriver.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752596Ab2BVXfW (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Wed, 22 Feb 2012 18:35:22 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: grant.likely@secretlab.ca
Cc: linuxppc-dev@lists.ozlabs.org, linux-next@vger.kernel.org, olof@lixom.net, Paul Gortmaker <paul.gortmaker@windriver.com>

The commit bae1d8f19983fbfa25559aa3cb6a81a84aa82a18 (linux-next)

  "irq_domain/powerpc: Use common irq_domain structure instead of irq_host"

made this change:

   -static struct irq_host *flipper_irq_host;
   +static struct irq_domain *flipper_irq_host;

and this change:

   -static struct irq_host *hlwd_irq_host;
   +static struct irq_domain *hlwd_irq_host;

The intent was to change the type, and not the name, but then in a
couple of instances, it looks like the sed to change the irq_domain_ops
name inadvertently also changed the irq_host name where it was not
supposed to, causing build failures.

Signed-off-by: Paul Gortmaker <paul.gortmaker@windriver.com>

---

[seen in build tests on the linux-next tree from yesterday.]

diff --git a/arch/powerpc/platforms/embedded6xx/flipper-pic.c b/arch/powerpc/platforms/embedded6xx/flipper-pic.c
index 675335a..53d6eee 100644
--- a/arch/powerpc/platforms/embedded6xx/flipper-pic.c
+++ b/arch/powerpc/platforms/embedded6xx/flipper-pic.c
@@ -172,7 +172,7 @@ out:
 
 unsigned int flipper_pic_get_irq(void)
 {
-	void __iomem *io_base = flipper_irq_domain->host_data;
+	void __iomem *io_base = flipper_irq_host->host_data;
 	int irq;
 	u32 irq_status;
 
@@ -182,7 +182,7 @@ unsigned int flipper_pic_get_irq(void)
 		return NO_IRQ;	/* no more IRQs pending */
 
 	irq = __ffs(irq_status);
-	return irq_linear_revmap(flipper_irq_domain, irq);
+	return irq_linear_revmap(flipper_irq_host, irq);
 }
 
 /*
@@ -197,7 +197,7 @@ void __init flipper_pic_probe(void)
 	np = of_find_compatible_node(NULL, NULL, "nintendo,flipper-pic");
 	BUG_ON(!np);
 
-	flipper_irq_domain = flipper_pic_init(np);
+	flipper_irq_host = flipper_pic_init(np);
 	BUG_ON(!flipper_irq_host);
 
 	irq_set_default_host(flipper_irq_host);
diff --git a/arch/powerpc/platforms/embedded6xx/hlwd-pic.c b/arch/powerpc/platforms/embedded6xx/hlwd-pic.c
index da6ca02..3006b51 100644
--- a/arch/powerpc/platforms/embedded6xx/hlwd-pic.c
+++ b/arch/powerpc/platforms/embedded6xx/hlwd-pic.c
@@ -189,7 +189,7 @@ struct irq_domain *hlwd_pic_init(struct device_node *np)
 
 unsigned int hlwd_pic_get_irq(void)
 {
-	return __hlwd_pic_get_irq(hlwd_irq_domain);
+	return __hlwd_pic_get_irq(hlwd_irq_host);
 }
 
 /*
@@ -213,7 +213,7 @@ void hlwd_pic_probe(void)
 			irq_set_handler_data(cascade_virq, host);
 			irq_set_chained_handler(cascade_virq,
 						hlwd_pic_irq_cascade);
-			hlwd_irq_domain = host;
+			hlwd_irq_host = host;
 			break;
 		}
 	}
@@ -227,7 +227,7 @@ void hlwd_pic_probe(void)
  */
 void hlwd_quiesce(void)
 {
-	void __iomem *io_base = hlwd_irq_domain->host_data;
+	void __iomem *io_base = hlwd_irq_host->host_data;
 
 	__hlwd_quiesce(io_base);
 }
-- 
1.7.9.1
