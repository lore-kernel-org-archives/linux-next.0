From: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
Subject: Re: linux-next: Tree for Sep 1
Date: Wed, 03 Sep 2014 18:09:56 +0200
Message-ID: <37101991.sqIYnPZ4ga@amdc1032>
References: <20140901230728.GM29327@sirena.org.uk>
 <alpine.DEB.2.11.1409020857110.9201@gentwo.org>
 <alpine.DEB.2.11.1409020958530.9608@gentwo.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7Bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mailout4.samsung.com ([203.254.224.34]:52908 "EHLO
	mailout4.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753297AbaICQKD (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Wed, 3 Sep 2014 12:10:03 -0400
In-reply-to: <alpine.DEB.2.11.1409020958530.9608@gentwo.org>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Christoph Lameter <cl@linux.com>
Cc: Mark Brown <broonie@kernel.org>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, nicolas.pitre@linaro.org, Russell King <rmk+kernel@arm.linux.org.uk>, Tejun Heo <tj@kernel.org>, Kyungmin Park <kyungmin.park@samsung.com>


Hi,

On Tuesday, September 02, 2014 10:00:07 AM Christoph Lameter wrote:
> On Tue, 2 Sep 2014, Christoph Lameter wrote:
> 
> > Oww.. This is double indirection deal there. A percpu offset pointing to
> > a pointer?
> >
> > Generally the following is true (definition from
> > include/asm-generic/percpu.h that is used for ARM for raw_cpu_read):
> >
> > #define raw_cpu_read_4(pcp)             (*raw_cpu_ptr(&(pcp)))
> 
> I think what the issue is that we dropped the fetch of the percpu offset
> in the patch. Instead we are using the address of the variable that
> contains the offset. Does this patch fix it?

Yes, it fixes the problem.  Thank you.

Tested-by: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>

Best regards,
--
Bartlomiej Zolnierkiewicz
Samsung R&D Institute Poland
Samsung Electronics

> Subject: irqchip: Properly fetch the per cpu offset
> 
> The raw_cpu_read() conversion dropped the fetch of the offset
> from base->percpu_base in gic_get_percpu_base.
> 
> Signed-off-by: Christoph Lameter <cl@linux.com>
> 
> Index: linux/drivers/irqchip/irq-gic.c
> ===================================================================
> --- linux.orig/drivers/irqchip/irq-gic.c
> +++ linux/drivers/irqchip/irq-gic.c
> @@ -102,7 +102,7 @@ static struct gic_chip_data gic_data[MAX
>  #ifdef CONFIG_GIC_NON_BANKED
>  static void __iomem *gic_get_percpu_base(union gic_base *base)
>  {
> -	return raw_cpu_read(base->percpu_base);
> +	return raw_cpu_read(*base->percpu_base);
>  }
> 
>  static void __iomem *gic_get_common_base(union gic_base *base)
