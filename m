From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build failure after merge of the sh tree
Date: Sun, 24 Jul 2016 17:55:01 +1000
Message-ID: <20160724175501.7a46e24f@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:55088 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751543AbcGXHzG (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Sun, 24 Jul 2016 03:55:06 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Rich Felker <dalias@libc.org>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org

Hi Rich,

After merging the sh tree, today's linux-next build (powerpc allyesconfig)
failed like this:

drivers/clocksource/jcore-pit.c:145:20: error: conflicting types for 'timer_interrupt'
 static irqreturn_t timer_interrupt(int irq, void *dev_id)
                    ^
In file included from arch/powerpc/include/asm/irqflags.h:11:0,
                 from include/linux/irqflags.h:15,
                 from include/linux/spinlock.h:53,
                 from include/linux/mmzone.h:7,
                 from include/linux/gfp.h:5,
                 from include/linux/slab.h:14,
                 from drivers/clocksource/jcore-pit.c:12:
arch/powerpc/include/asm/hw_irq.h:36:13: note: previous declaration of 'timer_interrupt' was here
 extern void timer_interrupt(struct pt_regs *);
             ^

Caused by commit

  e0aa0655c60b ("clocksource: add J-Core timer/clocksource driver")

I added this fix patch:

From: Stephen Rothwell <sfr@canb.auug.org.au>
Date: Sun, 24 Jul 2016 17:42:19 +1000
Subject: [PATCH] clocksource: make J-Core timer_interrupt more unique

Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
---
 drivers/clocksource/jcore-pit.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/clocksource/jcore-pit.c b/drivers/clocksource/jcore-pit.c
index b9d693bcb41e..373b9f954a5c 100644
--- a/drivers/clocksource/jcore-pit.c
+++ b/drivers/clocksource/jcore-pit.c
@@ -142,7 +142,7 @@ static int jcore_pit_cpu_notify(struct notifier_block *self,
 	return NOTIFY_OK;
 }
 
-static irqreturn_t timer_interrupt(int irq, void *dev_id)
+static irqreturn_t jcore_timer_interrupt(int irq, void *dev_id)
 {
 	struct jcore_pit *pit = this_cpu_ptr(dev_id);
 
@@ -224,7 +224,7 @@ static void __init jcore_pit_init(struct device_node *node)
 		goto out;
 	}
 
-	err = request_irq(pit_irq, timer_interrupt,
+	err = request_irq(pit_irq, jcore_timer_interrupt,
 		IRQF_TIMER | IRQF_PERCPU, "jcore_pit", pit_percpu);
 	if (err) {
 		pr_err("pit irq request failed: %d\n", err);
-- 
2.8.1

-- 
Cheers,
Stephen Rothwell
