From: Tejun Heo <tj@kernel.org>
Subject: Re: linux-next: Tree for Sep 1
Date: Sat, 6 Sep 2014 08:48:33 +0900
Message-ID: <20140905234833.GJ15723@mtj.dyndns.org>
References: <20140901230728.GM29327@sirena.org.uk>
 <1627064.QhxvejlWdk@amdc1032>
 <alpine.DEB.2.11.1409020857110.9201@gentwo.org>
 <alpine.DEB.2.11.1409020958530.9608@gentwo.org>
 <20140904171123.GD26364@mtj.dyndns.org>
 <20140905113114.GS30467@titan.lakedaemon.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20140905113114.GS30467@titan.lakedaemon.net>
Sender: linux-kernel-owner@vger.kernel.org
To: Jason Cooper <jason@lakedaemon.net>
Cc: Thomas Gleixner <tglx@linutronix.de>, Christoph Lameter <cl@linux.com>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Mark Brown <broonie@kernel.org>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, nicolas.pitre@linaro.org, Russell King <rmk+kernel@arm.linux.org.uk>, Kyungmin Park <kyungmin.park@samsung.com>
List-Id: linux-next.vger.kernel.org

On Fri, Sep 05, 2014 at 07:31:14AM -0400, Jason Cooper wrote:
> Tejun, Christoph,
> 
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
> Could Thomas and I get a pointer to the original patch and thread that
> caused the error?

http://thread.gmane.org/gmane.linux.kernel/1769201/focus=1769204
http://thread.gmane.org/gmane.linux.kernel.next/32601/focus=32606

Thanks.

-- 
tejun
