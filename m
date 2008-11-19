From: "Richard A. Holden III" <aciddeath@gmail.com>
Subject: [PATCH] Fix arch/x86/kernel/genx2apic_uv_x.c build warning when !CONFIG_HOTPLUG_CPU
Date: Wed, 19 Nov 2008 16:05:14 -0700
Message-ID: <1227135915-32628-1-git-send-email-aciddeath@gmail.com>
Return-path: <linux-next-owner@vger.kernel.org>
Received: from rv-out-0506.google.com ([209.85.198.229]:45136 "EHLO
	rv-out-0506.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750965AbYKSWD0 (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Wed, 19 Nov 2008 17:03:26 -0500
Received: by rv-out-0506.google.com with SMTP id k40so145345rvb.1
        for <linux-next@vger.kernel.org>; Wed, 19 Nov 2008 14:03:25 -0800 (PST)
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: linux-next@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, "H. Peter Anvin" <hpa@zytor.com>

Fix
arch/x86/kernel/genx2apic_uv_x.c:403: warning: 'uv_heartbeat_disable' defined but not used

the function is only used when CONFIG_HOTPLUG_CPU is defined.

Signed-off-by: Richard A. Holden III <aciddeath@gmail.com>
Cc: Thomas Gleixner <tglx@linutronix.de>
Cc: Ingo Molnar <mingo@redhat.com>
Cc: H. Peter Anvin <hpa@zytor.com>
---
 arch/x86/kernel/genx2apic_uv_x.c |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/arch/x86/kernel/genx2apic_uv_x.c b/arch/x86/kernel/genx2apic_uv_x.c
index fb80b17..3076bc6 100644
--- a/arch/x86/kernel/genx2apic_uv_x.c
+++ b/arch/x86/kernel/genx2apic_uv_x.c
@@ -399,6 +399,7 @@ static void __cpuinit uv_heartbeat_enable(int cpu)
 		uv_heartbeat_enable(0);
 }
 
+#ifdef CONFIG_HOTPLUG_CPU
 static void __cpuinit uv_heartbeat_disable(int cpu)
 {
 	if (uv_cpu_hub_info(cpu)->scir.enabled) {
@@ -408,7 +409,6 @@ static void __cpuinit uv_heartbeat_disable(int cpu)
 	uv_set_cpu_scir_bits(cpu, 0xff);
 }
 
-#ifdef CONFIG_HOTPLUG_CPU
 /*
  * cpu hotplug notifier
  */
-- 
1.5.6.4
