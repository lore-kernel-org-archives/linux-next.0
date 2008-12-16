From: Ingo Molnar <mingo@elte.hu>
Subject: Re: [mmotm and linux-next][PATCH] irq: enclose irq_desc_lock_class
	in CONFIG_LOCKDEP
Date: Tue, 16 Dec 2008 13:18:15 +0100
Message-ID: <20081216121815.GA25019@elte.hu>
References: <20081216170635.DBB8.KOSAKI.MOTOHIRO@jp.fujitsu.com> <20081216003428.43d37b6b.akpm@linux-foundation.org> <20081216101827.GB27481@elte.hu> <20081216102340.GA1003@elte.hu> <2f11576a0812160315g3dea988ayfadba2117e172a2c@mail.gmail.com> <20081216112019.GE4299@elte.hu> <2f11576a0812160345t1cca65eg34064dbbcafcd280@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mx3.mail.elte.hu ([157.181.1.138]:50351 "EHLO mx3.mail.elte.hu"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751644AbYLPMSY (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Tue, 16 Dec 2008 07:18:24 -0500
Content-Disposition: inline
In-Reply-To: <2f11576a0812160345t1cca65eg34064dbbcafcd280@mail.gmail.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: KOSAKI Motohiro <kosaki.motohiro@jp.fujitsu.com>
Cc: Andrew Morton <akpm@linux-foundation.org>, Yinghai Lu <yhlu.kernel@gmail.com>, LKML <linux-kernel@vger.kernel.org>, linux-next <linux-next@vger.kernel.org>


* KOSAKI Motohiro <kosaki.motohiro@jp.fujitsu.com> wrote:

> >> > actually, this breaks the build on !SPARSEIRQ because we will use that
> >> > class in the non-sparseirq case. So we've converted a build warning to
> >> > a build failure ;-)
> >>
> >> Please give me your .config and tell me your arch. my ia64 box (ia64 is
> >> !SPARSEIRQ) can build the akpm patch.
> >
> > The expected build failure is obvious from reading the code:
> >
> >  #ifdef CONFIG_TRACE_IRQFLAGS
> >  void early_init_irq_lock_class(void)
> >  {
> >  #ifndef CONFIG_SPARSE_IRQ
> >         struct irq_desc *desc;
> >         int i;
> >
> >         for_each_irq_desc(i, desc) {
> >                 if (!desc)
> >                         continue;
> >
> >                 lockdep_set_class(&desc->lock, &irq_desc_lock_class);
> >
> > Note that it's an #ifndef sparseirq, not an #ifdef sparseirq condition.
> 
> I see. thanks.
> It seems my first proposal is better.
> 
> or, following #ifdef ?
> 
> #if defined(CONFIG_SPARSE_IRQ) || defined(CONFIG_TRACE_IRQFLAGS)
> 
>  /*
>  * lockdep: we want to handle all irq_desc locks as a single lock-class:
>  */
>  static struct lock_class_key irq_desc_lock_class;

instead of increasing the #ifdef jungle, how about removing some? For 
example is this distinction:

> >  #ifndef CONFIG_SPARSE_IRQ

really needed? We should use symmetric lock class annotations, regardless 
of how irq_desc[] is laid out.

	Ingo
