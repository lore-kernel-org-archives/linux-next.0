From: Christoph Lameter <cl@linux.com>
Subject: Re: linux-next: Tree for Sep 1
Date: Wed, 10 Sep 2014 09:15:30 -0500 (CDT)
Message-ID: <alpine.DEB.2.11.1409100914180.23942@gentwo.org>
References: <20140901230728.GM29327@sirena.org.uk> <1627064.QhxvejlWdk@amdc1032> <alpine.DEB.2.11.1409020857110.9201@gentwo.org> <alpine.DEB.2.11.1409020958530.9608@gentwo.org> <20140904171123.GD26364@mtj.dyndns.org> <20140909003729.GA11706@mtj.dyndns.org>
Content-Type: TEXT/PLAIN; charset=US-ASCII
Return-path: <linux-next-owner@vger.kernel.org>
Received: from qmta01.emeryville.ca.mail.comcast.net ([76.96.30.16]:37106 "EHLO
	qmta01.emeryville.ca.mail.comcast.net" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1751734AbaIJOPf (ORCPT
	<rfc822;linux-next@vger.kernel.org>);
	Wed, 10 Sep 2014 10:15:35 -0400
In-Reply-To: <20140909003729.GA11706@mtj.dyndns.org>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Thomas Gleixner <tglx@linutronix.de>, Jason Cooper <jason@lakedaemon.net>
Cc: Tejun Heo <tj@kernel.org>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Mark Brown <broonie@kernel.org>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, nicolas.pitre@linaro.org, Russell King <rmk+kernel@arm.linux.org.uk>, Kyungmin Park <kyungmin.park@samsung.com>

On Tue, 9 Sep 2014, Tejun Heo wrote:

> On Fri, Sep 05, 2014 at 02:11:23AM +0900, Tejun Heo wrote:
> > On Tue, Sep 02, 2014 at 10:00:07AM -0500, Christoph Lameter wrote:
> > > Subject: irqchip: Properly fetch the per cpu offset
> > >
> > > The raw_cpu_read() conversion dropped the fetch of the offset
> > > from base->percpu_base in gic_get_percpu_base.
> > >
> > > Signed-off-by: Christoph Lameter <cl@linux.com>
> > >
> > > Index: linux/drivers/irqchip/irq-gic.c
> > > ===================================================================
> > > --- linux.orig/drivers/irqchip/irq-gic.c
> > > +++ linux/drivers/irqchip/irq-gic.c
> > > @@ -102,7 +102,7 @@ static struct gic_chip_data gic_data[MAX
> > >  #ifdef CONFIG_GIC_NON_BANKED
> > >  static void __iomem *gic_get_percpu_base(union gic_base *base)
> > >  {
> > > -	return raw_cpu_read(base->percpu_base);
> > > +	return raw_cpu_read(*base->percpu_base);
> >
> > I suppose this should go through percpu/for-3.18-consistent-ops?  Can
> > we please cc irq folks and get acks?
>
> Christoph, please drive this forward.

CCing IRQ subsystem and IRQCHIP drivers maintainers.
