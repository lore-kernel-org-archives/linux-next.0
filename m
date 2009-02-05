From: Thomas Renninger <trenn@suse.de>
Subject: [PATCH 1/2] CPUFREQ: powernow-k8: Forgot to use printk instead of WARN_ONCE in last patch
Date: Thu,  5 Feb 2009 11:18:28 +0100
Message-ID: <1233829109-23358-2-git-send-email-trenn@suse.de>
References: <1233829109-23358-1-git-send-email-trenn@suse.de>
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ns2.suse.de ([195.135.220.15]:35514 "EHLO mx2.suse.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752329AbZBEKSa (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Thu, 5 Feb 2009 05:18:30 -0500
In-Reply-To: <1233829109-23358-1-git-send-email-trenn@suse.de>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: davej@redhat.com, sfr@canb.auug.org.au, linux-next@vger.kernel.org, cpufreq@vger.kernel.org
Cc: Thomas Renninger <trenn@suse.de>

Signed-off-by: Thomas Renninger <trenn@suse.de>
---
 arch/x86/kernel/cpu/cpufreq/powernow-k8.c |   12 ++++++------
 1 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/arch/x86/kernel/cpu/cpufreq/powernow-k8.c b/arch/x86/kernel/cpu/cpufreq/powernow-k8.c
index 83515f1..5aa832f 100644
--- a/arch/x86/kernel/cpu/cpufreq/powernow-k8.c
+++ b/arch/x86/kernel/cpu/cpufreq/powernow-k8.c
@@ -1247,12 +1247,12 @@ static int __cpuinit powernowk8_cpu_init(struct cpufreq_policy *pol)
 			 * thing gets introduced
 			 */
 			if (!print_once) {
-				WARN_ONCE(1, KERN_ERR FW_BUG PFX "Your BIOS "
-					  "does not provide ACPI _PSS objects "
-					  "in a way that Linux understands. "
-					  "Please report this to the Linux ACPI"
-					  " maintainers and complain to your "
-					  "BIOS vendor.\n");
+				printk(KERN_ERR FW_BUG PFX "Your BIOS "
+				       "does not provide ACPI _PSS objects "
+				       "in a way that Linux understands. "
+				       "Please report this to the Linux ACPI"
+				       " maintainers and complain to your "
+				       "BIOS vendor.\n");
 				print_once++;
 			}
 			goto err_out;
-- 
1.6.0.2
