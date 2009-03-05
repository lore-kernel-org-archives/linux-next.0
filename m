From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the rr tree with the cpufreq tree
Date: Thu, 5 Mar 2009 14:59:43 +1100
Message-ID: <20090305145943.fceab54e.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:33383 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1753245AbZCEEYm (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Wed, 4 Mar 2009 23:24:42 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Rusty Russell <rusty@rustcorp.com.au>
Cc: linux-next@vger.kernel.org, Dave Jones <davej@redhat.com>

Hi Rusty,

Today's linux-next merge of the rr tree got a conflict in
arch/x86/kernel/cpu/cpufreq/speedstep-lib.c between commit
bbfebd66554b934b270c4c49442f4fe5e62df0e5 ("[CPUFREQ] checkpatch cleanups
for speedstep related drivers") from the cpufreq tree and commit
8bd527201fec91f5b42e7ee56840eba399356003
("cpumask:remove-cpumask-games-arch-x86-kernel-cpu-cpufreq-speedstep-ich.c")
from the rr tree.

Just context changes.  I fixed it up (see below) and can carry the fix as
necessary.
-- 
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

diff --cc arch/x86/kernel/cpu/cpufreq/speedstep-lib.c
index 2e3c686,4d82879..0000000
--- a/arch/x86/kernel/cpu/cpufreq/speedstep-lib.c
+++ b/arch/x86/kernel/cpu/cpufreq/speedstep-lib.c
@@@ -218,27 -200,25 +218,27 @@@ static unsigned int pentium4_get_freque
  	/* Multiplier. */
  	mult = msr_lo >> 24;
  
 -	dprintk("P4 - FSB %u kHz; Multiplier %u; Speed %u kHz\n", fsb, mult, (fsb * mult));
 +	dprintk("P4 - FSB %u kHz; Multiplier %u; Speed %u kHz\n",
 +			fsb, mult, (fsb * mult));
  
 -	return (fsb * mult);
 +	ret = (fsb * mult);
 +	return ret;
  }
  
- 
+ /* Warning: may get called from smp_call_function_single. */
 -unsigned int speedstep_get_processor_frequency(unsigned int processor)
 +unsigned int speedstep_get_frequency(unsigned int processor)
  {
  	switch (processor) {
 -	case SPEEDSTEP_PROCESSOR_PCORE:
 +	case SPEEDSTEP_CPU_PCORE:
  		return pentium_core_get_frequency();
 -	case SPEEDSTEP_PROCESSOR_PM:
 +	case SPEEDSTEP_CPU_PM:
  		return pentiumM_get_frequency();
 -	case SPEEDSTEP_PROCESSOR_P4D:
 -	case SPEEDSTEP_PROCESSOR_P4M:
 +	case SPEEDSTEP_CPU_P4D:
 +	case SPEEDSTEP_CPU_P4M:
  		return pentium4_get_frequency();
 -	case SPEEDSTEP_PROCESSOR_PIII_T:
 -	case SPEEDSTEP_PROCESSOR_PIII_C:
 -	case SPEEDSTEP_PROCESSOR_PIII_C_EARLY:
 +	case SPEEDSTEP_CPU_PIII_T:
 +	case SPEEDSTEP_CPU_PIII_C:
 +	case SPEEDSTEP_CPU_PIII_C_EARLY:
  		return pentium3_get_frequency(processor);
  	default:
  		return 0;
