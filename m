From: Daniel Hellstrom <daniel@gaisler.com>
Subject: Re: linux-next: manual merge of the tip tree with the sparc tree
Date: Thu, 19 May 2011 15:37:59 +0200
Message-ID: <4DD51D37.3010907@gaisler.com>
References: <20110517131435.aceca54e.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail202c2.megamailservers.com ([69.49.111.103]:45625 "EHLO
	mail202c2.megamailservers.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1754532Ab1ESQop (ORCPT
	<rfc822;linux-next@vger.kernel.org>);
	Thu, 19 May 2011 12:44:45 -0400
In-Reply-To: <20110517131435.aceca54e.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>, "H. Peter Anvin" <hpa@zytor.com>, Peter Zijlstra <peterz@infradead.org>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, "David S. Miller" <davem@davemloft.net>

Stephen Rothwell wrote:

>Hi all,
>
>Today's linux-next merge of the tip tree got a conflict in
>arch/sparc/kernel/smp_32.c between commit d6d048192b1d ("sparc32:
>implement SMP IPIs using the generic functions") from the sparc tree and
>commit 184748cc50b2 ("sched: Provide scheduler_ipi() callback in response
>to smp_send_reschedule()") from the tip tree.
>
>I fixed it up (I am pretty sure that the sparc tree patch supercedes the
>tip tree one) and can carry the fix as necessary.
>  
>
Thanks for noticing this.

I looked at linux-next and I think the call to the scheduler_ipi is 
missing in the resched interrupt routine. I believe that the below patch 
should be applied ontop of linux-next. Could you include it in the merge 
or what do you suggest I do?

Thanks,
Daniel


diff --git a/arch/sparc/kernel/smp_32.c b/arch/sparc/kernel/smp_32.c
index 41102c5..d5b3958 100644
--- a/arch/sparc/kernel/smp_32.c
+++ b/arch/sparc/kernel/smp_32.c
@@ -156,11 +156,11 @@ void arch_send_call_function_ipi_mask(const struct 
cpumask *mask)

 void smp_resched_interrupt(void)
 {
+       irq_enter();
+       scheduler_ipi();
        local_cpu_data().irq_resched_count++;
-       /*
-        * do nothing, since it all was about calling re-schedule
-        * routine called by interrupt return code.
-        */
+       irq_exit();
+       /* re-schedule routine called by interrupt return code. */
 }

 void smp_call_function_single_interrupt(void)
