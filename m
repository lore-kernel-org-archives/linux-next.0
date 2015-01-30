From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: [PATCH] arm: reduce conflicts in Kcinfig.debug
Date: Fri, 30 Jan 2015 13:01:17 +1100
Message-ID: <20150130130117.4d9fbd70@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_//x/TM6NQfblnPQz/SOTnZZ7"; protocol="application/pgp-signature"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:44791 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1754746AbbA3CBY (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Thu, 29 Jan 2015 21:01:24 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Olof Johansson <olof@lixom.net>, Arnd Bergmann <arnd@arndb.de>, linux-arm-kernel@lists.infradead.org, Russell King <linux@arm.linux.org.uk>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org

--Sig_//x/TM6NQfblnPQz/SOTnZZ7
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

I have seen several conflicts in this file (and other Kconfig files)
over time, so I suggest a solution like below.

Create new config symbols that can be selected by other configs
and use them as single dependencies rather than having long lists of
other config symbols as dependencies.

Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
---
 arch/arm/Kconfig       |  1 +
 arch/arm/Kconfig.debug | 55 +++++++++++++++++++++++++++++++++++-----------=
----
 2 files changed, 40 insertions(+), 16 deletions(-)

Not actually tested, but it was a very mechanical transformation.  This
is against Russell's current arm tree in linux-next, so there would be
some adjustments required for the arm-soc tree.  There are probably
some other places that this technique would be useful as well.

diff --git a/arch/arm/Kconfig b/arch/arm/Kconfig
index 1f5eb9aee750..1c9ad3832f88 100644
--- a/arch/arm/Kconfig
+++ b/arch/arm/Kconfig
@@ -432,6 +432,7 @@ config ARCH_EP93XX
 	select ARM_VIC
 	select CLKDEV_LOOKUP
 	select CPU_ARM920T
+	select DEBUG_UART_PHYS_ENABLE
 	help
 	  This enables support for the Cirrus EP93xx series of CPUs.
=20
diff --git a/arch/arm/Kconfig.debug b/arch/arm/Kconfig.debug
index a324ecdfeb21..fc991aba8944 100644
--- a/arch/arm/Kconfig.debug
+++ b/arch/arm/Kconfig.debug
@@ -96,6 +96,8 @@ choice
 	config DEBUG_ASM9260_UART
 		bool "Kernel low-level debugging via asm9260 UART"
 		depends on MACH_ASM9260
+		select DEBUG_UART_PHYS_ENABLE
+		select DEBUG_UART_VIRT_ENABLE
 		help
 		  Say Y here if you want the debug print routines to direct
 		  their output to an UART or USART port on asm9260 based
@@ -407,6 +409,8 @@ choice
 	config DEBUG_MESON_UARTAO
 		bool "Kernel low-level debugging via Meson6 UARTAO"
 		depends on ARCH_MESON
+		select DEBUG_UART_PHYS_ENABLE
+		select DEBUG_UART_VIRT_ENABLE
 		help
 		  Say Y here if you want kernel low-lever debugging support
 		  on Amlogic Meson6 based platforms on the UARTAO.
@@ -430,6 +434,8 @@ choice
 	config DEBUG_MSM_UART
 		bool "Kernel low-level debugging messages via MSM UART"
 		depends on ARCH_MSM
+		select DEBUG_UART_PHYS_ENABLE
+		select DEBUG_UART_VIRT_ENABLE
 		help
 		  Say Y here if you want the debug print routines to direct
 		  their output to the serial port on MSM devices.
@@ -449,6 +455,8 @@ choice
 	config DEBUG_QCOM_UARTDM
 		bool "Kernel low-level debugging messages via QCOM UARTDM"
 		depends on ARCH_QCOM
+		select DEBUG_UART_PHYS_ENABLE
+		select DEBUG_UART_VIRT_ENABLE
 		help
 		  Say Y here if you want the debug print routines to direct
 		  their output to the serial port on Qualcomm devices.
@@ -506,6 +514,8 @@ choice
 	config DEBUG_NETX_UART
 		bool "Kernel low-level debugging messages via NetX UART"
 		depends on ARCH_NETX
+		select DEBUG_UART_PHYS_ENABLE
+		select DEBUG_UART_VIRT_ENABLE
 		help
 		  Say Y here if you want kernel low-level debugging support
 		  on Hilscher NetX based platforms.
@@ -750,6 +760,7 @@ choice
 	config DEBUG_R7S72100_SCIF2
 		bool "Kernel low-level debugging messages via SCIF2 on R7S72100"
 		depends on ARCH_R7S72100
+		select DEBUG_UART_PHYS_ENABLE
 		help
 		  Say Y here if you want kernel low-level debugging support
 		  via SCIF2 on Renesas RZ/A1H (R7S72100).
@@ -757,6 +768,7 @@ choice
 	config DEBUG_RCAR_GEN1_SCIF0
 		bool "Kernel low-level debugging messages via SCIF0 on R8A7778"
 		depends on ARCH_R8A7778
+		select DEBUG_UART_PHYS_ENABLE
 		help
 		  Say Y here if you want kernel low-level debugging support
 		  via SCIF0 on Renesas R-Car M1A (R8A7778).
@@ -764,6 +776,7 @@ choice
 	config DEBUG_RCAR_GEN1_SCIF2
 		bool "Kernel low-level debugging messages via SCIF2 on R8A7779"
 		depends on ARCH_R8A7779
+		select DEBUG_UART_PHYS_ENABLE
 		help
 		  Say Y here if you want kernel low-level debugging support
 		  via SCIF2 on Renesas R-Car H1 (R8A7779).
@@ -771,6 +784,7 @@ choice
 	config DEBUG_RCAR_GEN2_SCIF0
 		bool "Kernel low-level debugging messages via SCIF0 on R8A7790/R8A7791/R=
8A7793)"
 		depends on ARCH_R8A7790 || ARCH_R8A7791 || ARCH_R8A7793
+		select DEBUG_UART_PHYS_ENABLE
 		help
 		  Say Y here if you want kernel low-level debugging support
 		  via SCIF0 on Renesas R-Car H2 (R8A7790), M2-W (R8A7791), or
@@ -779,6 +793,7 @@ choice
 	config DEBUG_RCAR_GEN2_SCIF2
 		bool "Kernel low-level debugging messages via SCIF2 on R8A7794"
 		depends on ARCH_R8A7794
+		select DEBUG_UART_PHYS_ENABLE
 		help
 		  Say Y here if you want kernel low-level debugging support
 		  via SCIF2 on Renesas R-Car E2 (R8A7794).
@@ -786,6 +801,7 @@ choice
 	config DEBUG_RMOBILE_SCIFA0
 		bool "Kernel low-level debugging messages via SCIFA0 on R8A73A4/SH7372"
 		depends on ARCH_R8A73A4 || ARCH_SH7372
+		select DEBUG_UART_PHYS_ENABLE
 		help
 		  Say Y here if you want kernel low-level debugging support
 		  via SCIFA0 on Renesas R-Mobile APE6 (R8A73A4) or SH-Mobile
@@ -794,6 +810,7 @@ choice
 	config DEBUG_RMOBILE_SCIFA1
 		bool "Kernel low-level debugging messages via SCIFA1 on R8A7740"
 		depends on ARCH_R8A7740
+		select DEBUG_UART_PHYS_ENABLE
 		help
 		  Say Y here if you want kernel low-level debugging support
 		  via SCIFA1 on Renesas R-Mobile A1 (R8A7740).
@@ -801,6 +818,7 @@ choice
 	config DEBUG_RMOBILE_SCIFA4
 		bool "Kernel low-level debugging messages via SCIFA4 on SH73A0"
 		depends on ARCH_SH73A0
+		select DEBUG_UART_PHYS_ENABLE
 		help
 		  Say Y here if you want kernel low-level debugging support
 		  via SCIFA4 on Renesas SH-Mobile AG5 (SH73A0).
@@ -1122,6 +1140,8 @@ choice
=20
 	config DEBUG_LL_UART_8250
 		bool "Kernel low-level debugging via 8250 UART"
+		select DEBUG_UART_PHYS_ENABLE
+		select DEBUG_UART_VIRT_ENABLE
 		help
 		  Say Y here if you wish the debug print routes to direct
 		  their output to an 8250 UART.  You can use this option
@@ -1136,6 +1156,7 @@ choice
 	config DEBUG_LL_UART_EFM32
 		bool "Kernel low-level debugging via efm32 UART"
 		depends on ARCH_EFM32
+		select DEBUG_UART_PHYS_ENABLE
 		help
 		  Say Y here if you want the debug print routines to direct
 		  their output to an UART or USART port on efm32 based
@@ -1149,6 +1170,8 @@ choice
=20
 	config DEBUG_LL_UART_PL01X
 		bool "Kernel low-level debugging via ARM Ltd PL01x Primecell UART"
+		select DEBUG_UART_PHYS_ENABLE
+		select DEBUG_UART_VIRT_ENABLE
 		help
 		  Say Y here if you wish the debug print routes to direct
 		  their output to a PL01x Primecell UART.  You can use
@@ -1171,6 +1194,8 @@ config DEBUG_S3C2410_UART
=20
 config DEBUG_S3C24XX_UART
 	bool
+	select DEBUG_UART_PHYS_ENABLE
+	select DEBUG_UART_VIRT_ENABLE
=20
 config DEBUG_S5PV210_UART
 	bool
@@ -1264,6 +1289,8 @@ config DEBUG_LL_INCLUDE
 # Compatibility options for PL01x
 config DEBUG_UART_PL01X
 	bool
+	select DEBUG_UART_PHYS_ENABLE
+	select DEBUG_UART_VIRT_ENABLE
=20
 # Compatibility options for 8250
 config DEBUG_UART_8250
@@ -1272,13 +1299,21 @@ config DEBUG_UART_8250
 		ARCH_GEMINI || ARCH_IOP13XX || ARCH_IOP32X || \
 		ARCH_IOP33X || ARCH_IXP4XX || \
 		ARCH_LPC32XX || ARCH_MV78XX0 || ARCH_ORION5X || ARCH_RPC
+	select DEBUG_UART_PHYS_ENABLE
+	select DEBUG_UART_VIRT_ENABLE
=20
 # Compatibility options for BCM63xx
 config DEBUG_UART_BCM63XX
 	def_bool ARCH_BCM_63XX
+	select DEBUG_UART_PHYS_ENABLE
+	select DEBUG_UART_VIRT_ENABLE
+
+config DEBUG_UART_PHYS_ENABLE
+	bool
=20
 config DEBUG_UART_PHYS
 	hex "Physical base address of debug UART"
+	depends on DEBUG_UART_PHYS_ENABLE
 	default 0x00100a00 if DEBUG_NETX_UART
 	default 0x01c20000 if DEBUG_DAVINCI_DMx_UART0
 	default 0x01c28000 if DEBUG_SUNXI_UART0
@@ -1365,20 +1400,13 @@ config DEBUG_UART_PHYS
 	default 0xfffb9800 if DEBUG_OMAP1UART3 || DEBUG_OMAP7XXUART3
 	default 0xfffe8600 if DEBUG_UART_BCM63XX
 	default 0xfffff700 if ARCH_IOP33X
-	depends on ARCH_EP93XX || \
-	        DEBUG_LL_UART_8250 || DEBUG_LL_UART_PL01X || \
-		DEBUG_LL_UART_EFM32 || \
-		DEBUG_UART_8250 || DEBUG_UART_PL01X || DEBUG_MESON_UARTAO || \
-		DEBUG_MSM_UART || DEBUG_NETX_UART || \
-		DEBUG_QCOM_UARTDM || DEBUG_R7S72100_SCIF2 || \
-		DEBUG_RCAR_GEN1_SCIF0 || DEBUG_RCAR_GEN1_SCIF2 || \
-		DEBUG_RCAR_GEN2_SCIF0 || DEBUG_RCAR_GEN2_SCIF2 || \
-		DEBUG_RMOBILE_SCIFA0 || DEBUG_RMOBILE_SCIFA1 || \
-		DEBUG_RMOBILE_SCIFA4 || DEBUG_S3C24XX_UART || \
-		DEBUG_UART_BCM63XX || DEBUG_ASM9260_UART
+
+config DEBUG_UART_VIRT_ENABLE
+	bool
=20
 config DEBUG_UART_VIRT
 	hex "Virtual base address of debug UART"
+	depends on DEBUG_UART_VIRT_ENABLE
 	default 0xe0000a00 if DEBUG_NETX_UART
 	default 0xe0010fe0 if ARCH_RPC
 	default 0xe1000000 if DEBUG_MSM_UART
@@ -1454,11 +1482,6 @@ config DEBUG_UART_VIRT
 	default 0xfefff700 if ARCH_IOP33X
 	default 0xff003000 if DEBUG_U300_UART
 	default DEBUG_UART_PHYS if !MMU
-	depends on DEBUG_LL_UART_8250 || DEBUG_LL_UART_PL01X || \
-		DEBUG_UART_8250 || DEBUG_UART_PL01X || DEBUG_MESON_UARTAO || \
-		DEBUG_MSM_UART || DEBUG_NETX_UART || \
-		DEBUG_QCOM_UARTDM || DEBUG_S3C24XX_UART || \
-		DEBUG_UART_BCM63XX || DEBUG_ASM9260_UART
=20
 config DEBUG_UART_8250_SHIFT
 	int "Register offset shift for the 8250 debug UART"
--=20
2.1.4

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au

--Sig_//x/TM6NQfblnPQz/SOTnZZ7
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJUyuXyAAoJEMDTa8Ir7ZwVLIUP/3ZTFPupBWe2d+263kQUr0Ka
PFdtGSoHezM8kRCc2ec+aQM52bQdX8+jpn5YuQmGLjO/aZSP2AuUd6ZvfokIzYb8
eJHRCrODOiKX7Y86aeDYmPEZSo1qCag9Uhyz8hw9pe6qiRJ6s9SWx9nTI+Ah4Uxe
mwY42pPoeCoL1FS2eDhHuPrdSwaulM+xEiebrBbs//2KodTqFURr5QSyilSnEtMQ
0tDW+jgvdniO9TzC33/6D7PFY9LovHMMuydlRK/ehXygbLBlsgEFGfGK5RtjsEjl
qy9+WzpMMcl2IYEI6bJ/RbO2tWoX01ArWODlbDMJ3O7OXCGVLYiUc9BEtw3lhL3x
7BwG2S/g7VOtVe/4FJkj4O9WsKh2y8ywrXvCojnVGx1ADKC3sB39q68c0JcbedRm
+sdL6i3Jj8R/itiBTCbOgvdR3JC1WrTft46Ge2fzXPkc7rMSci3zv5ozjdUdRmay
oQHGYmLSd5o/hT+NdM+S1ThT2tnMkLJqNKqQx3KwTxQAZfcbYEmH2GO8o/NNML4X
WAUx4fGy9abQDmEw7Ji8R3d2/iRpvU0CRbEoYBwlfSHN/6Ua/6caGiMPVZp26sMU
wcf0DHfk79+k0xFP2d4sDEQSmCSh7Dn84rtAZidhcCA7lsbUzSUoQX2irh2B8aNC
C/4xZRFbOznMSj1qI2nb
=SjJG
-----END PGP SIGNATURE-----

--Sig_//x/TM6NQfblnPQz/SOTnZZ7--
