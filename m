From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the tip-core tree with Linus' tree
Date: Fri, 6 Feb 2009 13:26:01 +1100
Message-ID: <20090206132601.b207fb0e.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:51317 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752138AbZBFC0I (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Thu, 5 Feb 2009 21:26:08 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>, "H. Peter Anvin" <hpa@zytor.com>
Cc: linux-next@vger.kernel.org, James Bottomley <James.Bottomley@HansenPartnership.com>

Hi all,

Today's linux-next merge of the tip-core tree got a conflict in
arch/x86/mach-voyager/voyager_smp.c between commit
92ab78315c638515d0e81b0c70b2082f713582d9 ("x86/Voyager: make it build and
boot") from Linus' tree and commit
552be871e67ff577ed36beb2f53d078b42304739 ("x86: pass in cpu number to
switch_to_new_gdt()") from the tip-core tree.

I used the resolution from tip/master (see below -worth checking that I
got it right).  (Though I assume that there is no reason that the other
uses of smp_processor_id() in voyager_smp_prepare_boot_cpu could be
replaced by "cpu" as well?)

-- 
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

diff --cc arch/x86/mach-voyager/voyager_smp.c
index 7ffcdee,58c7cac..0000000
--- a/arch/x86/mach-voyager/voyager_smp.c
+++ b/arch/x86/mach-voyager/voyager_smp.c
@@@ -1745,14 -1746,13 +1744,13 @@@ static void __init voyager_smp_prepare_
  
  static void __cpuinit voyager_smp_prepare_boot_cpu(void)
  {
- 	init_gdt(smp_processor_id());
- 	switch_to_new_gdt();
+ 	int cpu = smp_processor_id();
+ 	switch_to_new_gdt(cpu);
  
 -	cpu_set(cpu, cpu_online_map);
 -	cpu_set(cpu, cpu_callout_map);
 -	cpu_set(cpu, cpu_possible_map);
 -	cpu_set(cpu, cpu_present_map);
 +	cpu_online_map = cpumask_of_cpu(smp_processor_id());
 +	cpu_callout_map = cpumask_of_cpu(smp_processor_id());
 +	cpu_callin_map = CPU_MASK_NONE;
 +	cpu_present_map = cpumask_of_cpu(smp_processor_id());
- 
  }
  
  static int __cpuinit voyager_cpu_up(unsigned int cpu)
@@@ -1779,12 -1779,11 +1777,11 @@@ static void __init voyager_smp_cpus_don
  void __init smp_setup_processor_id(void)
  {
  	current_thread_info()->cpu = hard_smp_processor_id();
- 	x86_write_percpu(cpu_number, hard_smp_processor_id());
  }
  
 -static void voyager_send_call_func(cpumask_t callmask)
 +static void voyager_send_call_func(const struct cpumask *callmask)
  {
 -	__u32 mask = cpus_addr(callmask)[0] & ~(1 << smp_processor_id());
 +	__u32 mask = cpus_addr(*callmask)[0] & ~(1 << smp_processor_id());
  	send_CPI(mask, VIC_CALL_FUNCTION_CPI);
  }
  
