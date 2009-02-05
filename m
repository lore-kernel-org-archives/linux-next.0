From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the rr tree with the cpufreq tree
Date: Thu, 5 Feb 2009 15:18:30 +1100
Message-ID: <20090205151830.03e5153a.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:45041 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751252AbZBEESg (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Wed, 4 Feb 2009 23:18:36 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Rusty Russell <rusty@rustcorp.com.au>
Cc: linux-next@vger.kernel.org, Thomas Renninger <trenn@suse.de>, Dave Jones <davej@redhat.com>, Mark Langsdorf <mark.langsdorf@amd.com>

Hi Rusty,

Today's linux-next merge of the rr tree got a conflict in
arch/x86/kernel/cpu/cpufreq/powernow-k8.c between various commits from
the cpufreq-current and cpufreq trees and commit
35bed9c465bcf6e9e797cba9c54bab263e07be31
("cpumask:partial-revert-powernow-k8") from the rr tree.

I fixed it up (see below) and can carry the fix as necessary.
-- 
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

diff --cc arch/x86/kernel/cpu/cpufreq/powernow-k8.c
index 83515f16,8b99478..0000000
--- a/arch/x86/kernel/cpu/cpufreq/powernow-k8.c
+++ b/arch/x86/kernel/cpu/cpufreq/powernow-k8.c
@@@ -1242,38 -1148,34 +1241,42 @@@ static int __cpuinit powernowk8_cpu_ini
  		 * an UP version, and is deprecated by AMD.
  		 */
  		if (num_online_cpus() != 1) {
 -#ifndef CONFIG_ACPI_PROCESSOR
 -			printk(KERN_ERR PFX "ACPI Processor support is required "
 -			       "for SMP systems but is absent. Please load the "
 -			       "ACPI Processor module before starting this "
 -			       "driver.\n");
 -#else
 -			printk(KERN_ERR FW_BUG PFX "Your BIOS does not provide"
 -			       " ACPI _PSS objects in a way that Linux "
 -			       "understands. Please report this to the Linux "
 -			       "ACPI maintainers and complain to your BIOS "
 -			       "vendor.\n");
 -#endif
 +			/*
 +			 * Replace this one with print_once as soon as such a
 +			 * thing gets introduced
 +			 */
 +			if (!print_once) {
 +				WARN_ONCE(1, KERN_ERR FW_BUG PFX "Your BIOS "
 +					  "does not provide ACPI _PSS objects "
 +					  "in a way that Linux understands. "
 +					  "Please report this to the Linux ACPI"
 +					  " maintainers and complain to your "
 +					  "BIOS vendor.\n");
 +				print_once++;
 +			}
- 			goto err_out;
+ 			kfree(data);
+ 			return -ENODEV;
  		}
  		if (pol->cpu != 0) {
  			printk(KERN_ERR FW_BUG PFX "No ACPI _PSS objects for "
  			       "CPU other than CPU0. Complain to your BIOS "
  			       "vendor.\n");
- 			goto err_out;
+ 			kfree(data);
+ 			return -ENODEV;
  		}
  		rc = find_psb_table(data);
- 		if (rc)
- 			goto err_out;
+ 		if (rc) {
+ 			kfree(data);
+ 			return -ENODEV;
+ 		}
 -	}
 +
 +		/* Take a crude guess here.
 +		 * That guess was in microseconds, so multiply with 1000 */
 +		pol->cpuinfo.transition_latency = (
 +			 ((data->rvo + 8) * data->vstable * VST_UNITS_20US) +
 +			 ((1 << data->irt) * 30)) * 1000;
 +	} else /* ACPI _PSS objects available */
 +		pol->cpuinfo.transition_latency = get_transition_latency(data);
  
  	/* only run on specific CPU from here on */
  	oldmask = current->cpus_allowed;
