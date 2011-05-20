From: Daniel Hellstrom <daniel@gaisler.com>
Subject: Re: linux-next: manual merge of the tip tree with the sparc tree
Date: Fri, 20 May 2011 14:48:40 +0200
Message-ID: <4DD66328.4010603@gaisler.com>
References: <20110517131435.aceca54e.sfr@canb.auug.org.au>	 <4DD51D37.3010907@gaisler.com> <1305819306.2466.7228.camel@twins>	 <4DD60530.6090900@gaisler.com> <1305879113.2466.7231.camel@twins>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail202c2.megamailservers.com ([69.49.111.103]:43018 "EHLO
	mail202c2.megamailservers.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1752233Ab1ETMty (ORCPT
	<rfc822;linux-next@vger.kernel.org>);
	Fri, 20 May 2011 08:49:54 -0400
In-Reply-To: <1305879113.2466.7231.camel@twins>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Peter Zijlstra <peterz@infradead.org>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>, "H. Peter Anvin" <hpa@zytor.com>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, "David S. Miller" <davem@davemloft.net>

Peter Zijlstra wrote:

>On Fri, 2011-05-20 at 08:07 +0200, Daniel Hellstrom wrote:
>  
>
>>Peter Zijlstra wrote:
>>
>>    
>>
>>>On Thu, 2011-05-19 at 15:37 +0200, Daniel Hellstrom wrote:
>>>
>>>
>>> 
>>>
>>>      
>>>
>>>>diff --git a/arch/sparc/kernel/smp_32.c b/arch/sparc/kernel/smp_32.c
>>>>index 41102c5..d5b3958 100644
>>>>--- a/arch/sparc/kernel/smp_32.c
>>>>+++ b/arch/sparc/kernel/smp_32.c
>>>>@@ -156,11 +156,11 @@ void arch_send_call_function_ipi_mask(const struct 
>>>>cpumask *mask)
>>>>
>>>>void smp_resched_interrupt(void)
>>>>{
>>>>+       irq_enter();
>>>>+       scheduler_ipi();
>>>>       local_cpu_data().irq_resched_count++;
>>>>-       /*
>>>>-        * do nothing, since it all was about calling re-schedule
>>>>-        * routine called by interrupt return code.
>>>>-        */
>>>>+       irq_exit();
>>>>+       /* re-schedule routine called by interrupt return code. */
>>>>}
>>>>   
>>>>
>>>>        
>>>>
>>>That doesn't look like an IPI, that looks like its calls the function on
>>>the local cpu, which is completely pointless.
>>> 
>>>
>>>      
>>>
>>The above function is one of the IPI interrupt handlers.
>>
>>The smp_send_reschedule() is called by the generic code, it is 
>>responsible for sending an IRQ to the target CPU, that CPU comes into 
>>smp_resched_interrupt above from the IRQ trap handler. So yes, the 
>>scheduler_ipi() is called on the local CPU, but on the CPU taking the 
>>IPI not the CPU sending the IPI.
>>    
>>
>
>Ah, clearly I cannot read well, I actually thought that was
>smp_send_reschedule(). OK, if sparc32 is now actually sending IPIs and
>the above is the handler, then you're completely right, sorry for the
>confusion.
>  
>
Yes, my patches implements IPI for sparc32.

>Also, since sparc32 now grew this IPI, you can remove:
>
>+++ b/init/Kconfig
>@@ -827,6 +827,11 @@ config SCHED_AUTOGROUP
>          desktop applications.  Task group autogeneration is currently based
>          upon task session.
> 
>+config SCHED_TTWU_QUEUE
>+       bool
>+       depends on !SPARC32
>+       default y
>+
>  
>

Do you think this is an acceptable patch? If so I will send these two 
patches to the sparclinux list unless you think otherwise.

Thank you for enlightening this,
Daniel


Subject: [PATCH] SCHED_TTWU_QUEUE is not longer needed since sparc32 now 
implements IPI

Signed-off-by: Daniel Hellstrom <daniel@gaisler.com>
Reported-by: Peter Zijlstra <peterz@infradead.org>
---
 init/Kconfig   |    5 -----
 kernel/sched.c |    2 +-
 2 files changed, 1 insertions(+), 6 deletions(-)

diff --git a/init/Kconfig b/init/Kconfig
index df64627..a66b656 100644
--- a/init/Kconfig
+++ b/init/Kconfig
@@ -827,11 +827,6 @@ config SCHED_AUTOGROUP
          desktop applications.  Task group autogeneration is currently 
based
          upon task session.

-config SCHED_TTWU_QUEUE
-       bool
-       depends on !SPARC32
-       default y
-
 config MM_OWNER
        bool

diff --git a/kernel/sched.c b/kernel/sched.c
index c62acf4..0516af4 100644
--- a/kernel/sched.c
+++ b/kernel/sched.c
@@ -2564,7 +2564,7 @@ static void ttwu_queue(struct task_struct *p, int cpu)
 {
        struct rq *rq = cpu_rq(cpu);

-#if defined(CONFIG_SMP) && defined(CONFIG_SCHED_TTWU_QUEUE)
+#if defined(CONFIG_SMP)
        if (sched_feat(TTWU_QUEUE) && cpu != smp_processor_id()) {
                ttwu_queue_remote(p, cpu);
                return;
--
