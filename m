From: =?UTF-8?q?Vincent=20Stehl=C3=A9?= <vincent.stehle@freescale.com>
Subject: [PATCH linux-next 1/2] arm: multi_v7_defconfig: add i.MX serial console
Date: Wed, 3 Jul 2013 10:12:58 +0200
Message-ID: <1372839179-14542-2-git-send-email-vincent.stehle@freescale.com>
References: <1372839179-14542-1-git-send-email-vincent.stehle@freescale.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1372839179-14542-1-git-send-email-vincent.stehle@freescale.com>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc: =?UTF-8?q?Vincent=20Stehl=C3=A9?= <vincent.stehle@freescale.com>, Olof Johansson <olof@lixom.net>, Russell King <linux@arm.linux.org.uk>
List-Id: linux-next.vger.kernel.org

Add i.MX serial console support. This gives us the boot messages on UAR=
T on
e.g. the i.MX6Q sabre sd platform.

Signed-off-by: Vincent Stehl=C3=A9 <vincent.stehle@freescale.com>
Cc: Olof Johansson <olof@lixom.net>
Cc: Russell King <linux@arm.linux.org.uk>
---
 arch/arm/configs/multi_v7_defconfig |    2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm/configs/multi_v7_defconfig b/arch/arm/configs/mul=
ti_v7_defconfig
index 6d8d3c4..cc8723a 100644
--- a/arch/arm/configs/multi_v7_defconfig
+++ b/arch/arm/configs/multi_v7_defconfig
@@ -75,6 +75,8 @@ CONFIG_SERIAL_OMAP=3Dy
 CONFIG_SERIAL_OMAP_CONSOLE=3Dy
 CONFIG_SERIAL_XILINX_PS_UART=3Dy
 CONFIG_SERIAL_XILINX_PS_UART_CONSOLE=3Dy
+CONFIG_SERIAL_IMX=3Dy
+CONFIG_SERIAL_IMX_CONSOLE=3Dy
 CONFIG_I2C_DESIGNWARE_PLATFORM=3Dy
 CONFIG_I2C_SIRF=3Dy
 CONFIG_I2C_TEGRA=3Dy
--=20
1.7.10.4
