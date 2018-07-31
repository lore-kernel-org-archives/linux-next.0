From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the mux tree with the battery tree
Date: Tue, 31 Jul 2018 15:20:04 +1000
Message-ID: <20180731152004.7a5a4c54@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/XkWjOn12ORf2gl=uLwowV4O"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Peter Rosin <peda@axentia.se>, Sebastian Reichel <sre@kernel.org>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Mircea Caprioru <mircea.caprioru@analog.com>, Stefan Popa <stefan.popa@analog.com>
List-Id: linux-next.vger.kernel.org

--Sig_/XkWjOn12ORf2gl=uLwowV4O
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the mux tree got a conflict in:

  MAINTAINERS

between commit:

  fe8e81b7e899 ("adp5061: New driver for ADP5061 I2C battery charger")

from the battery tree and commit:

  703160ff3e50 ("dt-bindings: mux: add adi,adgs1408")

from the mux tree.

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
index db24b8939ed4,eaa2b55a0e9b..000000000000
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@@ -829,13 -810,12 +829,19 @@@ L:	linux-media@vger.kernel.or
  S:	Maintained
  F:	drivers/media/i2c/ad9389b*
 =20
+ ANALOG DEVICES INC ADGS1408 DRIVER
+ M:	Mircea Caprioru <mircea.caprioru@analog.com>
+ S:	Supported
+ F:	drivers/mux/adgs1408.c
+ F:	Documentation/devicetree/bindings/mux/adgs1408.txt
+=20
 +ANALOG DEVICES INC ADP5061 DRIVER
 +M:	Stefan Popa <stefan.popa@analog.com>
 +L:	linux-pm@vger.kernel.org
 +W:	http://ez.analog.com/community/linux-device-drivers
 +S:	Supported
 +F:	drivers/power/supply/adp5061.c
 +
  ANALOG DEVICES INC ADV7180 DRIVER
  M:	Lars-Peter Clausen <lars@metafoo.de>
  L:	linux-media@vger.kernel.org

--Sig_/XkWjOn12ORf2gl=uLwowV4O
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAltf8YQACgkQAVBC80lX
0GwzHwf/XlO57ooBPlEwN+mUSM0f6hO8gQgIuwHTCg5GQcHqOKSEGQetSYNAzFx6
anXChgsDPEfZezcZZyPefeWqm/E7QHxGmfRCocf3JSGcfGx+j/9BHV0Bys2lyT/I
3KPvge+hU9pqtaAdq8SuN0M7WD62IFFpRC3yjh/4KA6RZePxhdCoVHuU1IEycuVU
BPpk1mOgF1afBg+iUJMEyKaYYQ9wu4+cofujRllZD/M5CfPFDNlneyklSqj33eAr
UrmqyoMmnQtLixatZ4FFbqGfF671p1S9NqXICQQBR1pg9oJc6Xc1UPBIm1t/Av+3
uK4yxRl3DRoNB84N9F+gUMfREpcGTg==
=VY3a
-----END PGP SIGNATURE-----

--Sig_/XkWjOn12ORf2gl=uLwowV4O--
