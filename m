From: Ingo Molnar <mingo@elte.hu>
Subject: Re: linux-next: x86 tree build warning
Date: Fri, 6 Mar 2009 12:05:08 +0100
Message-ID: <20090306110508.GE21168@elte.hu>
References: <20090306114744.faf153c5.sfr@canb.auug.org.au> <aa79d98a0903052001w57142b11p5c4dfa228f94c1f7@mail.gmail.com> <aa79d98a0903052123i770bc198i425ac2389a8986fa@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mx3.mail.elte.hu ([157.181.1.138]:52388 "EHLO mx3.mail.elte.hu"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751406AbZCFLF3 (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Fri, 6 Mar 2009 06:05:29 -0500
Content-Disposition: inline
In-Reply-To: <aa79d98a0903052123i770bc198i425ac2389a8986fa@mail.gmail.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Cyrill Gorcunov <gorcunov@gmail.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, Thomas Gleixner <tglx@linutronix.de>, "H. Peter Anvin" <hpa@zytor.com>, linux-next@vger.kernel.org


* Cyrill Gorcunov <gorcunov@gmail.com> wrote:

> On Fri, Mar 6, 2009 at 7:01 AM, Cyrill Gorcunov <gorcunov@gmail.com> wrote:
> > On 3/6/09, Stephen Rothwell <sfr@canb.auug.org.au> wrote:
> >> Hi all,
> >>
> >> Today's linux-next build (x86_64 allmodconfig) produced this warning:
> >>
> >> In file included from drivers/char/epca.c:49:
> >> drivers/char/digiFep1.h:7:1: warning: "GLOBAL" redefined
> >> In file included from include/linux/linkage.h:5,
> >>                  from include/linux/kernel.h:11,
> >>                  from arch/x86/include/asm/system.h:10,
> >>                  from arch/x86/include/asm/processor.h:17,
> >>                  from include/linux/prefetch.h:14,
> >>                  from include/linux/list.h:6,
> >>                  from include/linux/module.h:9,
> >>                  from drivers/char/epca.c:29:
> >> arch/x86/include/asm/linkage.h:55:1: warning: this is the location of the
> >> previous definition
> >>
> >> Probably introduced by commit 95695547a7db44b88a7ee36cf5df188de267e99e
> >> ("x86: asm linkage - introduce GLOBAL macro") from the x86 tree.
> >> --
> >> Cheers,
> >> Stephen Rothwell                    sfr@canb.auug.org.au
> >> http://www.canb.auug.org.au/~sfr/
> >>
> >
> > Thanks Stephen, i will take a look. Iirc the same macro used as well
> > in ia64 arch, weird.
> >
> 
> I've just checked the sources -- it seems some definitions in 
> arch/x86/include/asm/linkage.h should be guarded by 
> __ASSEMBLY__ (ie -- __ALIGN, __ALIGN_STR and eventually 
> GLOBAL). I'll make a patch today evening (can't get access to 
> linux machine right now). Ingo?

sure, that's fine. It's not a fatal warning.

	Ingo
