From: Mark Brown <broonie@opensource.wolfsonmicro.com>
Subject: Re: linux-next: manual merge of the mfd tree with the ux500-core
 tree
Date: Mon, 20 Dec 2010 12:12:16 +0000
Message-ID: <20101220121215.GC26706@rakim.wolfsonmicro.main>
References: <20101220152148.6fedee0d.sfr@canb.auug.org.au>
 <20101220042344.GB10050@linux-sh.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from opensource.wolfsonmicro.com ([80.75.67.52]:48450 "EHLO
	opensource2.wolfsonmicro.com" rhost-flags-OK-OK-OK-FAIL)
	by vger.kernel.org with ESMTP id S1757366Ab0LTMMT (ORCPT
	<rfc822;linux-next@vger.kernel.org>);
	Mon, 20 Dec 2010 07:12:19 -0500
Content-Disposition: inline
In-Reply-To: <20101220042344.GB10050@linux-sh.org>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Paul Mundt <lethal@linux-sh.org>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, Samuel Ortiz <sameo@linux.intel.com>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Sundar Iyer <sundar.iyer@stericsson.com>, Linus Walleij <linus.walleij@linaro.org>

On Mon, Dec 20, 2010 at 01:23:44PM +0900, Paul Mundt wrote:
> On Mon, Dec 20, 2010 at 03:21:48PM +1100, Stephen Rothwell wrote:

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

> >  static int tc3589x_irq_init(struct tc3589x *tc3589x)

> Is there some reason you don't just kill this off and use dummy_irq_chip?

Mainly that I didn't take the time to read through the code and figure
out if it was doing anything interesting with the struct elsewhere
which meant this was actually sensible (one of the other drivers was
doing something surprising).
