From: =?UTF-8?q?Vincent=20Stehl=C3=A9?= <vincent.stehle@freescale.com>
Subject: [PATCH linux-next] arm: multi_v7_defconfig: add fsl lpuart serial console
Date: Tue, 9 Jul 2013 19:54:51 +0200
Message-ID: <1373392491-32056-1-git-send-email-vincent.stehle@freescale.com>
Reply-To: <vstehle@debian>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail14-co9on0067.outbound.messaging.microsoft.com ([157.56.211.67]:27289
	"EHLO CO9EHSNDR002.bigfish.com" rhost-flags-OK-OK-OK-FAIL)
	by vger.kernel.org with ESMTP id S1752381Ab3GIRz1 convert rfc822-to-8bit
	(ORCPT <rfc822;linux-next@vger.kernel.org>);
	Tue, 9 Jul 2013 13:55:27 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-next@vger.kernel.org
Cc: =?UTF-8?q?Vincent=20Stehl=C3=A9?= <vincent.stehle@freescale.com>, Olof Johansson <olof@lixom.net>, Russell King <linux@arm.linux.org.uk>

Add Freescale LPUART serial console support. This gives us the boot mes=
sages on
UART on e.g. the Vybrid VF610 Tower board.

Signed-off-by: Vincent Stehl=C3=A9 <vincent.stehle@freescale.com>
Cc: Olof Johansson <olof@lixom.net>
Cc: Russell King <linux@arm.linux.org.uk>
---


Hi,

Would you please consider adding LPUART for ARM multi_v7_defconfig, ple=
ase?

(This patch is built on top of the following patches:
http://comments.gmane.org/gmane.linux.kernel/1519712)

Best regards,

V.


 arch/arm/configs/multi_v7_defconfig |    2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm/configs/multi_v7_defconfig b/arch/arm/configs/mul=
ti_v7_defconfig
index 81eac83..80aacc6 100644
--- a/arch/arm/configs/multi_v7_defconfig
+++ b/arch/arm/configs/multi_v7_defconfig
@@ -79,6 +79,8 @@ CONFIG_SERIAL_XILINX_PS_UART=3Dy
 CONFIG_SERIAL_XILINX_PS_UART_CONSOLE=3Dy
 CONFIG_SERIAL_IMX=3Dy
 CONFIG_SERIAL_IMX_CONSOLE=3Dy
+CONFIG_SERIAL_FSL_LPUART=3Dy
+CONFIG_SERIAL_FSL_LPUART_CONSOLE=3Dy
 CONFIG_I2C_DESIGNWARE_PLATFORM=3Dy
 CONFIG_I2C_SIRF=3Dy
 CONFIG_I2C_TEGRA=3Dy
--=20
1.7.10.4
