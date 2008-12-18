From: Ingo Molnar <mingo@elte.hu>
Subject: Re: [mmotm and linux-next][PATCH] irq: enclose irq_desc_lock_class
	in CONFIG_LOCKDEP
Date: Thu, 18 Dec 2008 14:36:23 +0100
Message-ID: <20081218133621.GA4624@elte.hu>
References: <20081216121815.GA25019@elte.hu> <2f11576a0812160458y1c376878vc5fc7f3d208aa344@mail.gmail.com> <20081217193815.F674.KOSAKI.MOTOHIRO@jp.fujitsu.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mx2.mail.elte.hu ([157.181.151.9]:40559 "EHLO mx2.mail.elte.hu"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1750853AbYLRNgl (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Thu, 18 Dec 2008 08:36:41 -0500
Content-Disposition: inline
In-Reply-To: <20081217193815.F674.KOSAKI.MOTOHIRO@jp.fujitsu.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: KOSAKI Motohiro <kosaki.motohiro@jp.fujitsu.com>
Cc: Andrew Morton <akpm@linux-foundation.org>, Yinghai Lu <yhlu.kernel@gmail.com>, LKML <linux-kernel@vger.kernel.org>, linux-next <linux-next@vger.kernel.org>


* KOSAKI Motohiro <kosaki.motohiro@jp.fujitsu.com> wrote:

> > >> or, following #ifdef ?
> > >>
> > >> #if defined(CONFIG_SPARSE_IRQ) || defined(CONFIG_TRACE_IRQFLAGS)
> > >>
> > >>  /*
> > >>  * lockdep: we want to handle all irq_desc locks as a single lock-class:
> > >>  */
> > >>  static struct lock_class_key irq_desc_lock_class;
> > >
> > > instead of increasing the #ifdef jungle, how about removing some? For
> > > example is this distinction:
> > >
> > >> >  #ifndef CONFIG_SPARSE_IRQ
> > >
> > > really needed? We should use symmetric lock class annotations, regardless
> > > of how irq_desc[] is laid out.
> > 
> > it seems make much sense. I'll test your idea tommorow.
> 
> Ingo, you are right. I confirmed your idea works well.
> 
> 
> I tested following ten pattern.
> 
> o handle.c can compile without any warnings?
> 
> SPARSE_IRQ	TRACE_IRQ	LOCKDEP
> ------------------------------------------
> n		n		n
> Y		n		n
> n		Y		n
> n		n		Y
> Y		Y		n
> N		Y		Y
> Y		n		Y
> Y		Y		Y
> 
> 
> o builded kernel works well? (tested on x86_64)
> 
> SPARSE_IRQ	TRACE_IRQ	LOCKDEP
> ------------------------------------------
> n		n		n
> Y		Y		Y
> 
> 
> ==
> Subject: [PATCH] irq: remove unnecessary ifdef

Applied to tip/irq/sparseirq, thanks!

	Ingo
