From: Christoph Lameter <cl@linux.com>
Subject: Re: linux-next: Tree for Sep 1
Date: Tue, 2 Sep 2014 09:07:23 -0500 (CDT)
Message-ID: <alpine.DEB.2.11.1409020857110.9201@gentwo.org>
References: <20140901230728.GM29327@sirena.org.uk> <1627064.QhxvejlWdk@amdc1032>
Content-Type: TEXT/PLAIN; charset=US-ASCII
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1627064.QhxvejlWdk@amdc1032>
Sender: linux-kernel-owner@vger.kernel.org
To: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
Cc: Mark Brown <broonie@kernel.org>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, nicolas.pitre@linaro.org, Russell King <rmk+kernel@arm.linux.org.uk>, Tejun Heo <tj@kernel.org>, Kyungmin Park <kyungmin.park@samsung.com>
List-Id: linux-next.vger.kernel.org

On Tue, 2 Sep 2014, Bartlomiej Zolnierkiewicz wrote:

> Commit 532d0d0690d1 ("irqchips: Replace __this_cpu_ptr uses")
> incorrectly converted *__this_cpu_ptr() to raw_cpu_read() instead
> of *raw_cpu_ptr().  Fix it.

Oww.. This is double indirection deal there. A percpu offset pointing to
a pointer?

Generally the following is true (definition from
include/asm-generic/percpu.h that is used for ARM for raw_cpu_read):

#define raw_cpu_read_4(pcp)             (*raw_cpu_ptr(&(pcp)))



> Index: b/drivers/irqchip/irq-gic.c
> ===================================================================
> --- a/drivers/irqchip/irq-gic.c	2014-09-02 14:03:41.026758653 +0200
> +++ b/drivers/irqchip/irq-gic.c	2014-09-02 14:37:04.466811546 +0200
> @@ -102,7 +102,7 @@ static struct gic_chip_data gic_data[MAX
>  #ifdef CONFIG_GIC_NON_BANKED
>  static void __iomem *gic_get_percpu_base(union gic_base *base)
>  {
> -	return raw_cpu_read(base->percpu_base);
> +	return *raw_cpu_ptr(base->percpu_base);
>  }
>
>  static void __iomem *gic_get_common_base(union gic_base *base)
>
>
