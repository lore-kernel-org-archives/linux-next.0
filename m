From: Ingo Molnar <mingo@elte.hu>
Subject: Re: linux-next: tip-core build failure
Date: Sun, 14 Sep 2008 14:43:20 +0200
Message-ID: <20080914124320.GG16097@elte.hu>
References: <20080913111423.981554c3.sfr@canb.auug.org.au> <200809131144.36507.rui.p.m.sousa@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mx3.mail.elte.hu ([157.181.1.138]:35781 "EHLO mx3.mail.elte.hu"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1753065AbYINMne (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Sun, 14 Sep 2008 08:43:34 -0400
Content-Disposition: inline
In-Reply-To: <200809131144.36507.rui.p.m.sousa@gmail.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Rui Sousa <rui.p.m.sousa@gmail.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org


* Rui Sousa <rui.p.m.sousa@gmail.com> wrote:

> On Saturday 13 September 2008 03:14, Stephen Rothwell wrote:
> > Hi Ingo,
> >
> > Today's linux-next build (powerpc allnoconfig) failed like this:
> >
> > In file included from arch/powerpc/include/asm/system.h:8,
> >                  from include/linux/list.h:7,
> >                  from include/linux/signal.h:8,
> >                  from arch/powerpc/kernel/asm-offsets.c:16:
> > include/linux/irqflags.h:89:1: warning: "local_irq_save" redefined
> > In file included from arch/powerpc/include/asm/irqflags.h:11,
> >                  from include/linux/irqflags.h:55,
> >                  from arch/powerpc/include/asm/system.h:8,
> >                  from include/linux/list.h:7,
> >                  from include/linux/signal.h:8,
> >                  from arch/powerpc/kernel/asm-offsets.c:16:
> > arch/powerpc/include/asm/hw_irq.h:115:1: warning: this is the location of
> > the previous definition
> >
> > And it went downhill from there.
> >
> > Introduced by commit bd8fbdee6562ee526f3c2582a3b373ef195015dd ("lockdep:
> > fix compilation when CONFIG_TRACE_IRQFLAGS_SUPPORT is not set") which I
> > have reverted.
> 
> Ingo,
> 
> Do you agree that the original (in include/linux/irqflags.h):
> 
> #define raw_local_irq_disable()        local_irq_disable()
> 
> should be
> 
> #define local_irq_disable()		raw_local_irq_disable()        
> 
> and that architecture specific files should only define the raw_xxx() 
> macros? It seems I missed a bunch of need changes in the original 
> patch, but if it's the right way to go I can work on a patch to update 
> the other archs too.

yes, i agree with that direction. But it's difficult: the non-x86 
architectures do not get much testing in practice at the development 
stage so trivial build bugs like this get only found at the latest 
stage. That's not actually bad in itself - stuff that is not used does 
not matter nearly as much as stuff that does get used.

	Ingo
