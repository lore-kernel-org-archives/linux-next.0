From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the cpus4096 tree
Date: Fri, 12 Sep 2008 15:18:19 +1000
Message-ID: <20080912151819.c6e8fdfe.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:48259 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751717AbYILFS1 (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Fri, 12 Sep 2008 01:18:27 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>, "H. Peter Anvin" <hpa@zytor.com>
Cc: linux-next@vger.kernel.org, Mike Travis <travis@sgi.com>, Alex Nixon <alex.nixon@citrix.com>

Hi all,

Today's linux-next merge of the cpus4096 tree got a conflict in
include/asm-x86/smp.h between commit
93be71b672f167b1e8c23725114f86305354f0ac ("x86: add cpu hotplug hooks
into smp_ops") from the x86 tree and commit
ae74da38ccdad1c0d724fc9343b917bc63ed6fc3 ("x86: reduce stack requirements
for send_call_func_ipi") from the cpus4096 tree.

Just overlapping context.  I fixed it up (see below) and can carry the
fix.
-- 
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

diff --cc include/asm-x86/smp.h
index 6df2615,8eee4ef..0000000
--- a/include/asm-x86/smp.h
+++ b/include/asm-x86/smp.h
@@@ -55,12 -53,7 +55,12 @@@ struct smp_ops 
  	void (*smp_send_stop)(void);
  	void (*smp_send_reschedule)(int cpu);
  
 +	int (*cpu_up)(unsigned cpu);
 +	int (*cpu_disable)(void);
 +	void (*cpu_die)(unsigned int cpu);
 +	void (*play_dead)(void);
 +
- 	void (*send_call_func_ipi)(cpumask_t mask);
+ 	void (*send_call_func_ipi)(const cpumask_t *mask);
  	void (*send_call_func_single_ipi)(int cpu);
  };
  
@@@ -125,22 -103,19 +125,22 @@@ static inline void arch_send_call_funct
  
  static inline void arch_send_call_function_ipi(cpumask_t mask)
  {
- 	smp_ops.send_call_func_ipi(mask);
+ 	smp_ops.send_call_func_ipi(&mask);
  }
  
 +void cpu_disable_common(void);
  void native_smp_prepare_boot_cpu(void);
  void native_smp_prepare_cpus(unsigned int max_cpus);
  void native_smp_cpus_done(unsigned int max_cpus);
  int native_cpu_up(unsigned int cpunum);
 +int native_cpu_disable(void);
 +void native_cpu_die(unsigned int cpu);
 +void native_play_dead(void);
 +void play_dead_common(void);
 +
- void native_send_call_func_ipi(cpumask_t mask);
+ void native_send_call_func_ipi(const cpumask_t *mask);
  void native_send_call_func_single_ipi(int cpu);
  
 -extern int __cpu_disable(void);
 -extern void __cpu_die(unsigned int cpu);
 -
  void smp_store_cpu_info(int id);
  #define cpu_physical_id(cpu)	per_cpu(x86_cpu_to_apicid, cpu)
  
