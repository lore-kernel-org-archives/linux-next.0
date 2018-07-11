From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the scsi-mkp tree with Linus' tree
Date: Wed, 11 Jul 2018 14:04:57 +1000
Message-ID: <20180711140457.5c366429@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/1eZtUXTwsZ5Tl_Ex05JZRCm"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: "Martin K. Petersen" <martin.petersen@oracle.com>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Johannes Thumshirn <jthumshirn@suse.de>, Joel Stanley <joel@jms.id.au>, "David S. Miller" <davem@davemloft.net>
List-Id: linux-next.vger.kernel.org

--Sig_/1eZtUXTwsZ5Tl_Ex05JZRCm
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the scsi-mkp tree got a conflict in:

  MAINTAINERS

between commit:

  54e45716a84a ("scsi: remove NCR_D700 driver")

from Linus' tree and commit:

  01a21986f8ed ("MAINTAINERS: Add Sam as the maintainer for NCSI")

from the scsi-mkp tree.

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
index e5f8823b5f02,f3de5d37179a..000000000000
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@@ -9810,17 -9750,6 +9810,11 @@@ F:	drivers/scsi/mac_scsi.
  F:	drivers/scsi/sun3_scsi.*
  F:	drivers/scsi/sun3_scsi_vme.c
 =20
- NCR DUAL 700 SCSI DRIVER (MICROCHANNEL)
- M:	"James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>
- L:	linux-scsi@vger.kernel.org
- S:	Maintained
- F:	drivers/scsi/NCR_D700.*
-=20
 +NCSI LIBRARY:
 +M:	Samuel Mendoza-Jonas <sam@mendozajonas.com>
 +S:	Maintained
 +F:	net/ncsi/
 +
  NCT6775 HARDWARE MONITOR DRIVER
  M:	Guenter Roeck <linux@roeck-us.net>
  L:	linux-hwmon@vger.kernel.org

--Sig_/1eZtUXTwsZ5Tl_Ex05JZRCm
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAltFgekACgkQAVBC80lX
0GyLxgf/ZbdUKiln2In+FEmGRANJnGOnmXddqKfU4UAuekTRCCgtzdRrmya9Z8MC
s6yBnGM35QN0Hj34xv7aUVs2vfuHP61wEXu31CT+XLYt0TlPBkdr5Nlhe2IYnxak
8X5fuKhlSHSPoEC3X3Eo0US+Z/vMKDcdZfELtITOUpP7+sSEJAE70QDyzjHd6LCg
AK5AsYQ4epmsu9yNg3kCwbBVWAV1EU110cs0dbi+g6Sk6Unhv/Cu+RkTXk2ewz74
sbJf72QmesQ7OASwUtxo6hf+yKv/McP2A4AfISyfL8QRrolOD+ZiTwE2yOpvrZCz
2qj/DtnPiLNFU5gGtsdo9/zKxvZDSQ==
=l96p
-----END PGP SIGNATURE-----

--Sig_/1eZtUXTwsZ5Tl_Ex05JZRCm--
