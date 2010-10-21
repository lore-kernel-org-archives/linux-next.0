From: Richard Weinberger <richard@nod.at>
Subject: Re: linux-next: User Mode Linux broken
Date: Thu, 21 Oct 2010 22:27:12 +0200
Message-ID: <201010212227.12919.richard@nod.at>
References: <201010211315.26679.richard@nod.at> <201010212122.38437.richard@nod.at> <alpine.LFD.2.00.1010212143300.3467@localhost6.localdomain6>
Mime-Version: 1.0
Content-Type: Text/Plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from a.ns.miles-group.at ([95.130.255.143]:42612 "EHLO radon.swed.at"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752798Ab0JUU1U (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Thu, 21 Oct 2010 16:27:20 -0400
In-Reply-To: <alpine.LFD.2.00.1010212143300.3467@localhost6.localdomain6>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Thomas Gleixner <tglx@linutronix.de>
Cc: peterz@infradead.org, hpa@zytor.com, mingo@elte.hu, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, linux-next@vger.kernel.org

Am Donnerstag 21 Oktober 2010, 21:45:35 schrieb Thomas Gleixner:
> On Thu, 21 Oct 2010, Richard Weinberger wrote:
> > Am Donnerstag 21 Oktober 2010, 18:09:22 schrieb Thomas Gleixner:
> > > On Thu, 21 Oct 2010, Richard Weinberger wrote:
> > > > Thomas,
> > > > 
> > > > Your commit c5f7563 ("genirq: Provide compat handling for
> > > > chip->enable()") breaks UML.
> > > > It does not start anymore.
> > > > 
> > > > When I apply this patch it works fine again.
> > > > http://userweb.kernel.org/~akpm/mmotm/broken-out/um-migrate-from-__do
> > > > _irq -to- generic_handle_irq.patch
> > > > 
> > > > Maybe your patch breaks all users of __do_IRQ()?
> > > 
> > > Not intentionally :)
> > > 
> > > The irq_chip of um has it's own dummy enable function, so the compat
> > > code uses it.
> > > 
> > > +static void compat_irq_enable(struct irq_data *data)
> > > +{
> > > +	data->chip->enable(data->irq);
> > > +}
> > > +
> > > 
> > > ...
> > > 
> > > +	if (chip->enable)
> > > +		chip->irq_enable = compat_irq_enable;
> > > +
> > > +	/*
> > > +	 * The real defaults
> > > +	 */
> > > +	if (!chip->irq_enable)
> > > +		chip->irq_enable = default_enable;
> > > 
> > > So I really can't see how's that supposed to break UM
> > 
> > This patch solves the issue for me.
> > What do you think?
> > 
> > Thanks,
> > //richard
> > 
> > diff --git a/kernel/irq/resend.c b/kernel/irq/resend.c
> > index 891115a..1fb4012 100644
> > --- a/kernel/irq/resend.c
> > +++ b/kernel/irq/resend.c
> > @@ -60,8 +60,11 @@ void check_irq_resend(struct irq_desc *desc, unsigned
> > int irq)
> > 
> >         /*
> >         
> >          * Make sure the interrupt is enabled, before resending it:
> >          */
> > 
> > +#ifndef CONFIG_GENERIC_HARDIRQS_NO_DEPRECATED
> > +       desc->irq_data.chip->enable(irq);
> > +#elif
> > 
> >         desc->irq_data.chip->irq_enable(&desc->irq_data);
> > 
> > -
> > +#endif
> > 
> >         /*
> >         
> >          * We do not resend level type interrupts. Level type
> >          * interrupts are resent by hardware when they are still
> 
> Why shold it solve it ? irq_enable is set to compat_irq_enable which
> in turn calls chip->enable.
> 
> So how's that different ?

I took a closer look on the issue.

check_irq_resend() gets called before irq_chip_set_defaults().
In the first call to check_irq_resend() desc->irq_data.chip->irq_enable is 
NULL. UML dies due to a NULL-pointer dereference...

I don't know why check_irq_resend() is called before irq_chip_set_defaults().
It's your code. ;-)

Thanks,
//richard
