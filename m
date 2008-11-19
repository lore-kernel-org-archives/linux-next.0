From: "Richard A. Holden III" <aciddeath@gmail.com>
Subject: [PATCH] Fix arch/x86/kernel/setup.c build warning when !CONFIG_X86_RESERVE_LOW_64K
Date: Wed, 19 Nov 2008 16:05:15 -0700
Message-ID: <1227135915-32628-2-git-send-email-aciddeath@gmail.com>
References: <1227135915-32628-1-git-send-email-aciddeath@gmail.com>
Return-path: <linux-next-owner@vger.kernel.org>
Received: from rv-out-0506.google.com ([209.85.198.230]:38290 "EHLO
	rv-out-0506.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751408AbYKSWD0 (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Wed, 19 Nov 2008 17:03:26 -0500
Received: by rv-out-0506.google.com with SMTP id k40so145346rvb.1
        for <linux-next@vger.kernel.org>; Wed, 19 Nov 2008 14:03:26 -0800 (PST)
In-Reply-To: <1227135915-32628-1-git-send-email-aciddeath@gmail.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: linux-next@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, "H. Peter Anvin" <hpa@zytor.com>

Fix
arch/x86/kernel/setup.c:592: warning: 'dmi_low_memory_corruption' defined but not used

this is only used if CONFIG_X86_RESERVE_LOW_64K is defined.

Signed-off-by: Richard A. Holden III <aciddeath@gmail.com>
Cc: Thomas Gleixner <tglx@linutronix.de>
Cc: Ingo Molnar <mingo@redhat.com>
Cc: H. Peter Anvin <hpa@zytor.com>
---
 arch/x86/kernel/setup.c |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/arch/x86/kernel/setup.c b/arch/x86/kernel/setup.c
index 598435b..e417308 100644
--- a/arch/x86/kernel/setup.c
+++ b/arch/x86/kernel/setup.c
@@ -588,6 +588,7 @@ static struct x86_quirks default_x86_quirks __initdata;
 
 struct x86_quirks *x86_quirks __initdata = &default_x86_quirks;
 
+#ifdef CONFIG_X86_RESERVE_LOW_64K
 static int __init dmi_low_memory_corruption(const struct dmi_system_id *d)
 {
 	printk(KERN_NOTICE
@@ -599,6 +600,7 @@ static int __init dmi_low_memory_corruption(const struct dmi_system_id *d)
 
 	return 0;
 }
+#endif
 
 /* List of systems that have known low memory corruption BIOS problems */
 static struct dmi_system_id __initdata bad_bios_dmi_table[] = {
-- 
1.5.6.4
