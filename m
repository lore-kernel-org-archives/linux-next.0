From: Ingo Molnar <mingo@elte.hu>
Subject: Re: linux-next: manual merge of the block tree
Date: Fri, 27 Jun 2008 11:57:37 +0200
Message-ID: <20080627095737.GA22123@elte.hu>
References: <20080627161347.0af905fb.sfr@canb.auug.org.au> <20080627083053.GC6562@elte.hu> <20080627084758.GR20851@kernel.dk> <20080627092626.GA496@elte.hu>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mx3.mail.elte.hu ([157.181.1.138]:41977 "EHLO mx3.mail.elte.hu"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752043AbYF0J6A (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Fri, 27 Jun 2008 05:58:00 -0400
Content-Disposition: inline
In-Reply-To: <20080627092626.GA496@elte.hu>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Jens Axboe <jens.axboe@oracle.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, Thomas Gleixner <tglx@linutronix.de>, "H. Peter Anvin" <hpa@zytor.com>, the arch/x86 maintainers <x86@kernel.org>


* Ingo Molnar <mingo@elte.hu> wrote:

> i'll put this into tip/generic-ipi and wont put into the x86 topics 
> towards linux-next - i just want to see the effects in practice.
> 
> This is the 102th -tip topic, there's space for all :-)

Jens, i've started testing this in -tip - there are three small build 
fixlets in the tip/generic-ipi branch so far.

If you dont have these fixes already then you can pull them from:

 git://git.kernel.org/pub/scm/linux/kernel/git/tip/linux-2.6-tip.git generic-ipi

	Ingo

------------->
commit 8b604d520799a995946437d041f46bae7d5bcc8c
Author: Ingo Molnar <mingo@elte.hu>
Date:   Fri Jun 27 11:52:45 2008 +0200

    fix: "smp_call_function: get rid of the unused nonatomic/retry argument"
    
    drivers/char/sysrq.c: In function 'sysrq_showregs_othercpus':
    drivers/char/sysrq.c:218: error: too many arguments to function 'smp_call_function'
    
    Signed-off-by: Ingo Molnar <mingo@elte.hu>

diff --git a/drivers/char/sysrq.c b/drivers/char/sysrq.c
index dbce126..8fdfe9c 100644
--- a/drivers/char/sysrq.c
+++ b/drivers/char/sysrq.c
@@ -215,7 +215,7 @@ static void showacpu(void *dummy)
 
 static void sysrq_showregs_othercpus(struct work_struct *dummy)
 {
-	smp_call_function(showacpu, NULL, 0, 0);
+	smp_call_function(showacpu, NULL, 0);
 }
 
 static DECLARE_WORK(sysrq_showallcpus, sysrq_showregs_othercpus);

commit ce0d1b6f73870878aae622b72e85fe8f7a16b51c
Author: Ingo Molnar <mingo@elte.hu>
Date:   Fri Jun 27 11:50:32 2008 +0200

    fix: "smp_call_function: get rid of the unused nonatomic/retry argument"
    
    fix:
    
    kernel/smp.c: In function 'smp_call_function_mask':
    kernel/smp.c:303: error: too many arguments to function 'smp_call_function_single'
    
    Signed-off-by: Ingo Molnar <mingo@elte.hu>

diff --git a/kernel/smp.c b/kernel/smp.c
index 7e0432a..4f582b2 100644
--- a/kernel/smp.c
+++ b/kernel/smp.c
@@ -300,7 +300,7 @@ int smp_call_function_mask(cpumask_t mask, void (*func)(void *), void *info,
 		return 0;
 	else if (num_cpus == 1) {
 		cpu = first_cpu(mask);
-		return smp_call_function_single(cpu, func, info, 0, wait);
+		return smp_call_function_single(cpu, func, info, wait);
 	}
 
 	if (!wait) {

commit 127a237a1ff49fa5b8e00af91e841598aeea3513
Author: Ingo Molnar <mingo@elte.hu>
Date:   Fri Jun 27 11:48:22 2008 +0200

    fix "smp_call_function: get rid of the unused nonatomic/retry argument"
    
    fix:
    
    arch/x86/kernel/process.c: In function 'cpu_idle_wait':
    arch/x86/kernel/process.c:64: error: too many arguments to function 'smp_call_function'
    
    Signed-off-by: Ingo Molnar <mingo@elte.hu>

diff --git a/arch/x86/kernel/process.c b/arch/x86/kernel/process.c
index ba370dc..2dad8fe 100644
--- a/arch/x86/kernel/process.c
+++ b/arch/x86/kernel/process.c
@@ -61,7 +61,7 @@ void cpu_idle_wait(void)
 {
 	smp_mb();
 	/* kick all the CPUs so that they exit out of pm_idle */
-	smp_call_function(do_nothing, NULL, 0, 1);
+	smp_call_function(do_nothing, NULL, 1);
 }
 EXPORT_SYMBOL_GPL(cpu_idle_wait);
 
