From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the driver-core tree with Linus' tree
Date: Fri, 7 Aug 2015 15:26:55 +1000
Message-ID: <20150807152655.27e0e47b@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:60351 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751014AbbHGF04 (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Fri, 7 Aug 2015 01:26:56 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Greg KH <greg@kroah.com>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Viresh Kumar <viresh.kumar@linaro.org>, "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>

Hi Greg,

Today's linux-next merge of the driver-core tree got a conflict in:

  drivers/cpufreq/cpufreq.c

between commit:

  559ed40752dc ("cpufreq: Avoid attempts to create duplicate symbolic links")

from Linus' tree and commit:

  71db87ba5700 ("bus: subsys: update return type of ->remove_dev() to void")

from the driver-core tree.

I fixed it up (see below) and can carry the fix as necessary (no action
is required).

-- 
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au

diff --cc drivers/cpufreq/cpufreq.c
index 76a26609d96b,6da25c10bdfd..000000000000
--- a/drivers/cpufreq/cpufreq.c
+++ b/drivers/cpufreq/cpufreq.c
@@@ -1464,44 -1518,43 +1464,42 @@@ static void cpufreq_offline_finish(unsi
   *
   * Removes the cpufreq interface for a CPU device.
   */
- static int cpufreq_remove_dev(struct device *dev, struct subsys_interface *sif)
+ static void cpufreq_remove_dev(struct device *dev, struct subsys_interface *sif)
  {
  	unsigned int cpu = dev->id;
 -	int ret;
 -
 -	/*
 -	 * Only possible if 'cpu' is getting physically removed now. A hotplug
 -	 * notifier should have already been called and we just need to remove
 -	 * link or free policy here.
 -	 */
 -	if (cpu_is_offline(cpu)) {
 -		struct cpufreq_policy *policy = per_cpu(cpufreq_cpu_data, cpu);
 -		struct cpumask mask;
 +	struct cpufreq_policy *policy = per_cpu(cpufreq_cpu_data, cpu);
  
 -		if (!policy)
 -			return;
 +	if (!policy)
- 		return 0;
++		return;
  
 -		cpumask_copy(&mask, policy->related_cpus);
 -		cpumask_clear_cpu(cpu, &mask);
 +	if (cpu_online(cpu)) {
 +		cpufreq_offline_prepare(cpu);
 +		cpufreq_offline_finish(cpu);
 +	}
  
 -		/*
 -		 * Free policy only if all policy->related_cpus are removed
 -		 * physically.
 -		 */
 -		if (cpumask_intersects(&mask, cpu_present_mask)) {
 -			remove_cpu_dev_symlink(policy, cpu);
 -			return;
 -		}
 +	cpumask_clear_cpu(cpu, policy->real_cpus);
  
 +	if (cpumask_empty(policy->real_cpus)) {
  		cpufreq_policy_free(policy, true);
- 		return 0;
+ 		return;
  	}
  
 -	ret = __cpufreq_remove_dev_prepare(dev, sif);
 +	if (cpu != policy->kobj_cpu) {
 +		remove_cpu_dev_symlink(policy, cpu);
 +	} else {
 +		/*
 +		 * The CPU owning the policy object is going away.  Move it to
 +		 * another suitable CPU.
 +		 */
 +		unsigned int new_cpu = cpumask_first(policy->real_cpus);
 +		struct device *new_dev = get_cpu_device(new_cpu);
  
 -	if (!ret)
 -		__cpufreq_remove_dev_finish(dev, sif);
 +		dev_dbg(dev, "%s: Moving policy object to CPU%u\n", __func__, new_cpu);
 +
 +		sysfs_remove_link(&new_dev->kobj, "cpufreq");
 +		policy->kobj_cpu = new_cpu;
 +		WARN_ON(kobject_move(&policy->kobj, &new_dev->kobj));
 +	}
- 
- 	return 0;
  }
  
  static void handle_update(struct work_struct *work)
