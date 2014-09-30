From: =?UTF-8?q?Vincent=20Stehl=C3=A9?= <vincent.stehle@laposte.net>
Subject: [PATCH linux-next] clk-gpio-gate: include gpio/consumer to fix build
Date: Tue, 30 Sep 2014 21:36:43 +0200
Message-ID: <1412105803-9954-1-git-send-email-vincent.stehle@laposte.net>
References: <20140930162635.GA7135@roeck-us.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-next-owner@vger.kernel.org>
Received: from smtp3-g21.free.fr ([212.27.42.3]:13418 "EHLO smtp3-g21.free.fr"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1750760AbaI3Tgy (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Tue, 30 Sep 2014 15:36:54 -0400
In-Reply-To: <20140930162635.GA7135@roeck-us.net>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: linux-next@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, =?UTF-8?q?Vincent=20Stehl=C3=A9?= <vincent.stehle@laposte.net>, Jyri Sarha <jsarha@ti.com>, Mike Turquette <mturquette@linaro.org>

This fixes the following build error:

  drivers/clk/clk-gpio-gate.c: In function =E2=80=98clk_gpio_gate_enabl=
e=E2=80=99:
  drivers/clk/clk-gpio-gate.c:36:2: error: implicit declaration of func=
tion =E2=80=98gpiod_set_value=E2=80=99 [-Werror=3Dimplicit-function-dec=
laration]
  drivers/clk/clk-gpio-gate.c: In function =E2=80=98clk_gpio_gate_is_en=
abled=E2=80=99:
  drivers/clk/clk-gpio-gate.c:52:2: error: implicit declaration of func=
tion =E2=80=98gpiod_get_value=E2=80=99 [-Werror=3Dimplicit-function-dec=
laration]
  drivers/clk/clk-gpio-gate.c: In function =E2=80=98clk_register_gpio_g=
ate=E2=80=99:
  drivers/clk/clk-gpio-gate.c:79:2: error: implicit declaration of func=
tion =E2=80=98gpiod_is_active_low=E2=80=99 [-Werror=3Dimplicit-function=
-declaration]
  drivers/clk/clk-gpio-gate.c:85:3: error: implicit declaration of func=
tion =E2=80=98desc_to_gpio=E2=80=99 [-Werror=3Dimplicit-function-declar=
ation]
  drivers/clk/clk-gpio-gate.c:125:2: error: implicit declaration of fun=
ction =E2=80=98gpiod_put=E2=80=99 [-Werror=3Dimplicit-function-declarat=
ion]
  drivers/clk/clk-gpio-gate.c: In function =E2=80=98of_clk_gpio_gate_de=
layed_register_get=E2=80=99:
  drivers/clk/clk-gpio-gate.c:169:2: error: implicit declaration of fun=
ction =E2=80=98gpio_to_desc=E2=80=99 [-Werror=3Dimplicit-function-decla=
ration]

Signed-off-by: Vincent Stehl=C3=A9 <vincent.stehle@laposte.net>
Cc: Jyri Sarha <jsarha@ti.com>
Cc: Mike Turquette <mturquette@linaro.org>
---

Hi,

This can be seen with e.g. linux next-20140930 and arm alldefconfig.

Best regards,

V.

 drivers/clk/clk-gpio-gate.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/clk/clk-gpio-gate.c b/drivers/clk/clk-gpio-gate.c
index 9dde885..08e4322 100644
--- a/drivers/clk/clk-gpio-gate.c
+++ b/drivers/clk/clk-gpio-gate.c
@@ -13,6 +13,7 @@
 #include <linux/module.h>
 #include <linux/slab.h>
 #include <linux/gpio.h>
+#include <linux/gpio/consumer.h>
 #include <linux/of_gpio.h>
 #include <linux/err.h>
 #include <linux/device.h>
--=20
2.1.0
