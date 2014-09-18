From: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
Subject: Re: linux-next: Tree for Sep 1
Date: Thu, 18 Sep 2014 14:51:58 +0200
Message-ID: <2658039.e4sTF9AQmc@amdc1032>
References: <20140901230728.GM29327@sirena.org.uk>
 <alpine.DEB.2.11.1409020958530.9608@gentwo.org>
 <20140914054055.GI21986@titan.lakedaemon.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7Bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mailout2.samsung.com ([203.254.224.25]:58757 "EHLO
	mailout2.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751339AbaIRMwE (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Thu, 18 Sep 2014 08:52:04 -0400
In-reply-to: <20140914054055.GI21986@titan.lakedaemon.net>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Tejun Heo <tj@kernel.org>
Cc: Jason Cooper <jason@lakedaemon.net>, Christoph Lameter <cl@linux.com>, Mark Brown <broonie@kernel.org>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, nicolas.pitre@linaro.org, Russell King <rmk+kernel@arm.linux.org.uk>, Kyungmin Park <kyungmin.park@samsung.com>


Tejun,

Could you please merge Christoph's patch to your percpu tree
(the patch is attached below for your convenience, it is a fixup
for "irqchips: Replace __this_cpu_ptr uses" patch present in
for-3.18-consistent-ops and for-next branches)?

Best regards,
--
Bartlomiej Zolnierkiewicz
Samsung R&D Institute Poland
Samsung Electronics

On Sunday, September 14, 2014 01:40:55 AM Jason Cooper wrote:
> Christoph,
> 
> On Tue, Sep 02, 2014 at 10:00:07AM -0500, Christoph Lameter wrote:
> > On Tue, 2 Sep 2014, Christoph Lameter wrote:
> > 
> > > Oww.. This is double indirection deal there. A percpu offset pointing to
> > > a pointer?
> > >
> > > Generally the following is true (definition from
> > > include/asm-generic/percpu.h that is used for ARM for raw_cpu_read):
> > >
> > > #define raw_cpu_read_4(pcp)             (*raw_cpu_ptr(&(pcp)))
> > 
> > I think what the issue is that we dropped the fetch of the percpu offset
> > in the patch. Instead we are using the address of the variable that
> > contains the offset. Does this patch fix it?
> > 
> > 
> > Subject: irqchip: Properly fetch the per cpu offset
> > 
> > The raw_cpu_read() conversion dropped the fetch of the offset
> > from base->percpu_base in gic_get_percpu_base.
> > 
> > Signed-off-by: Christoph Lameter <cl@linux.com>
> 
> Acked-by: Jason Cooper <jason@lakedaemon.net>
> 
> thx,
> 
> Jason.

From: Christoph Lameter <cl@linux.com>
Subject: [PATCH] irqchip: Properly fetch the per cpu offset

The raw_cpu_read() conversion dropped the fetch of the offset
from base->percpu_base in gic_get_percpu_base.

b.zolnierkie:
This fixes kernel panic on ARM Exynos4 SoCs (i.e. ODROID U3
board).

Signed-off-by: Christoph Lameter <cl@linux.com>
Acked-by: Jason Cooper <jason@lakedaemon.net>
Reported-and-tested-by: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
---

Index: linux/drivers/irqchip/irq-gic.c
===================================================================
--- linux.orig/drivers/irqchip/irq-gic.c
+++ linux/drivers/irqchip/irq-gic.c
@@ -102,7 +102,7 @@ static struct gic_chip_data gic_data[MAX
 #ifdef CONFIG_GIC_NON_BANKED
 static void __iomem *gic_get_percpu_base(union gic_base *base)
 {
-	return raw_cpu_read(base->percpu_base);
+	return raw_cpu_read(*base->percpu_base);
 }

 static void __iomem *gic_get_common_base(union gic_base *base)
