From: =?UTF-8?q?Vincent=20Stehl=C3=A9?= <vincent.stehle@freescale.com>
Subject: [PATCH linux-next] ARM: imx: fix imx_init_l2cache storage class
Date: Wed, 10 Jul 2013 11:45:46 +0200
Message-ID: <1373449546-1040-1-git-send-email-vincent.stehle@freescale.com>
Reply-To: <vstehle@debian>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-next-owner@vger.kernel.org>
Received: from tx2outboundsmtppool2.messaging.microsoft.com ([65.55.83.132]:16479
	"EHLO TX2EHSNDR002.bigfish.com" rhost-flags-OK-OK-OK-FAIL)
	by vger.kernel.org with ESMTP id S1752059Ab3GJJqS convert rfc822-to-8bit
	(ORCPT <rfc822;linux-next@vger.kernel.org>);
	Wed, 10 Jul 2013 05:46:18 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-next@vger.kernel.org
Cc: =?UTF-8?q?Vincent=20Stehl=C3=A9?= <vincent.stehle@freescale.com>, Shawn Guo <shawn.guo@linaro.org>, Sascha Hauer <kernel@pengutronix.de>, Russell King <linux@arm.linux.org.uk>, trivial@kernel.org

Commit 879ec1ceeac21285d62606c1e96520887efcd9bc makes imx_init_l2cache =
a common
function and updates the header declaration accordingly. Fix function s=
torage
class, too.

This fixes the following compilation error:

  arch/arm/mach-imx/system.c:101:123: error: static declaration of =E2=80=
=98imx_init_l2cache=E2=80=99 follows non-static declaration
  In file included from arch/arm/mach-imx/system.c:32:0:
  arch/arm/mach-imx/common.h:165:13: note: previous declaration of =E2=80=
=98imx_init_l2cache=E2=80=99 was here
  arch/arm/mach-imx/system.c:101:123: warning: =E2=80=98imx_init_l2cach=
e=E2=80=99 defined but not used [-Wunused-function]

Signed-off-by: Vincent Stehl=C3=A9 <vincent.stehle@freescale.com>
Cc: Shawn Guo <shawn.guo@linaro.org>
Cc: Sascha Hauer <kernel@pengutronix.de>
Cc: Russell King <linux@arm.linux.org.uk>
Cc: trivial@kernel.org
---


Hi,

Linux next-20130710 breaks compilation of ARM multi_v7_defconfig. This =
patch fixes it.

(Note: this patch is necessary for the link, too: http://www.spinics.ne=
t/lists/kernel/msg1563777.html)

Best regards,

V.


 arch/arm/mach-imx/system.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/mach-imx/system.c b/arch/arm/mach-imx/system.c
index e5592ca..64ff37e 100644
--- a/arch/arm/mach-imx/system.c
+++ b/arch/arm/mach-imx/system.c
@@ -98,7 +98,7 @@ void __init mxc_arch_reset_init_dt(void)
 }
=20
 #ifdef CONFIG_CACHE_L2X0
-static void __init imx_init_l2cache(void)
+void __init imx_init_l2cache(void)
 {
 	void __iomem *l2x0_base;
 	struct device_node *np;
--=20
1.7.10.4
