From: Rabin VINCENT <rabin.vincent@stericsson.com>
Subject: Re: linux-next: build failure after merge of the mfd tree
Date: Wed, 19 May 2010 09:53:35 +0530
Message-ID: <20100519042333.GA8818@bnru02.bnr.st.com>
References: <20100519140310.e439960d.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20100519140310.e439960d.sfr@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Samuel Ortiz <sameo@linux.intel.com>, "linux-next@vger.kernel.org" <linux-next@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: linux-next.vger.kernel.org

On Wed, May 19, 2010 at 06:03:10 +0200, Stephen Rothwell wrote:
> After merging the mfd tree, today's linux-next build (x86_64 allmodconfig)
> failed like this:
> 
> drivers/mfd/ab8500-core.c: In function 'ab8500_irq_remove':
> drivers/mfd/ab8500-core.c:302: error: implicit declaration of function 'set_irq_flags'
> 
> Caused by commit 16548223daf6b3b95b75cb961d772831a754e126 ("mfd: new
> AB8500 driver").

Oops, one of the calls to set_irq_flags() is missing a CONFIG_ARM.  The
patch below should fix it.  Thanks.

>From 39368228513c8b429daa274362e7bfe80598b366 Mon Sep 17 00:00:00 2001
From: Rabin Vincent <rabin.vincent@stericsson.com>
Date: Wed, 19 May 2010 09:41:56 +0530
Subject: [PATCH] mfd: ab8500: fix build on !ARM

Add a missing CONFIG_ARM around one of the calls to set_irq_flags(), to
prevent these errors on other archs:

drivers/mfd/ab8500-core.c: In function 'ab8500_irq_remove':
drivers/mfd/ab8500-core.c:302: error: implicit declaration of function 'set_irq_flags'

Acked-by: Linus Walleij <linus.walleij@stericsson.com>
Signed-off-by: Rabin Vincent <rabin.vincent@stericsson.com>
---
 drivers/mfd/ab8500-core.c |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/drivers/mfd/ab8500-core.c b/drivers/mfd/ab8500-core.c
index e93833f..f3d26fa 100644
--- a/drivers/mfd/ab8500-core.c
+++ b/drivers/mfd/ab8500-core.c
@@ -299,7 +299,9 @@ static void ab8500_irq_remove(struct ab8500 *ab8500)
 	int irq;
 
 	for (irq = base; irq < base + AB8500_NR_IRQS; irq++) {
+#ifdef CONFIG_ARM
 		set_irq_flags(irq, 0);
+#endif
 		set_irq_chip_and_handler(irq, NULL, NULL);
 		set_irq_chip_data(irq, NULL);
 	}
-- 
1.7.0
