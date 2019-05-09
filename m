From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the mfd tree with Linus' tree
Date: Thu, 9 May 2019 12:44:07 +1000
Message-ID: <20190509124407.4b31b6aa@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/fszQBE56aDaBwDDCYhv84vH"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Lee Jones <lee.jones@linaro.org>
Cc: Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Bartosz Golaszewski <bgolaszewski@baylibre.com>, Andreas Klinger <ak@it-klinger.de>, Jonathan Cameron <Jonathan.Cameron@huawei.com>
List-Id: linux-next.vger.kernel.org

--Sig_/fszQBE56aDaBwDDCYhv84vH
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the mfd tree got a conflict in:

  MAINTAINERS

between commit:

  10b5d3d10759 ("MAINTAINERS: add maintainer for maxbotix ultrasonic driver=
")

from Linus' tree and commit:

  796fad0101d3 ("MAINTAINERS: Add an entry for MAX77650 PMIC driver")

from the mfd tree.

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
index 77471dd6cb46,1effe9789023..000000000000
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@@ -9521,13 -9414,20 +9527,27 @@@ S:	Maintaine
  F:	Documentation/devicetree/bindings/sound/max9860.txt
  F:	sound/soc/codecs/max9860.*
 =20
 +MAXBOTIX ULTRASONIC RANGER IIO DRIVER
 +M:	Andreas Klinger <ak@it-klinger.de>
 +L:	linux-iio@vger.kernel.org
 +S:	Maintained
 +F:	Documentation/devicetree/bindings/iio/proximity/maxbotix,mb1232.txt
 +F:	drivers/iio/proximity/mb1232.c
 +
+ MAXIM MAX77650 PMIC MFD DRIVER
+ M:	Bartosz Golaszewski <bgolaszewski@baylibre.com>
+ L:	linux-kernel@vger.kernel.org
+ S:	Maintained
+ F:	Documentation/devicetree/bindings/*/*max77650.txt
+ F:	Documentation/devicetree/bindings/*/max77650*.txt
+ F:	include/linux/mfd/max77650.h
+ F:	drivers/mfd/max77650.c
+ F:	drivers/regulator/max77650-regulator.c
+ F:	drivers/power/supply/max77650-charger.c
+ F:	drivers/input/misc/max77650-onkey.c
+ F:	drivers/leds/leds-max77650.c
+ F:	drivers/gpio/gpio-max77650.c
+=20
  MAXIM MAX77802 PMIC REGULATOR DEVICE DRIVER
  M:	Javier Martinez Canillas <javier@dowhile0.org>
  L:	linux-kernel@vger.kernel.org

--Sig_/fszQBE56aDaBwDDCYhv84vH
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAlzTk/cACgkQAVBC80lX
0GwNUAf5AU2lczOnNLji+pu93/BboZyAZaJq3JImXCd6/G94L5hpIqTTAu+pKM3a
bV0XHGB1iqRN8KNmCdBnT51tE83eIyROjKO3oon2/90uuAQDGzuiH0oyIGAHTXlM
V1XhNE2bWvGspZxna7HMmT8F9fB0HmDr0VtLia+KNCVPTh9TX/5MxPDqzm5wNJu9
nqF85hZq42KsFu/tLtJdDxw+nACAtM9HHOsoRXxrdy3Ys7etw004IN+WfSNuGkcj
YyjhthNQtTudJEELajvyVXf2k2ha1gc2VuBVkQftS/pEEVb6WiEv6x1C3E5mruaJ
enPrrrYyfogxkmkqq512rB/sbBHuMg==
=UJ2L
-----END PGP SIGNATURE-----

--Sig_/fszQBE56aDaBwDDCYhv84vH--
