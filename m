From: =?UTF-8?q?Vincent=20Stehl=C3=A9?= <vincent.stehle@freescale.com>
Subject: [PATCH linux-next] arm: zynq: fix compilation warning
Date: Thu, 27 Jun 2013 14:42:41 +0200
Message-ID: <1372336962-6459-1-git-send-email-vincent.stehle@freescale.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-db8lp0184.outbound.messaging.microsoft.com ([213.199.154.184]:31473
	"EHLO db8outboundpool.messaging.microsoft.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1751819Ab3F0MnL convert rfc822-to-8bit
	(ORCPT <rfc822;linux-next@vger.kernel.org>);
	Thu, 27 Jun 2013 08:43:11 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc: =?UTF-8?q?Vincent=20Stehl=C3=A9?= <vincent.stehle@freescale.com>, Robin Holt <holt@sgi.com>, Michal Simek <michal.simek@xilinx.com>, Russell King <linux@arm.linux.org.uk>, trivial@kernel.org

=46ix the following compilation warning:

  arch/arm/mach-zynq/common.c:110:2: warning: initialization from incom=
patible pointer type [enabled by default]
  arch/arm/mach-zynq/common.c:110:2: warning: (near initialization for =
=E2=80=98__mach_desc_XILINX_EP107.restart=E2=80=99) [enabled by default=
]

Signed-off-by: Vincent Stehl=C3=A9 <vincent.stehle@freescale.com>
Cc: Robin Holt <holt@sgi.com>
Cc: Michal Simek <michal.simek@xilinx.com>
Cc: Russell King <linux@arm.linux.org.uk>
Cc: trivial@kernel.org
---


Hi,

This warning was seen on linux-next tag next-20130627, with config ARM
multi_v7_defconfig.

Best regards,

V.


 arch/arm/mach-zynq/common.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/mach-zynq/common.c b/arch/arm/mach-zynq/common.c
index 4130e65..8ea5f11 100644
--- a/arch/arm/mach-zynq/common.c
+++ b/arch/arm/mach-zynq/common.c
@@ -91,7 +91,7 @@ static void __init zynq_map_io(void)
 	zynq_scu_map_io();
 }
=20
-static void zynq_system_reset(char mode, const char *cmd)
+static void zynq_system_reset(enum reboot_mode mode, const char *cmd)
 {
 	zynq_slcr_system_reset();
 }
--=20
1.7.10.4
