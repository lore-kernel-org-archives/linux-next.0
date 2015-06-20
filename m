From: Paul Gortmaker <paul.gortmaker@windriver.com>
Subject: [PATCH] clocksource: increase dependencies of timer-stm32 to limit build wreckage
Date: Sat, 20 Jun 2015 19:02:32 -0400
Message-ID: <1434841352-24300-1-git-send-email-paul.gortmaker@windriver.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-kernel@vger.kernel.org
Cc: linux-next@vger.kernel.org, Paul Gortmaker <paul.gortmaker@windriver.com>, Linus Walleij <linus.walleij@linaro.org>, Chanwoo Choi <cw00.choi@samsung.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, Daniel Lezcano <daniel.lezcano@linaro.org>, Thomas Gleixner <tglx@linutronix.de>
List-Id: linux-next.vger.kernel.org

This driver leaks out into arch/parisc builds that don't have
CONFIG_GENERIC_CLOCKEVENTS, leading to the following (truncated)
wreckage:

  CC      drivers/clocksource/timer-stm32.o
drivers/clocksource/timer-stm32.c:38:28: error: field 'evtdev' has incomplete type
drivers/clocksource/timer-stm32.c:44:19: warning: 'enum clock_event_mode' declared inside parameter list
drivers/clocksource/timer-stm32.c:44:19: warning: its scope is only this definition or declaration, which is probably not what you want
drivers/clocksource/timer-stm32.c:43:62: error: parameter 1 ('mode') has incomplete type
drivers/clocksource/timer-stm32.c:43:13: error: function declaration isn't a prototype
drivers/clocksource/timer-stm32.c: In function 'stm32_clock_event_set_mode':
drivers/clocksource/timer-stm32.c:47:3: error: type defaults to 'int' in declaration of '__mptr'
drivers/clocksource/timer-stm32.c:47:3: warning: initialization from incompatible pointer type
drivers/clocksource/timer-stm32.c:51:7: error: 'CLOCK_EVT_MODE_PERIODIC' undeclared (first use in this function)
drivers/clocksource/timer-stm32.c:51:7: note: each undeclared identifier is reported only once for each function it appears in
drivers/clocksource/timer-stm32.c:56:7: error: 'CLOCK_EVT_MODE_ONESHOT' undeclared (first use in this function)

Tighten up the dependencies to limit where it gets built by copying
the style of the Kconfig line for CLKSRC_EFM32 a few lines above.

Cc: Linus Walleij <linus.walleij@linaro.org>
Cc: Chanwoo Choi <cw00.choi@samsung.com>
Cc: Maxime Coquelin <mcoquelin.stm32@gmail.com>
Cc: Daniel Lezcano <daniel.lezcano@linaro.org>
Cc: Thomas Gleixner <tglx@linutronix.de>
Signed-off-by: Paul Gortmaker <paul.gortmaker@windriver.com>
---

[linux-next fail: http://kisskb.ellerman.id.au/kisskb/buildresult/12444884/ ]

 drivers/clocksource/Kconfig | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/clocksource/Kconfig b/drivers/clocksource/Kconfig
index 60d7d3d204d3..0f1c77e491f8 100644
--- a/drivers/clocksource/Kconfig
+++ b/drivers/clocksource/Kconfig
@@ -112,8 +112,8 @@ config CLKSRC_LPC32XX
 	select CLKSRC_OF
 
 config CLKSRC_STM32
-	bool "Clocksource for STM32 SoCs" if COMPILE_TEST
-	depends on OF
+	bool "Clocksource for STM32 SoCs" if !ARCH_STM32
+	depends on OF && ARM && (ARCH_STM32 || COMPILE_TEST)
 	select CLKSRC_MMIO
 
 config ARM_ARCH_TIMER
-- 
2.2.1
