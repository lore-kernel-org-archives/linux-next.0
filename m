From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the percpu tree with the
 cpufreq-current tree
Date: Wed, 8 Jul 2009 16:37:09 +1000
Message-ID: <20090708163709.fe7216b0.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:42347 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1753301AbZGHGhQ (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Wed, 8 Jul 2009 02:37:16 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Tejun Heo <tj@kernel.org>, Rusty Russell <rusty@rustcorp.com.au>, Christoph Lameter <cl@linux-foundation.org>, Ingo Molnar <mingo@elte.hu>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Dave Jones <davej@redhat.com>, Venkatesh Pallipadi <venkatesh.pallipadi@intel.com>

Hi all,

Today's linux-next merge of the percpu tree got a conflict in
drivers/cpufreq/cpufreq_ondemand.c between commit
5a75c82828e7c088ca6e7b4827911dc29cc8e774 ("[CPUFREQ] Cleanup locking in
ondemand governor") from the cpufreq-current tree and commit
245b2e70eabd797932adb263a65da0bab3711753 ("percpu: clean up percpu
variable definitions") from the percpu tree.

I fixed it up (see below) and can carry the fix as necessary.
-- 
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au

diff --cc drivers/cpufreq/cpufreq_ondemand.c
index d6ba142,36f292a..0000000
--- a/drivers/cpufreq/cpufreq_ondemand.c
+++ b/drivers/cpufreq/cpufreq_ondemand.c
@@@ -70,15 -70,10 +70,15 @@@ struct cpu_dbs_info_s 
  	unsigned int freq_lo_jiffies;
  	unsigned int freq_hi_jiffies;
  	int cpu;
 -	unsigned int enable:1,
 -		sample_type:1;
 +	unsigned int sample_type:1;
 +	/*
 +	 * percpu mutex that serializes governor limit change with
 +	 * do_dbs_timer invocation. We do not want do_dbs_timer to run
 +	 * when user is changing the governor or limits.
 +	 */
 +	struct mutex timer_mutex;
  };
- static DEFINE_PER_CPU(struct cpu_dbs_info_s, cpu_dbs_info);
+ static DEFINE_PER_CPU(struct cpu_dbs_info_s, od_cpu_dbs_info);
  
  static unsigned int dbs_enable;	/* number of CPUs using this policy */
  
@@@ -190,13 -193,6 +191,13 @@@ static unsigned int powersave_bias_targ
  	return freq_hi;
  }
  
 +static void ondemand_powersave_bias_init_cpu(int cpu)
 +{
- 	struct cpu_dbs_info_s *dbs_info = &per_cpu(cpu_dbs_info, cpu);
++	struct cpu_dbs_info_s *dbs_info = &per_cpu(od_cpu_dbs_info, cpu);
 +	dbs_info->freq_table = cpufreq_frequency_get_table(cpu);
 +	dbs_info->freq_lo = 0;
 +}
 +
  static void ondemand_powersave_bias_init(void)
  {
  	int i;
@@@ -550,10 -569,9 +551,10 @@@ static int cpufreq_governor_dbs(struct 
  			return rc;
  		}
  
 +		dbs_enable++;
  		for_each_cpu(j, policy->cpus) {
  			struct cpu_dbs_info_s *j_dbs_info;
- 			j_dbs_info = &per_cpu(cpu_dbs_info, j);
+ 			j_dbs_info = &per_cpu(od_cpu_dbs_info, j);
  			j_dbs_info->cur_policy = policy;
  
  			j_dbs_info->prev_cpu_idle = get_cpu_idle_time(j,
