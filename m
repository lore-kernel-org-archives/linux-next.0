From: =?UTF-8?q?Vincent=20Stehl=C3=A9?= <vincent.stehle@laposte.net>
Subject: [PATCH linux-next] pinctrl: fix pinconf_dbg_config_write return type
Date: Mon, 16 Sep 2013 22:50:32 +0200
Message-ID: <1379364632-19197-1-git-send-email-vincent.stehle@laposte.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-next-owner@vger.kernel.org>
Received: from smtpfb1-g21.free.fr ([212.27.42.9]:37183 "EHLO
	smtpfb1-g21.free.fr" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750988Ab3IPUvo (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Mon, 16 Sep 2013 16:51:44 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: linux-kernel@vger.kernel.org, linux-next@vger.kernel.org
Cc: =?UTF-8?q?Vincent=20Stehl=C3=A9?= <vincent.stehle@laposte.net>, Linus Walleij <linus.walleij@linaro.org>

Have pinconf_dbg_config_write() return a ssize_t. This fixes the follow=
ing
compilation warning:

  drivers/pinctrl/pinconf.c:617:2: warning: initialization from incompa=
tible pointer type [enabled by default]
  drivers/pinctrl/pinconf.c:617:2: warning: (near initialization for =E2=
=80=98pinconf_dbg_pinconfig_fops.write=E2=80=99) [enabled by default]

Signed-off-by: Vincent Stehl=C3=A9 <vincent.stehle@laposte.net>
Cc: Linus Walleij <linus.walleij@linaro.org>
---

Hi,

This can be seen with e.g. next-20130916 with x86 allmodconfig.

Best regards,

V.

 drivers/pinctrl/pinconf.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/pinctrl/pinconf.c b/drivers/pinctrl/pinconf.c
index a138965..1664e78 100644
--- a/drivers/pinctrl/pinconf.c
+++ b/drivers/pinctrl/pinconf.c
@@ -490,7 +490,7 @@ exit:
  * <devicename> <state> <pinname> are values that should match the pin=
ctrl-maps
  * <newvalue> reflects the new config and is driver dependant
  */
-static int pinconf_dbg_config_write(struct file *file,
+static ssize_t pinconf_dbg_config_write(struct file *file,
 	const char __user *user_buf, size_t count, loff_t *ppos)
 {
 	struct pinctrl_maps *maps_node;
--=20
1.8.4.rc3
