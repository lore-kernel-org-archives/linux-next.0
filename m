From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the nand tree with the mvebu tree
Date: Thu, 7 Feb 2019 12:25:09 +1100
Message-ID: <20190207122509.68144d86@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/erH/6b8z4jz=/2fEeJwtDsJ"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Miquel Raynal <miquel.raynal@bootlin.com>, Boris Brezillon <boris.brezillon@bootlin.com>, Jason Cooper <jason@lakedaemon.net>, Andrew Lunn <andrew@lunn.ch>, Gregory Clement <gregory.clement@bootlin.com>, ARM <linux-arm-kernel@lists.infradead.org>
Cc: Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Vladimir Vid <vladimir.vid@sartura.hr>, Jianxin Pan <jianxin.pan@amlogic.com>
List-Id: linux-next.vger.kernel.org

--Sig_/erH/6b8z4jz=/2fEeJwtDsJ
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the nand tree got a conflict in:

  MAINTAINERS

between commit:

  2e73bb33366d ("arm64: dts: marvell: Add device tree for uDPU board")

from the mvebu tree and commit:

  0f416a463ecc ("MAINTAINERS: Add entry for Amlogic NAND controller driver")

from the nand tree.

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
index 2d958beee76f,e6b902c7c828..000000000000
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@@ -9887,11 -9849,13 +9887,18 @@@ F:	drivers/media/platform/meson/ao-cec.
  F:	Documentation/devicetree/bindings/media/meson-ao-cec.txt
  T:	git git://linuxtv.org/media_tree.git
 =20
+ MESON NAND CONTROLLER DRIVER FOR AMLOGIC SOCS
+ M:	Liang Yang <liang.yang@amlogic.com>
+ L:	linux-mtd@lists.infradead.org
+ S:	Maintained
+ F:	drivers/mtd/nand/raw/meson_*
+ F:	Documentation/devicetree/bindings/mtd/amlogic,meson-nand.txt
+=20
 +METHODE UDPU SUPPORT
 +M:	Vladimir Vid <vladimir.vid@sartura.hr>
 +S:	Maintained
 +F:	arch/arm64/boot/dts/marvell/armada-3720-uDPU.dts
 +
  MICROBLAZE ARCHITECTURE
  M:	Michal Simek <monstr@monstr.eu>
  W:	http://www.monstr.eu/fdt/

--Sig_/erH/6b8z4jz=/2fEeJwtDsJ
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAlxbiPUACgkQAVBC80lX
0GyH1gf/a6LAWUFi6kZSTqxMHXZFZj1xcglu51VmEcCgrCh9ooQvqF510dVdr9LS
21FvQrp7TvudZRef3PrL+dGX4HJGP7tT+5HlGID3f1mmrR1xnA6lOhY4ecThx8GY
Vk9yYxFFbuL3u7mCKlfevDmh1nw3kuGPfHcyLnkKEYgDKsQTNnuHUvBiwdtGhFq+
Fc12gV7BvSmrWt8OstFGO89sx1unQMJV9O2faWykT4OHhrO7ZDHFblUDEyVQH8IW
Gn82LWyi5RbjUpVi3nt4p8rDqTXVoQMm5q3ChMYVF1o68CO5NT2JVTIX9A4rOfVu
X8LhnLJp3iieUYLa71DsaL7MHujp4g==
=tYPF
-----END PGP SIGNATURE-----

--Sig_/erH/6b8z4jz=/2fEeJwtDsJ--
