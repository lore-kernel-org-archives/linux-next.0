From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the mfd tree with Linus' tree
Date: Fri, 17 Aug 2018 10:39:13 +1000
Message-ID: <20180817103913.52544928@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/d_C1UIw2solsaophUWt17Kn"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Lee Jones <lee.jones@linaro.org>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>, Richard Fitzgerald <rf@opensource.cirrus.com>
List-Id: linux-next.vger.kernel.org

--Sig_/d_C1UIw2solsaophUWt17Kn
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the mfd tree got a conflict in:

  MAINTAINERS

between commit:

  16b7db4c8150 ("MAINTAINERS: Add .clang-format entry")

from Linus' tree and commit:

  97c2b5cba204 ("mfd: madera: Add register definitions for Cirrus Logic Mad=
era codecs")

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
index 041b111596bc,2c1c6aef7d74..000000000000
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@@ -3557,11 -3513,23 +3557,27 @@@ M:	Christian Benvenuti <benve@cisco.com
  S:	Supported
  F:	drivers/infiniband/hw/usnic/
 =20
 +CLANG-FORMAT FILE
 +M:	Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
 +S:	Maintained
 +F:	.clang-format
 +
+ CIRRUS LOGIC MADERA CODEC DRIVERS
+ M:	Charles Keepax <ckeepax@opensource.cirrus.com>
+ M:	Richard Fitzgerald <rf@opensource.cirrus.com>
+ L:	alsa-devel@alsa-project.org (moderated for non-subscribers)
+ L:	patches@opensource.cirrus.com
+ T:	git https://github.com/CirrusLogic/linux-drivers.git
+ W:	https://github.com/CirrusLogic/linux-drivers/wiki
+ S:	Supported
+ F:	Documentation/devicetree/bindings/mfd/madera.txt
+ F:	Documentation/devicetree/bindings/pinctrl/cirrus,madera-pinctrl.txt
+ F:	include/linux/mfd/madera/*
+ F:	drivers/gpio/gpio-madera*
+ F:	drivers/mfd/madera*
+ F:	drivers/mfd/cs47l*
+ F:	drivers/pinctrl/cirrus/*
+=20
  CLEANCACHE API
  M:	Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>
  L:	linux-kernel@vger.kernel.org

--Sig_/d_C1UIw2solsaophUWt17Kn
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAlt2GTEACgkQAVBC80lX
0Gzf1Af9GVIqDQSFd6Qj1Rw0m5tD2uYRas0vxRSJeYrVBWk5B7ywkI2OZEr1VOIK
IkFwEzRx7lfR9Gd/sDmq8xLlgt+7F6lgwNYDJxMJkHuw14mvncNkfhE/lpZuXlSZ
jx2Ecf3Lr7czTLZGZUpMZUZ4/08Eh4KHFelvVjYUaI/giUyCBG/NTu3unsVvClcJ
mEe39Bq01C/ra560g1BbD5xuzvmwv7wZebtEhUs8CbWgva0d1/PNRnloF+EQ/Sly
lsbqlkoscwjBm11HHvzjhPpW5S6WwdqurBu90UcQ3VbVDClDVAZ6EQuwpkq5F0+n
DYv54jLqrYv5oWhzbCO9VbGxon1nLw==
=rug9
-----END PGP SIGNATURE-----

--Sig_/d_C1UIw2solsaophUWt17Kn--
