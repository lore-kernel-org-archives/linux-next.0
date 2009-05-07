From: Ingo Molnar <mingo@elte.hu>
Subject: Re: linux-next: sched tree build warning
Date: Thu, 7 May 2009 09:39:20 +0200
Message-ID: <20090507073920.GB18125@elte.hu>
References: <20090507112114.d6612ebe.sfr@canb.auug.org.au> <alpine.DEB.2.00.0905062341420.22671@chino.kir.corp.google.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mx3.mail.elte.hu ([157.181.1.138]:38168 "EHLO mx3.mail.elte.hu"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752217AbZEGHji (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Thu, 7 May 2009 03:39:38 -0400
Content-Disposition: inline
In-Reply-To: <alpine.DEB.2.00.0905062341420.22671@chino.kir.corp.google.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: David Rientjes <rientjes@google.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, Thomas Gleixner <tglx@linutronix.de>, "H. Peter Anvin" <hpa@zytor.com>, linux-next@vger.kernel.org


* David Rientjes <rientjes@google.com> wrote:

> On Thu, 7 May 2009, Stephen Rothwell wrote:
> 
> > Hi all,
> > 
> > Today's linux-next build (powerpc ppc64_defconfig) produced this warning:
> > 
> > kernel/sched.c: In function 'sched_show_task':
> > kernel/sched.c:6677: warning: format '%08x' expects type 'unsigned int', but argument 5 has type 'long unsigned int'
> > 
> > Introduced by commit 12b5c43486202dd4ff3cfd59a190984a0dd7f6fd ("sched:
> > emit thread info flags with stack trace") from the sched tree.
> > 
> > thread_info::flags is "unsigned long" on all architectures except alpha
> > (where it is "unsigned int"), ia64 and x86 (where it is "__u32").
> > 
> 
> Thanks Stephen.  There's a hacky way around this if Ingo will put 
> up with it.

> -	printk(KERN_CONT "%5lu %5d %6d 0x%08x\n", free,
> +	printk(KERN_CONT "%5lu %5d %6d 0x%08lx\n", free,
>  		task_pid_nr(p), task_pid_nr(p->real_parent),
> -		task_thread_info(p)->flags);
> +		(unsigned long)task_thread_info(p)->flags);

applied, thanks.

	Ingo
