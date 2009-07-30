From: Alexander Beregalov <a.beregalov@gmail.com>
Subject: [PATCH] x86: kernel/cpu/amd.c: Fix non-SMP build
Date: Thu, 30 Jul 2009 17:21:50 +0400
Message-ID: <1248960110-19341-1-git-send-email-a.beregalov@gmail.com>
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-bw0-f219.google.com ([209.85.218.219]:64681 "EHLO
	mail-bw0-f219.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750861AbZG3NWj (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Thu, 30 Jul 2009 09:22:39 -0400
Received: by bwz19 with SMTP id 19so581407bwz.37
        for <linux-next@vger.kernel.org>; Thu, 30 Jul 2009 06:22:36 -0700 (PDT)
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: andreas.herrmann3@amd.com, linux-next@vger.kernel.org
Cc: Alexander Beregalov <a.beregalov@gmail.com>

Fix this build errors when CONFIG_SMP is not set
(caused by 5b7d3d4 "x86: add cpu_node topology detection for AMD Magny-Cours"):

arch/x86/kernel/cpu/amd.c: In function 'amd_fixup_dcm':
arch/x86/kernel/cpu/amd.c:279: error: 'struct cpuinfo_x86' has no member named 'phys_proc_id'
arch/x86/kernel/cpu/amd.c:288: error: 'struct cpuinfo_x86' has no member named 'cpu_core_id'
arch/x86/kernel/cpu/amd.c:289: error: 'struct cpuinfo_x86' has no member named 'cpu_node_id'
arch/x86/kernel/cpu/amd.c:291: error: 'struct cpuinfo_x86' has no member named 'cpu_node_id'
arch/x86/kernel/cpu/amd.c:293: error: 'struct cpuinfo_x86' has no member named 'cpu_core_id'
arch/x86/kernel/cpu/amd.c:294: error: 'struct cpuinfo_x86' has no member named 'cpu_node_id'
arch/x86/kernel/cpu/amd.c:296: error: 'struct cpuinfo_x86' has no member named 'cpu_node_id'
arch/x86/kernel/cpu/amd.c:300: error: 'struct cpuinfo_x86' has no member named 'cpu_core_id'
arch/x86/kernel/cpu/amd.c:300: error: 'struct cpuinfo_x86' has no member named 'cpu_core_id'

Signed-off-by: Alexander Beregalov <a.beregalov@gmail.com>
---
 arch/x86/kernel/cpu/amd.c |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/arch/x86/kernel/cpu/amd.c b/arch/x86/kernel/cpu/amd.c
index e06fa7c..1c15916 100644
--- a/arch/x86/kernel/cpu/amd.c
+++ b/arch/x86/kernel/cpu/amd.c
@@ -256,6 +256,7 @@ static int __cpuinit nearby_node(int apicid)
  * Assumption 2: Mixed systems with both single-node and dual-node
  *               processors are not supported.
  */
+#ifdef CONFIG_X86_HT
 static void __cpuinit amd_fixup_dcm(struct cpuinfo_x86 *c)
 {
 	u32 t, cpn;
@@ -299,6 +300,7 @@ static void __cpuinit amd_fixup_dcm(struct cpuinfo_x86 *c)
 	 /* fixup core id to be in range from 0 to cpn */
 	c->cpu_core_id = c->cpu_core_id % cpn;
 }
+#endif
 
 /*
  * On a AMD dual core setup the lower bits of the APIC id distingush the cores.
-- 
1.6.3.3
