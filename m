From: =?UTF-8?q?Vincent=20Stehl=C3=A9?= <vincent.stehle@freescale.com>
Subject: [PATCH linux-next] ARM: keystone: fix compilation warning
Date: Thu, 27 Jun 2013 14:49:27 +0200
Message-ID: <1372337367-6708-1-git-send-email-vincent.stehle@freescale.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-next-owner@vger.kernel.org>
Received: from co1ehsobe001.messaging.microsoft.com ([216.32.180.184]:10244
	"EHLO co1outboundpool.messaging.microsoft.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1752204Ab3F0Mto convert rfc822-to-8bit
	(ORCPT <rfc822;linux-next@vger.kernel.org>);
	Thu, 27 Jun 2013 08:49:44 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc: =?UTF-8?q?Vincent=20Stehl=C3=A9?= <vincent.stehle@freescale.com>, Robin Holt <holt@sgi.com>, Russell King <linux@arm.linux.org.uk>, trivial@kernel.org

=46ix the following compilation warning:

  arch/arm/mach-keystone/keystone.c:74:2: warning: initialization from =
incompatible pointer type [enabled by default]
  arch/arm/mach-keystone/keystone.c:74:2: warning: (near initialization=
 for =E2=80=98__mach_desc_KEYSTONE.restart=E2=80=99) [enabled by defaul=
t]

Signed-off-by: Vincent Stehl=C3=A9 <vincent.stehle@freescale.com>
Cc: Robin Holt <holt@sgi.com>
Cc: Russell King <linux@arm.linux.org.uk>
Cc: trivial@kernel.org
---


Hi,

This warning was seen on linux-next tag next-20130627, with config ARM
multi_v7_defconfig.

Best regards,

V.


 arch/arm/mach-keystone/keystone.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/mach-keystone/keystone.c b/arch/arm/mach-keystone=
/keystone.c
index fe4d9ff..b661c5c 100644
--- a/arch/arm/mach-keystone/keystone.c
+++ b/arch/arm/mach-keystone/keystone.c
@@ -49,7 +49,7 @@ static const char *keystone_match[] __initconst =3D {
 	NULL,
 };
=20
-void keystone_restart(char mode, const char *cmd)
+void keystone_restart(enum reboot_mode mode, const char *cmd)
 {
 	u32 val;
=20
--=20
1.7.10.4
