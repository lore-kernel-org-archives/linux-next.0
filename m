From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: rr tree build failure
Date: Fri, 11 Dec 2009 12:26:48 +1100
Message-ID: <20091211122648.8b305b52.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:48195 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1761767AbZLKB0o (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Thu, 10 Dec 2009 20:26:44 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Rusty Russell <rusty@rustcorp.com.au>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Dave Jones <davej@redhat.com>

Hi Rusty,

Today's linux-next build (x86_64 allmodconfig) failed like this:

arch/x86/kernel/cpu/cpufreq/powernow-k8.c: In function 'powernowk8_target':
arch/x86/kernel/cpu/cpufreq/powernow-k8.c:1139: error: implicit declaration of function 'tsk_cpumask'
arch/x86/kernel/cpu/cpufreq/powernow-k8.c:1139: warning: passing argument 2 of 'cpumask_copy' makes pointer from integer without a cast
include/linux/cpumask.h:466: note: expected 'const struct cpumask *' but argument is of type 'int'

Caused by commit 9dd4c5ab546fcac98cfb9ca24ed5cc1bf7f08334
("cpumask:tsk_cpus_allowed-not-tsk_cpumask") from the rr tree interacting
with commit b8cbe7e82ec8b55d7bbdde66fc69e788fde00dc6 ("[CPUFREQ] cpumask:
don't put a cpumask on the stack in x86...cpufreq/powernow-k8.c") from
the cpufreq tree.

I have applied this merge fix up patch and can carry it as necessary:

From: Stephen Rothwell <sfr@canb.auug.org.au>
Date: Fri, 11 Dec 2009 12:21:00 +1100
Subject: [PATCH] rr: cpufreq: fix up for api name change

Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
---
 arch/x86/kernel/cpu/cpufreq/powernow-k8.c |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/arch/x86/kernel/cpu/cpufreq/powernow-k8.c b/arch/x86/kernel/cpu/cpufreq/powernow-k8.c
index a9df944..f125e5c 100644
--- a/arch/x86/kernel/cpu/cpufreq/powernow-k8.c
+++ b/arch/x86/kernel/cpu/cpufreq/powernow-k8.c
@@ -1136,7 +1136,7 @@ static int powernowk8_target(struct cpufreq_policy *pol,
 	if (!alloc_cpumask_var(&oldmask, GFP_KERNEL))
 		return -ENOMEM;
 
-	cpumask_copy(oldmask, tsk_cpumask(current));
+	cpumask_copy(oldmask, tsk_cpus_allowed(current));
 	set_cpus_allowed_ptr(current, cpumask_of(pol->cpu));
 
 	if (smp_processor_id() != pol->cpu) {
-- 
1.6.5.4

-- 
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/
