From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the rr tree with the cpufreq tree
Date: Thu, 5 Mar 2009 14:59:42 +1100
Message-ID: <20090305145942.504a0ec5.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:33379 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1753216AbZCEEYm (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Wed, 4 Mar 2009 23:24:42 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Rusty Russell <rusty@rustcorp.com.au>
Cc: linux-next@vger.kernel.org, Dave Jones <davej@redhat.com>

Hi Rusty,

Today's linux-next merge of the rr tree got a conflict in
arch/x86/kernel/cpu/cpufreq/speedstep-ich.c between commit
bbfebd66554b934b270c4c49442f4fe5e62df0e5 ("[CPUFREQ] checkpatch cleanups
for speedstep related drivers") from the cpufreq tree and commit
8bd527201fec91f5b42e7ee56840eba399356003
("cpumask:remove-cpumask-games-arch-x86-kernel-cpu-cpufreq-speedstep-ich.c")
from the rr tree.

I fixed it up (see below) and can carry the fix as necessary.  Please
check the result.
-- 
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

diff --cc arch/x86/kernel/cpu/cpufreq/speedstep-ich.c
index 8bbb11a,0baf5f1..0000000
--- a/arch/x86/kernel/cpu/cpufreq/speedstep-ich.c
+++ b/arch/x86/kernel/cpu/cpufreq/speedstep-ich.c
@@@ -89,9 -88,10 +89,10 @@@ static int speedstep_find_register(void
   * speedstep_set_state - set the SpeedStep state
   * @state: new processor frequency state (SPEEDSTEP_LOW or SPEEDSTEP_HIGH)
   *
-  *   Tries to change the SpeedStep state.
+  *   Tries to change the SpeedStep state.  Can be called from
+  *   smp_call_function_single.
   */
 -static void speedstep_set_state (unsigned int state)
 +static void speedstep_set_state(unsigned int state)
  {
  	u8 pm2_blk;
  	u8 value;
@@@ -226,17 -235,16 +232,16 @@@ static unsigned int speedstep_detect_ch
  	return 0;
  }
  
- static unsigned int _speedstep_get(const struct cpumask *cpus)
- {
+ struct get_freq_data {
  	unsigned int speed;
- 	cpumask_t cpus_allowed;
- 
- 	cpus_allowed = current->cpus_allowed;
- 	set_cpus_allowed_ptr(current, cpus);
- 	speed = speedstep_get_frequency(speedstep_processor);
- 	set_cpus_allowed_ptr(current, &cpus_allowed);
- 	dprintk("detected %u kHz as current frequency\n", speed);
- 	return speed;
+ 	unsigned int processor;
+ };
+ 
+ static void get_freq_data(void *_data)
+ {
+ 	struct get_freq_data *data = _data;
+ 
 -	data->speed = speedstep_get_processor_frequency(data->processor);
++	data->speed = speedstep_get_frequency(data->processor);
  }
  
  static unsigned int speedstep_get(unsigned int cpu)
@@@ -257,16 -271,15 +269,16 @@@ static int speedstep_target(struct cpuf
  			     unsigned int target_freq,
  			     unsigned int relation)
  {
- 	unsigned int newstate = 0;
+ 	unsigned int newstate = 0, policy_cpu;
  	struct cpufreq_freqs freqs;
- 	cpumask_t cpus_allowed;
  	int i;
  
 -	if (cpufreq_frequency_table_target(policy, &speedstep_freqs[0], target_freq, relation, &newstate))
 +	if (cpufreq_frequency_table_target(policy, &speedstep_freqs[0],
 +				target_freq, relation, &newstate))
  		return -EINVAL;
  
- 	freqs.old = _speedstep_get(policy->cpus);
+ 	policy_cpu = cpumask_any_and(policy->cpus, cpu_online_mask);
+ 	freqs.old = speedstep_get(policy_cpu);
  	freqs.new = speedstep_freqs[newstate].frequency;
  	freqs.cpu = policy->cpu;
  
