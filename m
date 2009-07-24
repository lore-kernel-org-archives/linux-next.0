From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: ttydev tree build failure
Date: Fri, 24 Jul 2009 15:54:17 +1000
Message-ID: <20090724155417.62fa065d.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:51879 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751002AbZGXFyS (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Fri, 24 Jul 2009 01:54:18 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Alan Cox <alan@lxorguk.ukuu.org.uk>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org

Hi Alan,

Today's linux-next build (powerpc allyesconfig) failed like this:

drivers/serial/pmac_zilog.c: In function 'pmz_suspend':
drivers/serial/pmac_zilog.c:1648: error: 'struct uart_state' has no member named 'mutex'
drivers/serial/pmac_zilog.c:1679: error: 'struct uart_state' has no member named 'mutex'
drivers/serial/pmac_zilog.c: In function 'pmz_resume':
drivers/serial/pmac_zilog.c:1708: error: 'struct uart_state' has no member named 'mutex'
drivers/serial/pmac_zilog.c:1740: error: 'struct uart_state' has no member named 'mutex'

Caused by commit d7b52714eee196caeb4195ae1a7aa8bf82bffda5
("serial-move-mutex") from the ttydev tree.

I applied the following patch for today.
-- 
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au

From: Stephen Rothwell <sfr@canb.auug.org.au>
Date: Fri, 24 Jul 2009 15:48:36 +1000
Subject: [PATCH] serial: fix pmac_zilog fallout from uart_state mutex move

Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
---
 drivers/serial/pmac_zilog.c |    8 ++++----
 1 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/serial/pmac_zilog.c b/drivers/serial/pmac_zilog.c
index 6495d01..0700cd1 100644
--- a/drivers/serial/pmac_zilog.c
+++ b/drivers/serial/pmac_zilog.c
@@ -1645,7 +1645,7 @@ static int pmz_suspend(struct macio_dev *mdev, pm_message_t pm_state)
 	state = pmz_uart_reg.state + uap->port.line;
 
 	mutex_lock(&pmz_irq_mutex);
-	mutex_lock(&state->mutex);
+	mutex_lock(&state->port.mutex);
 
 	spin_lock_irqsave(&uap->port.lock, flags);
 
@@ -1676,7 +1676,7 @@ static int pmz_suspend(struct macio_dev *mdev, pm_message_t pm_state)
 	/* Shut the chip down */
 	pmz_set_scc_power(uap, 0);
 
-	mutex_unlock(&state->mutex);
+	mutex_unlock(&state->port.mutex);
 	mutex_unlock(&pmz_irq_mutex);
 
 	pmz_debug("suspend, switching complete\n");
@@ -1705,7 +1705,7 @@ static int pmz_resume(struct macio_dev *mdev)
 	state = pmz_uart_reg.state + uap->port.line;
 
 	mutex_lock(&pmz_irq_mutex);
-	mutex_lock(&state->mutex);
+	mutex_lock(&state->port.mutex);
 
 	spin_lock_irqsave(&uap->port.lock, flags);
 	if (!ZS_IS_OPEN(uap) && !ZS_IS_CONS(uap)) {
@@ -1737,7 +1737,7 @@ static int pmz_resume(struct macio_dev *mdev)
 	}
 
  bail:
-	mutex_unlock(&state->mutex);
+	mutex_unlock(&state->port.mutex);
 	mutex_unlock(&pmz_irq_mutex);
 
 	/* Right now, we deal with delay by blocking here, I'll be
-- 
1.6.3.3
