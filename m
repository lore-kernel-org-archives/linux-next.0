From: David Rientjes <rientjes@google.com>
Subject: Re: linux-next: sched tree build warning
Date: Wed, 6 May 2009 23:45:29 -0700 (PDT)
Message-ID: <alpine.DEB.2.00.0905062341420.22671@chino.kir.corp.google.com>
References: <20090507112114.d6612ebe.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Return-path: <linux-next-owner@vger.kernel.org>
Received: from smtp-out.google.com ([216.239.33.17]:40436 "EHLO
	smtp-out.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753577AbZEGGpk (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Thu, 7 May 2009 02:45:40 -0400
Received: from zps76.corp.google.com (zps76.corp.google.com [172.25.146.76])
	by smtp-out.google.com with ESMTP id n476jb0T006529
	for <linux-next@vger.kernel.org>; Thu, 7 May 2009 07:45:38 +0100
Received: from wa-out-1112.google.com (wafk17.prod.google.com [10.114.187.17])
	by zps76.corp.google.com with ESMTP id n476j27E030908
	for <linux-next@vger.kernel.org>; Wed, 6 May 2009 23:45:36 -0700
Received: by wa-out-1112.google.com with SMTP id k17so377489waf.20
        for <linux-next@vger.kernel.org>; Wed, 06 May 2009 23:45:35 -0700 (PDT)
In-Reply-To: <20090507112114.d6612ebe.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>, "H. Peter Anvin" <hpa@zytor.com>, linux-next@vger.kernel.org

On Thu, 7 May 2009, Stephen Rothwell wrote:

> Hi all,
> 
> Today's linux-next build (powerpc ppc64_defconfig) produced this warning:
> 
> kernel/sched.c: In function 'sched_show_task':
> kernel/sched.c:6677: warning: format '%08x' expects type 'unsigned int', but argument 5 has type 'long unsigned int'
> 
> Introduced by commit 12b5c43486202dd4ff3cfd59a190984a0dd7f6fd ("sched:
> emit thread info flags with stack trace") from the sched tree.
> 
> thread_info::flags is "unsigned long" on all architectures except alpha
> (where it is "unsigned int"), ia64 and x86 (where it is "__u32").
> 

Thanks Stephen.  There's a hacky way around this if Ingo will put up with 
it.



No architecture uses more than 32 bits for thread info flags, yet most 
declare it with type `unsigned long'.  Thus, we only show 32 bits but cast 
the variable to unsigned long for all architectures.

Signed-off-by: David Rientjes <rientjes@google.com>
---
diff --git a/kernel/sched.c b/kernel/sched.c
--- a/kernel/sched.c
+++ b/kernel/sched.c
@@ -6490,9 +6490,9 @@ void sched_show_task(struct task_struct *p)
 #ifdef CONFIG_DEBUG_STACK_USAGE
 	free = stack_not_used(p);
 #endif
-	printk(KERN_CONT "%5lu %5d %6d 0x%08x\n", free,
+	printk(KERN_CONT "%5lu %5d %6d 0x%08lx\n", free,
 		task_pid_nr(p), task_pid_nr(p->real_parent),
-		task_thread_info(p)->flags);
+		(unsigned long)task_thread_info(p)->flags);
 
 	show_stack(p, NULL);
 }
