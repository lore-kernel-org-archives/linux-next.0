From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the tty tree with the mips tree
Date: Tue, 9 Jun 2015 20:59:53 +1000
Message-ID: <20150609205953.4ecde1ce@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/2=EO8FWJ+Qxa_eyhciGOKN7"; protocol="application/pgp-signature"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:56180 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751228AbbFILAI (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Tue, 9 Jun 2015 07:00:08 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Greg KH <greg@kroah.com>, Ralf Baechle <ralf@linux-mips.org>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Paul Burton <paul.burton@imgtec.com>, Masahiro Yamada <yamada.masahiro@socionext.com>

--Sig_/2=EO8FWJ+Qxa_eyhciGOKN7
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Greg,

Today's linux-next merge of the tty tree got conflicts in
drivers/tty/serial/8250/Kconfig and drivers/tty/serial/8250/Makefile
between commit d4a7bd1c0e5e ("serial: 8250_ingenic: support for Ingenic
SoC UARTs") from the mips tree and commit 1a8d2903cb6a ("serial:
8250_uniphier: add UniPhier serial driver") from the tty tree.

I fixed it up (see below) and can carry the fix as necessary (no action
is required).

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au

diff --cc drivers/tty/serial/8250/Kconfig
index 43330ea95cfd,a74a8e4717d4..000000000000
--- a/drivers/tty/serial/8250/Kconfig
+++ b/drivers/tty/serial/8250/Kconfig
@@@ -343,11 -351,9 +351,18 @@@ config SERIAL_8250_MT657
  	  If you have a Mediatek based board and want to use the
  	  serial port, say Y to this option. If unsure, say N.
 =20
 +config SERIAL_8250_INGENIC
 +	bool "Support for Ingenic SoC serial ports"
 +	depends on SERIAL_8250_CONSOLE && OF_FLATTREE
 +	select LIBFDT
 +	select SERIAL_EARLYCON
 +	help
 +	  If you have a system using an Ingenic SoC and wish to make use of
 +	  its UARTs, say Y to this option. If unsure, say N.
++
+ config SERIAL_8250_UNIPHIER
+ 	tristate "Support for UniPhier on-chip UART"
+ 	depends on SERIAL_8250 && ARCH_UNIPHIER
+ 	help
+ 	  If you have a UniPhier based board and want to use the on-chip
+ 	  serial ports, say Y to this option. If unsure, say N.
diff --cc drivers/tty/serial/8250/Makefile
index 98fba26e194a,6fa22ffad63d..000000000000
--- a/drivers/tty/serial/8250/Makefile
+++ b/drivers/tty/serial/8250/Makefile
@@@ -22,7 -22,6 +22,9 @@@ obj-$(CONFIG_SERIAL_8250_DW)		+=3D 8250_d
  obj-$(CONFIG_SERIAL_8250_EM)		+=3D 8250_em.o
  obj-$(CONFIG_SERIAL_8250_OMAP)		+=3D 8250_omap.o
  obj-$(CONFIG_SERIAL_8250_FINTEK)	+=3D 8250_fintek.o
+ obj-$(CONFIG_SERIAL_8250_LPC18XX)	+=3D 8250_lpc18xx.o
  obj-$(CONFIG_SERIAL_8250_MT6577)	+=3D 8250_mtk.o
 +obj-$(CONFIG_SERIAL_8250_INGENIC)	+=3D 8250_ingenic.o
 +
 +CFLAGS_8250_ingenic.o +=3D -I$(srctree)/scripts/dtc/libfdt
+ obj-$(CONFIG_SERIAL_8250_UNIPHIER)	+=3D 8250_uniphier.o

--Sig_/2=EO8FWJ+Qxa_eyhciGOKN7
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJVdsc2AAoJEMDTa8Ir7ZwVIc8P/jd1F7xW80gUX4I8nVKisagN
wJF/BH3KQ3yXFPiEwLoPo0oApwFfBxq4SzjOi8d6Xy8FeuVVJHJZtOSzmrUR+R2Y
zhiSOCY4DpANl7kcEd7clM96MzuZ0cCZW4hSzQ1/+lXFqWLsaygXbINLt+WEzLda
vVNuCT8qhKqEjHKriCW1CqgEP9rI/iciyMPz6+/WEZv1AW8MjdMCXYanDiLDQi6i
29XIqxVdT3rHZy/OBoRIit67dEe3T0nZvKPhG5kCCtk3H/9/nwka5d9Q1w/cpVV0
PhMzZq8ce1czHhb3OM+VVVuPh9MXJ9L0VE7nXmmDGWuOg5U58p7k+zmcd/xi/Iqd
gTuoE8LU+v4wxzTY3DS+AmPDoYpgOfP0rVlat6+gBh5MyevJIzEXjVsOS0hCk8HF
uf565+f7dFVb1WSKGXG7/C7KSikaaDVbj0i+Lxnnalu2hIabLhiFWCBZrVQHDmNL
y1YMD2GMqcHpbSxIrWkn6K4rBVyhQQnZvj2lzdwooxAYNJsJwLDZzsVW/6krliNP
3+yejkH8zLGnIzpOvuVcHDkkvBp+M2NpA4a1iYRmcv59BuCe12usyeZwsabUNPx5
zTOThWtc5JrtxE0sbcgZ0pDsM1T8uuEOco98PneES2Ct/73MpBBHY9PcafYbgnk2
qpQTIRwF6ZJgNCuxCkne
=cO+0
-----END PGP SIGNATURE-----

--Sig_/2=EO8FWJ+Qxa_eyhciGOKN7--
