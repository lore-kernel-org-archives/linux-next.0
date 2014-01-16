From: Li Zhong <zhong@linux.vnet.ibm.com>
Subject: [PATCH next] powerpc/cpuidle: fix per cpu var accessing in
 pseries_cpuidle_add_cpu_notifier()
Date: Thu, 16 Jan 2014 14:11:34 +0800
Message-ID: <1389852694.2954.11.camel@ThinkPad-T5421.cn.ibm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from e28smtp04.in.ibm.com ([122.248.162.4]:49710 "EHLO
	e28smtp04.in.ibm.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750937AbaAPGLo (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Thu, 16 Jan 2014 01:11:44 -0500
Received: from /spool/local
	by e28smtp04.in.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only! Violators will be prosecuted
	for <linux-next@vger.kernel.org> from <zhong@linux.vnet.ibm.com>;
	Thu, 16 Jan 2014 11:41:40 +0530
Received: from d28relay03.in.ibm.com (d28relay03.in.ibm.com [9.184.220.60])
	by d28dlp01.in.ibm.com (Postfix) with ESMTP id 916CCE0056
	for <linux-next@vger.kernel.org>; Thu, 16 Jan 2014 11:44:32 +0530 (IST)
Received: from d28av05.in.ibm.com (d28av05.in.ibm.com [9.184.220.67])
	by d28relay03.in.ibm.com (8.13.8/8.13.8/NCO v10.0) with ESMTP id s0G6BUkx4194578
	for <linux-next@vger.kernel.org>; Thu, 16 Jan 2014 11:41:31 +0530
Received: from d28av05.in.ibm.com (localhost [127.0.0.1])
	by d28av05.in.ibm.com (8.14.4/8.14.4/NCO v10.0 AVout) with ESMTP id s0G6BbY8025613
	for <linux-next@vger.kernel.org>; Thu, 16 Jan 2014 11:41:37 +0530
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: linux-next list <linux-next@vger.kernel.org>
Cc: b.zolnierkie@samsung.com, kyungmin.park@samsung.com, daniel.lezcano@linaro.org, deepthi@linux.vnet.ibm.com, rafael.j.wysocki@intel.com

This patch tries to fix a typo in commit 7f74dc0f (per_cpu_ptr ->
per_cpu), which could cause following bad address dereference.

Unable to handle kernel paging request for data at address 0x00a85000
[  149.666322] Faulting instruction address: 0xc0000000006ea824
[  149.666330] Oops: Kernel access of bad area, sig: 11 [#1]
[  149.666335] PREEMPT SMP NR_CPUS=16 DEBUG_PAGEALLOC NUMA pSeries
[  149.666348] Modules linked in: binfmt_misc
[  149.666358] CPU: 0 PID: 3559 Comm: bash Tainted: G        W    3.13.0-rc8-next-20140114-dirty #1
[  149.666365] task: c0000001f90b0000 ti: c0000001fa87c000 task.ti: c0000001fa87c000
[  149.666372] NIP: c0000000006ea824 LR: c0000000006ea818 CTR: c000000000066058
[  149.666378] REGS: c0000001fa87f260 TRAP: 0300   Tainted: G        W     (3.13.0-rc8-next-20140114-dirty)
[  149.666384] MSR: 8000000000009032 <SF,EE,ME,IR,DR,RI>  CR: 22242424  XER: 20000000
[  149.666404] CFAR: 0000000000009314 DAR: 0000000000a85000 DSISR: 40000000 SOFTE: 1 
GPR00: c0000000006ea818 c0000001fa87f4e0 c000000000d73ec0 c000000000c5a4e8 
GPR04: 0000000000000010 0000000000000010 0000000000000000 0000000000000000 
GPR08: ffffffffffffffff c000000001653ec0 ffffffffffffffff 0000000000000000 
GPR12: 0000000000000002 c00000000f33d000 000000001012b3dc 0000000000000000 
GPR16: 0000000000000000 0000000010129c58 0000000010129bf8 000000001012b948 
GPR20: 0000000000000000 000000001012b3e4 0000000010158f50 0000000000000000 
GPR24: c000000000c5a880 c0000000015f2968 c000000000cb7c27 c000000000c63ec0 
GPR28: 0000000000000000 ffffffffffffffe5 0000000000a85000 0000000000a85000 
[  149.666504] NIP [c0000000006ea824] .cpuidle_disable_device+0x30/0xc4
[  149.666510] LR [c0000000006ea818] .cpuidle_disable_device+0x24/0xc4
[  149.666515] Call Trace:
[  149.666520] [c0000001fa87f4e0] [c0000000006ea818] .cpuidle_disable_device+0x24/0xc4 (unreliable)
[  149.666530] [c0000001fa87f560] [c000000000066468] .pseries_cpuidle_add_cpu_notifier+0xb8/0xe0
[  149.666540] [c0000001fa87f5e0] [c00000000084ffc8] .notifier_call_chain+0x150/0x1c0
[  149.666550] [c0000001fa87f690] [c0000000000b458c] .__raw_notifier_call_chain+0x40/0x50
[  149.666558] [c0000001fa87f730] [c00000000007ae0c] .__cpu_notify+0x50/0x9c
[  149.666567] [c0000001fa87f7c0] [c000000000185af8] ._cpu_down+0x1e4/0x35c
[  149.666574] [c0000001fa87f8b0] [c000000000185cb4] .cpu_down+0x44/0x64
[  149.666583] [c0000001fa87f940] [c00000000055e4b4] .cpu_subsys_offline+0x24/0x3c
[  149.666591] [c0000001fa87f9c0] [c000000000556fbc] .device_offline+0xc8/0x120
[  149.666598] [c0000001fa87fa50] [c000000000558d18] .online_store+0x74/0xb0
[  149.666605] [c0000001fa87fb00] [c00000000055563c] .dev_attr_store+0x60/0x78
[  149.666613] [c0000001fa87fba0] [c000000000289284] .sysfs_kf_write+0x7c/0x9c
[  149.666620] [c0000001fa87fc30] [c00000000028e014] .kernfs_fop_write+0x108/0x174
[  149.666629] [c0000001fa87fcd0] [c0000000001f456c] .vfs_write+0x110/0x21c
[  149.666636] [c0000001fa87fd70] [c0000000001f47b0] .SyS_write+0x70/0xbc
[  149.666644] [c0000001fa87fe30] [c00000000000a0e4] syscall_exit+0x0/0x9c
[  149.666651] Instruction dump:
[  149.666655] 7c0802a6 f8010010 fbe1fff8 f821ff81 7c7f1b78 60000000 60000000 7fe3fb78 
[  149.666671] 48000c89 60000000 2fbf0000 419e0084 <e81f0000> 780b17e1 41820078 2fa30000 
[  149.666690] ---[ end trace 38cd7c9b289b4cbc ]---

Signed-off-by: Li Zhong <zhong@linux.vnet.ibm.com>
---
 arch/powerpc/platforms/pseries/processor_idle.c |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/arch/powerpc/platforms/pseries/processor_idle.c b/arch/powerpc/platforms/pseries/processor_idle.c
index 94134a5..197cadc 100644
--- a/arch/powerpc/platforms/pseries/processor_idle.c
+++ b/arch/powerpc/platforms/pseries/processor_idle.c
@@ -190,7 +190,7 @@ static int pseries_cpuidle_add_cpu_notifier(struct notifier_block *n,
 {
 	int hotcpu = (unsigned long)hcpu;
 	struct cpuidle_device *dev =
-			per_cpu_ptr(cpuidle_devices, hotcpu);
+			per_cpu(cpuidle_devices, hotcpu);
 
 	if (dev && cpuidle_get_driver()) {
 		switch (action) {
