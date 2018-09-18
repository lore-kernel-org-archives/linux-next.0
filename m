From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the staging tree with the at91 tree
Date: Tue, 18 Sep 2018 13:12:38 +1000
Message-ID: <20180918131238.2838bedd@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/PVGMmhdyduetp4fvNQ4zjyq"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Greg KH <greg@kroah.com>, Nicolas Ferre <nicolas.ferre@atmel.com>, Alexandre Belloni <alexandre.belloni@bootlin.com>, Ludovic Desroches <ludovic.desroches@microchip.com>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Marcus Folkesson <marcus.folkesson@gmail.com>, Kent Gustavsson <kent@minoris.se>
List-Id: linux-next.vger.kernel.org

--Sig_/PVGMmhdyduetp4fvNQ4zjyq
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the staging tree got a conflict in:

  MAINTAINERS

between commit:

  5ae2f1f30197 ("MAINTAINERS: move former ATMEL entries to proper MICROCHIP=
 locatioat91n")

from the at91 tree and commit:

  010de20412fc ("MAINTAINERS: Add entry for mcp3911 ADC driver")

from the staging tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

--=20
Cheers,
Stephen Rothwell

diff --cc MAINTAINERS
index 0d01245ef7b4,7f77f2c837a8..000000000000
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@@ -9539,72 -9582,14 +9554,80 @@@ L:	netdev@vger.kernel.or
  S:	Maintained
  F:	drivers/net/ethernet/microchip/lan743x_*
 =20
 +MICROCHIP LCDFB DRIVER
 +M:	Nicolas Ferre <nicolas.ferre@microchip.com>
 +L:	linux-fbdev@vger.kernel.org
 +S:	Maintained
 +F:	drivers/video/fbdev/atmel_lcdfb.c
 +F:	include/video/atmel_lcdc.h
 +
+ MICROCHIP / ATMEL MCP3911 ADC DRIVER
+ M:	Marcus Folkesson <marcus.folkesson@gmail.com>
+ M:	Kent Gustavsson <kent@minoris.se>
+ L:	linux-iio@vger.kernel.org
+ S:	Supported
+ F:	drivers/iio/adc/mcp3911.c
+ F:	Documentation/devicetree/bindings/iio/adc/mcp3911.txt
+=20
 +MICROCHIP MMC/SD/SDIO MCI DRIVER
 +M:	Ludovic Desroches <ludovic.desroches@microchip.com>
 +S:	Maintained
 +F:	drivers/mmc/host/atmel-mci.c
 +
 +MICROCHIP NAND DRIVER
 +M:	Tudor Ambarus <tudor.ambarus@microchip.com>
 +L:	linux-mtd@lists.infradead.org
 +S:	Supported
 +F:	drivers/mtd/nand/raw/atmel/*
 +F:	Documentation/devicetree/bindings/mtd/atmel-nand.txt
 +
 +MICROCHIP PWM DRIVER
 +M:	Claudiu Beznea <claudiu.beznea@microchip.com>
 +L:	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
 +L:	linux-pwm@vger.kernel.org
 +S:	Supported
 +F:	drivers/pwm/pwm-atmel.c
 +F:	Documentation/devicetree/bindings/pwm/atmel-pwm.txt
 +
 +MICROCHIP SAMA5D2-COMPATIBLE ADC DRIVER
 +M:	Ludovic Desroches <ludovic.desroches@microchip.com>
 +M:	Eugen Hristev <eugen.hristev@microchip.com>
 +L:	linux-iio@vger.kernel.org
 +S:	Supported
 +F:	drivers/iio/adc/at91-sama5d2_adc.c
 +F:	Documentation/devicetree/bindings/iio/adc/at91-sama5d2_adc.txt
 +F:	include/dt-bindings/iio/adc/at91-sama5d2_adc.h
 +
 +MICROCHIP SAMA5D2-COMPATIBLE SHUTDOWN CONTROLLER
 +M:	Nicolas Ferre <nicolas.ferre@microchip.com>
 +S:	Supported
 +F:	drivers/power/reset/at91-sama5d2_shdwc.c
 +
 +MICROCHIP SPI DRIVER
 +M:	Nicolas Ferre <nicolas.ferre@microchip.com>
 +S:	Supported
 +F:	drivers/spi/spi-atmel.*
 +
 +MICROCHIP SSC DRIVER
 +M:	Nicolas Ferre <nicolas.ferre@microchip.com>
 +L:	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
 +S:	Supported
 +F:	drivers/misc/atmel-ssc.c
 +F:	include/linux/atmel-ssc.h
 +
 +MICROCHIP TIMER COUNTER (TC) AND CLOCKSOURCE DRIVERS
 +M:	Nicolas Ferre <nicolas.ferre@microchip.com>
 +L:	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
 +S:	Supported
 +F:	drivers/misc/atmel_tclib.c
 +F:	drivers/clocksource/tcb_clksrc.c
 +
 +MICROCHIP USBA UDC DRIVER
 +M:	Cristian Birsan <cristian.birsan@microchip.com>
 +L:	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
 +S:	Supported
 +F:	drivers/usb/gadget/udc/atmel_usba_udc.*
 +
  MICROCHIP USB251XB DRIVER
  M:	Richard Leitner <richard.leitner@skidata.com>
  L:	linux-usb@vger.kernel.org

--Sig_/PVGMmhdyduetp4fvNQ4zjyq
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAlugbSYACgkQAVBC80lX
0Gyjlgf9EQBmHue1/UulNgRvJjC/Ik0nAPMZ7gPR/1cc34+IQRepuISnGw94dsLN
La6Im9fnJY1Yn2OcaQV9nf7ODw7DTeNB5TZrZ1aErTrNcuUnRm2YZhucfD8auNyI
lG7Y5jm0PPBL/uVYHHpnklGB3f7vM0ptLQhfxO5dljsIWPbKfI1OcoTym3KMxNOz
2kaNR6jgaZ7YyrPvblkMEzjPpm6w/5WHjp+g+HsWLOAise/5O0e8/Y190hcLAmNp
zoEL1rniQZLtLXdGzR8HqQRPtOeDGmNojM6nY1cEgBRvPb2CVpma4E5Fxga8UQTX
vt9BM4JlIbvGOeIOhQPVp6oCpgUENQ==
=GIWb
-----END PGP SIGNATURE-----

--Sig_/PVGMmhdyduetp4fvNQ4zjyq--
