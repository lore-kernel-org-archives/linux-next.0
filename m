From: Jason Cooper <jason@lakedaemon.net>
Subject: Re: linux-next: build failure after merge of the irqchip tree
Date: Mon, 13 Apr 2015 10:50:49 +0000
Message-ID: <20150413105049.GG18660@io.lakedaemon.net>
References: <20150413170539.2f20e0a8@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20150413170539.2f20e0a8@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Stefan Agner <stefan@agner.ch>
List-Id: linux-next.vger.kernel.org

Hi Stephen,

On Mon, Apr 13, 2015 at 05:05:39PM +1000, Stephen Rothwell wrote:
> Hi Jason,
> 
> After merging the irqchip tree, today's linux-next build (x86_64
> allmodconfig) failed like this:
> 
> kernel/irq/generic-chip.c: In function 'irq_map_generic_chip':
> kernel/irq/generic-chip.c:408:2: error: implicit declaration of function 'irq_domain_set_info' [-Werror=implicit-function-declaration]
>   irq_domain_set_info(d, virq, hw_irq, chip, gc, ct->handler, NULL, NULL);
>   ^
> 
> Caused by commit 3f6b2c298240 ("genirq: Generic chip: Support hierarchy
> domain").  The only declaration of irq_domain_set_info() depends on
> CONFIG_IRQ_DOMAIN_HIERARCHY.

Sorry about that.  I was rushing a bit in case the merge window was delayed a
week.  It wasn't, so I'll drop this for v4.1.

It's also a gentle reminder that I need to do *more* thorough testing
with genirq changes before pushing. :-/

thx,

Jason.
