From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the sound-asoc tree with the
 hwmon-staging tree
Date: Mon, 1 Apr 2019 09:55:06 +1100
Message-ID: <20190401095506.39bf18eb@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/D1nDx4sTVRp2m=0iVF2hqso"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>, Guenter Roeck <linux@roeck-us.net>
Cc: Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Lucas Tanure <tanureal@opensource.cirrus.com>, Piotr Stankiewicz <piotrs@opensource.cirrus.com>, Charles Keepax <ckeepax@opensource.cirrus.com>
List-Id: linux-next.vger.kernel.org

--Sig_/D1nDx4sTVRp2m=0iVF2hqso
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the sound-asoc tree got a conflict in:

  MAINTAINERS

between commit:

  d1ce5addbaa0 ("hwmon: lochnagar: Add Lochnagar 2 hardware monitoring driv=
er")

from the hwmon-staging tree and commit:

  16123412a628 ("ASoC: lochnagar: Add driver to support Lochnagar 2 sound c=
ard")

from the sound-asoc tree.

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
index e254d42e0f2c,84b9d7557ca3..000000000000
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@@ -3815,10 -3805,9 +3816,11 @@@ F:	include/dt-bindings/pinctrl/lochnaga
  F:	include/linux/mfd/lochnagar*
  F:	Documentation/devicetree/bindings/mfd/cirrus,lochnagar.txt
  F:	Documentation/devicetree/bindings/clock/cirrus,lochnagar.txt
 +F:	Documentation/devicetree/bindings/hwmon/cirrus,lochnagar.txt
  F:	Documentation/devicetree/bindings/pinctrl/cirrus,lochnagar.txt
  F:	Documentation/devicetree/bindings/regulator/cirrus,lochnagar.txt
+ F:	Documentation/devicetree/bindings/sound/cirrus,lochnagar.txt
 +F:	Documentation/hwmon/lochnagar
 =20
  CISCO FCOE HBA DRIVER
  M:	Satish Kharat <satishkh@cisco.com>

--Sig_/D1nDx4sTVRp2m=0iVF2hqso
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAlyhRUoACgkQAVBC80lX
0Gz8rQf8CpV/+ep/MsLMLf+QOc78n/7VqaLtqGqYRbK1ZOx4WwsNivRo3fI/ueh6
islVMBZkrskN5KWKPd2sYpoR6D6qOBGig5v0WoI7wHslPQPlHNM5DIQsF8MASrpd
UiSczbVPKsaE+W11lFo/jtv2Ok8qzbJe9A/lJwRqEftl44rJHTEeMA79B/UTnjIS
zzjgkDV7F7bLm+MclY2ABpIKsfetGli8lbfVu7ahe4/oY6jBXCG1qnwUa0iebJYn
y7UQ8I42j4kQ3cldIrRAqhC3BLPxmrL0WPMzOpVcpuqWZnZ+Z9dR6TBSbYkYGgev
uuB+CU6HkdM7m8TCzufF/DPxuwKpyw==
=kEsC
-----END PGP SIGNATURE-----

--Sig_/D1nDx4sTVRp2m=0iVF2hqso--
