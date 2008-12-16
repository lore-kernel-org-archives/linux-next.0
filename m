From: Ingo Molnar <mingo@elte.hu>
Subject: Re: [mmotm and linux-next][PATCH] irq: enclose irq_desc_lock_class
	in CONFIG_LOCKDEP
Date: Tue, 16 Dec 2008 11:18:27 +0100
Message-ID: <20081216101827.GB27481@elte.hu>
References: <20081216170635.DBB8.KOSAKI.MOTOHIRO@jp.fujitsu.com> <20081216003428.43d37b6b.akpm@linux-foundation.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mx3.mail.elte.hu ([157.181.1.138]:33802 "EHLO mx3.mail.elte.hu"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752594AbYLPKSk (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Tue, 16 Dec 2008 05:18:40 -0500
Content-Disposition: inline
In-Reply-To: <20081216003428.43d37b6b.akpm@linux-foundation.org>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: KOSAKI Motohiro <kosaki.motohiro@jp.fujitsu.com>, Yinghai Lu <yhlu.kernel@gmail.com>, LKML <linux-kernel@vger.kernel.org>, linux-next <linux-next@vger.kernel.org>


* Andrew Morton <akpm@linux-foundation.org> wrote:

> On Tue, 16 Dec 2008 17:08:43 +0900 (JST) KOSAKI Motohiro <kosaki.motohiro@jp.fujitsu.com> wrote:
> 
> > 
> > 
> > Applied after: linux-next.patch
> > 
> > ==
> > Subject: [mmotm][PATCH] irq: enclose irq_desc_lock_class in CONFIG_LOCKDEP
> > 
> > commit 08678b0841267c1d00d771fe01548d86043d065e introduced
> > irq_desc_lock_class variable.
> > But it is used only if CONFIG_LOCKDEP=Y.
> > otherwise, following warnings happend.
> > 
> > 	  CC      kernel/irq/handle.o
> > 	kernel/irq/handle.c:26: warning: 'irq_desc_lock_class' defined but not used
> > 
> > 
> > Signed-off-by: KOSAKI Motohiro <kosaki.motohiro@jp.fujitsu.com>
> > CC: Yinghai Lu <yhlu.kernel@gmail.com>
> > CC: Ingo Molnar <mingo@elte.hu>
> > ---
> >  kernel/irq/handle.c |    2 ++
> >  1 file changed, 2 insertions(+)
> > 
> > Index: b/kernel/irq/handle.c
> > ===================================================================
> > --- a/kernel/irq/handle.c
> > +++ b/kernel/irq/handle.c
> > @@ -20,10 +20,12 @@
> >  
> >  #include "internals.h"
> >  
> > +#ifdef CONFIG_LOCKDEP
> >  /*
> >   * lockdep: we want to handle all irq_desc locks as a single lock-class:
> >   */
> >  static struct lock_class_key irq_desc_lock_class;
> > +#endif
> >  
> >  /**
> >   * handle_bad_irq - handle spurious and unhandled irqs
> > 
> 
> No, lockdep.h (which we forgot to include) already handles that:
> 
> # define lockdep_set_class(lock, key)		do { (void)(key); } while (0)
> 
> the problem is that the code which references irq_desc_lock_class is
> inside #ifdef CONFIG_SPARSE_IRQ, so this is a better fix:

agreed that this is the better fix - applied to tip/irq/sparseirq, thanks!

	Ingo
