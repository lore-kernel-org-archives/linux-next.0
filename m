From: =?UTF-8?q?Vincent=20Stehl=C3=A9?= <vincent.stehle@freescale.com>
Subject: [PATCH] clocksource: fix Freescale Vybrid pit timer compilation
Date: Thu, 20 Jun 2013 11:09:41 +0200
Message-ID: <1371719381-19937-1-git-send-email-vincent.stehle@freescale.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-next-owner@vger.kernel.org>
Received: from [207.46.163.24] ([207.46.163.24]:54721 "EHLO
	co9outboundpool.messaging.microsoft.com" rhost-flags-FAIL-FAIL-OK-OK)
	by vger.kernel.org with ESMTP id S1754182Ab3FTJL0 convert rfc822-to-8bit
	(ORCPT <rfc822;linux-next@vger.kernel.org>);
	Thu, 20 Jun 2013 05:11:26 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: linux-next@vger.kernel.org
Cc: =?UTF-8?q?Vincent=20Stehl=C3=A9?= <vincent.stehle@freescale.com>, Jingchang Lu <b35083@freescale.com>, John Stultz <john.stultz@linaro.org>, Thomas Gleixner <tglx@linutronix.de>, trivial@kernel.org

Update sched_clock.h path to fix the following compilation error:

  drivers/clocksource/vf_pit_timer.c:15:29: fatal error: asm/sched_cloc=
k.h: No such file or directory
  compilation terminated.

Signed-off-by: Vincent Stehl=C3=A9 <vincent.stehle@freescale.com>
Cc: Jingchang Lu <b35083@freescale.com>
Cc: John Stultz <john.stultz@linaro.org>
Cc: Thomas Gleixner <tglx@linutronix.de>
Cc: trivial@kernel.org
---


Hi,

Compilation of imx_v6_v7_defconfig in linux-next just broke. Here is a =
fix.

Best regards,

V.


 drivers/clocksource/vf_pit_timer.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clocksource/vf_pit_timer.c b/drivers/clocksource/v=
f_pit_timer.c
index 598399d..587e020 100644
--- a/drivers/clocksource/vf_pit_timer.c
+++ b/drivers/clocksource/vf_pit_timer.c
@@ -12,7 +12,7 @@
 #include <linux/clk.h>
 #include <linux/of_address.h>
 #include <linux/of_irq.h>
-#include <asm/sched_clock.h>
+#include <linux/sched_clock.h>
=20
 /*
  * Each pit takes 0x10 Bytes register space
--=20
1.7.10.4
