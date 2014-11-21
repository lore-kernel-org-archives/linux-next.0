From: Steven Rostedt <rostedt@goodmis.org>
Subject: Re: linux-next: build failure after merge of the ftrace tree
Date: Fri, 21 Nov 2014 07:43:43 -0500
Message-ID: <20141121074343.00f72a6a@gandalf.local.home>
References: <20141121183215.01ba539c@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from cdptpa-outbound-snat.email.rr.com ([107.14.166.231]:32579 "EHLO
	cdptpa-oedge-vip.email.rr.com" rhost-flags-OK-OK-OK-FAIL)
	by vger.kernel.org with ESMTP id S1753877AbaKUMny (ORCPT
	<rfc822;linux-next@vger.kernel.org>);
	Fri, 21 Nov 2014 07:43:54 -0500
In-Reply-To: <20141121183215.01ba539c@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Jiri Kosina <jkosina@suse.cz>, Petr Mladek <pmladek@suse.cz>, "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>Jiri Kosina <jkosina@suse.cz>

On Fri, 21 Nov 2014 18:32:15 +1100
Stephen Rothwell <sfr@canb.auug.org.au> wrote:

> Hi Steven,
> 
> After merging the ftrace tree, today's linux-next build (powerpc
> allnoconfig) failed like this:
> 
> In file included from include/asm-generic/percpu.h:6:0,
>                  from arch/powerpc/include/asm/percpu.h:19,
>                  from include/linux/percpu.h:11,
>                  from include/linux/sched.h:41,
>                  from arch/powerpc/kernel/asm-offsets.c:17:
> include/linux/percpu.h:138:17: error: 'printk_func_t' undeclared here (not in a function)
>  DECLARE_PER_CPU(printk_func_t, printk_func);
>                  ^
> include/linux/percpu-defs.h:101:38: note: in definition of macro 'DECLARE_PER_CPU_SECTION'
>   extern __PCPU_ATTRS(sec) __typeof__(type) name
>                                       ^
> include/linux/percpu.h:138:1: note: in expansion of macro 'DECLARE_PER_CPU'
>  DECLARE_PER_CPU(printk_func_t, printk_func);
>  ^
> 
> Caused by commit afdc34a3d3b8 ("printk: Add per_cpu printk func to
> allow printk to be diverted").  See Rule 1 in
> Documentation/SubmitChecklist.
> 

I had to fight header include hell with that change. That's why rule 1
wasn't followed so well.

Thanks Jiri for fixing it. I'll start running your patch through my
tests.

-- Steve
