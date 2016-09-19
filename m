From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: next-20160914 build: 2 failures 3 warnings (next-20160914)
Date: Mon, 19 Sep 2016 12:31:04 +0200
Message-ID: <2300987.vYzazfRX5F@wuerfel>
References: <E1bk5OS-0000Vu-1C@optimist> <20160914171137.GF27974@sirena.org.uk> <20160919102150.GI10189@sirena.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mout.kundenserver.de ([212.227.126.130]:50413 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1755215AbcISKbk (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 19 Sep 2016 06:31:40 -0400
In-Reply-To: <20160919102150.GI10189@sirena.org.uk>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Mark Brown <broonie@kernel.org>
Cc: Marcin Niestroj <m.niestroj@grinn-global.com>, Grygorii Strashko <grygorii.strashko@ti.com>, Tony Lindgren <tony@atomide.com>, Lee Jones <lee.jones@linaro.org>, kernel-build-reports@lists.linaro.org, linaro-kernel@lists.linaro.org, linux-next@vger.kernel.org, linux-arm-kernel@lists.infradead.org

On Monday, September 19, 2016 11:21:50 AM CEST Mark Brown wrote:
> On Wed, Sep 14, 2016 at 06:11:37PM +0100, Mark Brown wrote:
> > On Wed, Sep 14, 2016 at 09:18:08AM +0100, Build bot for Mark Brown wrote:
> 
> > Today's -next fails to build both arm and arm64 allmodconfig due to:
> 
> > >     arm64-allmodconfig
> > > ERROR: "irq_set_parent" [drivers/mfd/tps65217.ko] undefined!
> 
> > >     arm-allmodconfig
> > > ERROR: "irq_set_parent" [drivers/mfd/tps65217.ko] undefined!
> 
> > due to 262d5cc6ceb293 (mfd: tps65217: Add support for IRQs) since
> > irq_set_parent() isn't exported.
> 
> This is still breaking the build, do we have any ETA on getting the
> export added?

Thomas said he'd add it if the export is needed, but so far nobody
could tell if it is, or if the correct fix is something else, so
I have not sent a patch for inclusion.

My guess is that this is indeed the correct fix, but I don't understand
at all what the function does, and Marcin Niestroj said the same thing,
he just copied the code from a driver that is always built-in.

FWIW, the original function is

static int regmap_irq_map(struct irq_domain *h, unsigned int virq,
                          irq_hw_number_t hw)
{
        struct regmap_irq_chip_data *data = h->host_data;

        irq_set_chip_data(virq, data);
        irq_set_chip(virq, &data->irq_chip);
        irq_set_nested_thread(virq, 1);
        irq_set_parent(virq, data->irq);
        irq_set_noprobe(virq);

        return 0;
}

and this is the new one:

static int tps65217_irq_map(struct irq_domain *h, unsigned int virq,
                        irq_hw_number_t hw)
{
        struct tps65217 *tps = h->host_data;

        irq_set_chip_data(virq, tps);
        irq_set_chip_and_handler(virq, &tps65217_irq_chip, handle_edge_irq);
        irq_set_nested_thread(virq, 1);
        irq_set_parent(virq, tps->irq);
        irq_set_noprobe(virq);

        return 0;
}

twl6030_irq_map() has another almost identical copy, and the only
other caller of irq_set_parent() is gpiochip_set_chained_irqchip(),
which is completely different.

	Arnd
