From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the akpm-current tree with the mips
 tree
Date: Wed, 3 Jun 2015 19:33:46 +1000
Message-ID: <20150603193346.01a9989d@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/yd6VimrzzdsxOhyTbIuDyAn"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Andrew Morton <akpm@linux-foundation.org>, Ralf Baechle <ralf@linux-mips.org>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Joe Perches <joe@perches.com>, =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>
List-Id: linux-next.vger.kernel.org

--Sig_/yd6VimrzzdsxOhyTbIuDyAn
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Hi Andrew,

Today's linux-next merge of the akpm-current tree got a conflict in
MAINTAINERS between commit d4b6c2755ce1 ("MAINTAINERS: Add Broadcom
BCM47xx entry") from the  tree and commit b93598277db2 ("MAINTAINERS:
remove section BROADCOM BCM33XX MIPS ARCHITECTURE") from the
akpm-current tree.

I fixed it up (see below) and can carry the fix as necessary (no action
is required).

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au

diff --cc MAINTAINERS
index 5f620640c34d,6de7364e67a4..000000000000
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@@ -2211,22 -2153,6 +2211,14 @@@ T:	git git://git.kernel.org/pub/scm/lin
  S:	Maintained
  N:	bcm2835
 =20
- BROADCOM BCM33XX MIPS ARCHITECTURE
- M:	Kevin Cernekee <cernekee@gmail.com>
- L:	linux-mips@linux-mips.org
- S:	Maintained
- F:	arch/mips/bcm3384/*
- F:	arch/mips/include/asm/mach-bcm3384/*
- F:	arch/mips/kernel/*bmips*
-=20
 +BROADCOM BCM47XX MIPS ARCHITECTURE
 +M:	Hauke Mehrtens <hauke@hauke-m.de>
 +M:	Rafa=C5=82 Mi=C5=82ecki <zajec5@gmail.com>
 +L:	linux-mips@linux-mips.org
 +S:	Maintained
 +F:	arch/mips/bcm47xx/*
 +F:	arch/mips/include/asm/mach-bcm47xx/*
 +
  BROADCOM BCM5301X ARM ARCHITECTURE
  M:	Hauke Mehrtens <hauke@hauke-m.de>
  L:	linux-arm-kernel@lists.infradead.org
@@@ -2322,14 -2247,8 +2314,14 @@@ M:	Ray Jui <rjui@broadcom.com
  L:	bcm-kernel-feedback-list@broadcom.com
  S:	Supported
  F:	drivers/gpio/gpio-bcm-kona.c
- F:	Documentation/devicetree/bindings/gpio/gpio-bcm-kona.txt
+ F:	Documentation/devicetree/bindings/gpio/brcm,kona-gpio.txt
 =20
 +BROADCOM STB NAND FLASH DRIVER
 +M:	Brian Norris <computersforpeace@gmail.com>
 +L:	linux-mtd@lists.infradead.org
 +S:	Maintained
 +F:	drivers/mtd/nand/brcmnand/
 +
  BROADCOM SPECIFIC AMBA DRIVER (BCMA)
  M:	Rafa=C5=82 Mi=C5=82ecki <zajec5@gmail.com>
  L:	linux-wireless@vger.kernel.org

--Sig_/yd6VimrzzdsxOhyTbIuDyAn
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJVbsoCAAoJEMDTa8Ir7ZwVpCAQAIiIpZyXdMCZLGRq3twgBrwR
61HIrZchGrlozS1qHX7DeaNz4DfLsffW5agWM64Qpg6WFggVl65eNTaIqVyOI9+5
fSl/r3lc4oelkx8CPsFJ7147oOBGWzJSRGPj5fwo+Vq/OdgYyusEhvB8rlswB7Am
C07P20XtGi1Bsd+lzHzco16evBAtbv70QPE8O3d7aFBc1MsWvXa6IVCUYRSHgHF7
2999uCP+ycUKDbdLxpWAgOfEi5y7biL7H4YZRg2u6qzb8JhgB59Fpr49r8dO7nIP
LRciZ9qeKuRdBsFFParLkzpORTWAhSkpsOY1tKAVFYyQHEvFqSAkd9DH3xYGvfux
JH3yLgopRY1i9PmcFGcec12E+lIFkiYLQkCefkL7UFgkOBuLewOGSWYeU6TBD4PO
nHhtHpRM5O9+zDs1do1RrOQy5kgKbuXqRdSIR3MX2KRAe8cO39JtJUcCsMdM6pIZ
0rz2f+3iPVDZqGIiUa/rZY3bhUwOYWXux7zs+sL/vFPN5Gw6v54Z2ku29MZdCLey
CwA/sSZMcMBi1Eq/YnvA8cnhhwrHNNNsaI+aldAfFpAM8IOdUEb18pRu16ejpwoj
Fd/f8lY8V9AO2io9/dQFBkrJCJBgfs8OjcaP4GmmSRCLAMjO80Kd7X06yeMBUi2/
ADf6nf3qzn+NpaC8bwvS
=QXqf
-----END PGP SIGNATURE-----

--Sig_/yd6VimrzzdsxOhyTbIuDyAn--
