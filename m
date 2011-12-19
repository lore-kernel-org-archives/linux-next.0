From: Martin Schwidefsky <schwidefsky@de.ibm.com>
Subject: Re: linux-next: manual merge of the tip tree with the cputime tree
Date: Mon, 19 Dec 2011 20:06:03 +0100
Message-ID: <20111219200603.126287ed@de.ibm.com>
References: <20111219154010.c2044c038a6174dd8fb6f477@canb.auug.org.au>
	<20111219080813.GB30432@elte.hu>
	<20111219101134.3c2c0db5@de.ibm.com>
	<20111219103513.GA17928@elte.hu>
	<20111219112547.GA32375@elte.hu>
	<20111219152409.3a2c213e@de.ibm.com>
	<20111219163009.GC10017@elte.hu>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from e06smtp16.uk.ibm.com ([195.75.94.112]:36530 "EHLO
	e06smtp16.uk.ibm.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751393Ab1LSTGO (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Mon, 19 Dec 2011 14:06:14 -0500
Received: from /spool/local
	by e06smtp16.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only! Violators will be prosecuted
	for <linux-next@vger.kernel.org> from <schwidefsky@de.ibm.com>;
	Mon, 19 Dec 2011 19:06:09 -0000
In-Reply-To: <20111219163009.GC10017@elte.hu>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Ingo Molnar <mingo@elte.hu>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, Thomas Gleixner <tglx@linutronix.de>, "H. Peter Anvin" <hpa@zytor.com>, Peter Zijlstra <peterz@infradead.org>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Glauber Costa <glommer@parallels.com>

On Mon, 19 Dec 2011 17:30:09 +0100
Ingo Molnar <mingo@elte.hu> wrote:

> 
> * Martin Schwidefsky <schwidefsky@de.ibm.com> wrote:
> 
> > > That way your commits are preserved and the conflicts are 
> > > resolved.
> > 
> > Just did that and pushed out the result on
> > 
> >  git://git.kernel.org/pub/scm/linux/kernel/git/s390/linux.git cputime-tip
> 
> Hm, this fails spectacularly on 32-bit x86:
> 
> /home/mingo/tip/drivers/cpufreq/cpufreq_ondemand.c: In function 'get_cpu_idle_time_jiffy':
> /home/mingo/tip/drivers/cpufreq/cpufreq_ondemand.c:137: error: expected ';' before ')' token
> /home/mingo/tip/drivers/cpufreq/cpufreq_ondemand.c:137: error: expected statement before ')' token

Arg, sorry. Once more with feeling. I've replaced cputime-tip with a version
that survived "make allmodconfig; make" on x86-32, x86-64, powerpc and s390
(with JUMP_LABEL=n, there is another bug lurking). ia64, the third architecture
with VIRT_CPU_ACCOUNTING=y, does not compile due to a cyclic dependency in
asm-offsets.c vs sched.h. Now it only has to work ..

-- 
blue skies,
   Martin.

"Reality continues to ruin my life." - Calvin.
