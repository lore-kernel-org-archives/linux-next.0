From: Samuel Ortiz <sameo@linux.intel.com>
Subject: Re: linux-next: manual merge of the mfd tree with the ux500-core
 tree
Date: Mon, 20 Dec 2010 13:05:11 +0100
Message-ID: <20101220120510.GE11095@sortiz-mobl>
References: <20101220152148.6fedee0d.sfr@canb.auug.org.au>
 <20101220042344.GB10050@linux-sh.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20101220042344.GB10050@linux-sh.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Paul Mundt <lethal@linux-sh.org>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Sundar Iyer <sundar.iyer@stericsson.com>, Mark Brown <broonie@opensource.wolfsonmicro.com>, Linus Walleij <linus.walleij@linaro.org>
List-Id: linux-next.vger.kernel.org

On Mon, Dec 20, 2010 at 01:23:44PM +0900, Paul Mundt wrote:
> On Mon, Dec 20, 2010 at 03:21:48PM +1100, Stephen Rothwell wrote:
> > The genirq core is being converted to pass struct irq_data to irq_chip
> > operations rather than an IRQ number. Update the tc35892 driver to the
> > new APIs.
> > 
> > Signed-off-by: Mark Brown <broonie@opensource.wolfsonmicro.com>
> > Acked-by: Rabin Vincent <rabin.vincent@stericsson.com>
> > Signed-off-by: Samuel Ortiz <sameo@linux.intel.com>
> 
> Sorry to hijack the thread..
> 
> > diff --git a/drivers/mfd/tc3589x.c b/drivers/mfd/tc3589x.c
> > index 32291fe..dde2d858 100644
> > --- a/drivers/mfd/tc3589x.c
> > +++ b/drivers/mfd/tc3589x.c
> > @@ -170,15 +170,15 @@ again:
> >  	return IRQ_HANDLED;
> >  }
> >  
> > -static void tc3589x_irq_dummy(unsigned int irq)
> > +static void tc3589x_irq_dummy(struct irq_data *data)
> >  {
> >  	/* No mask/unmask at this level */
> >  }
> >  
> >  static struct irq_chip tc3589x_irq_chip = {
> > -	.name	= "tc3589x",
> > -	.mask	= tc3589x_irq_dummy,
> > -	.unmask	= tc3589x_irq_dummy,
> > +	.name		= "tc3589x",
> > +	.irq_mask	= tc3589x_irq_dummy,
> > +	.irq_unmask	= tc3589x_irq_dummy,
> >  };
> >  
> >  static int tc3589x_irq_init(struct tc3589x *tc3589x)
> 
> Is there some reason you don't just kill this off and use dummy_irq_chip?
Good point.
I removed this patch from my branch and sent a fix to LinusW so that he
carries it from his ux500-core branch.

Cheers,
Samuel.

-- 
Intel Open Source Technology Centre
http://oss.intel.com/
