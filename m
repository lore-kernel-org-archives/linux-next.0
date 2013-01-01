From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the driver-core.current tree with Linus
 tree
Date: Wed, 2 Jan 2013 10:37:26 +1100
Message-ID: <20130102103726.edc15af3340bb990991ed0c1@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA256";
 boundary="Signature=_Wed__2_Jan_2013_10_37_26_+1100_viJN9a=_1zFiWlYm"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Greg KH <greg@kroah.com>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Bill Pemberton <wfp5p@virginia.edu>, Wolfram Sang <w.sang@pengutronix.de>
List-Id: linux-next.vger.kernel.org

--Signature=_Wed__2_Jan_2013_10_37_26_+1100_viJN9a=_1zFiWlYm
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Greg,

Today's linux-next merge of the driver-core.current tree got a conflict
in drivers/i2c/busses/i2c-au1550.c between commit 0b255e927d47 ("i2c:
remove __dev* attributes from subsystem") from Linus' tree and commit
eeb30d064414 ("Drivers: i2c: remove __dev* attributes") from the
driver-core.current tree.

I fixed it up (I used the driver-core.current version) and can carry the
fix as necessary (no action is required).

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au

--Signature=_Wed__2_Jan_2013_10_37_26_+1100_viJN9a=_1zFiWlYm
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAEBCAAGBQJQ43M2AAoJEECxmPOUX5FEJukP/2gvcMwKZhCpzNcKAiADE9TU
nkhXq/bJ6Zgf5PUFJr2+S/l9CI/F879Amd3qmN64cS1JpDV7y16VXfftpvIawHOA
Twro+xV61fUxqOBks03DRaTVtqDLKSZUNN7wpwhvZQjMaDXsmZ6CAo765Btjx38C
ZjHN9APVtAKMJrYbDwd18eJm0dJF5GtVTNcS3HR8C9soI+NMt6U7qx9hmDwBsdyK
oG/dIK5F4P+gsqE8r+b3N3s5SHakglf1hjDx5o9gNzMW3r9nFuaaocq2Or8aDzvW
E+mH9ieN08OrmjbEZMBAtfRGcVwW9dI1HZQuQ4McgyL1UOKZOIXsTzvfuZxVyhxo
QHTFg+wexYBVmEWcXFreq3lEnYTymCZF4bOCNkgkmYAWbhY7OJyS5/7NvJzX2FLS
qv3QcNIclzoO/cF09BOPjlmrNpoguNt+zEkbVqLqkM9l6UFZoUuKTIQQtwCzSAnc
kE3Nble/OyZugQrV3/SVBV3Kpc1LYuC/3aMAan/qMRPwWriagexb2C4KPLhPWSi6
pU9griN+uIOBFrheVQqZoxDkrsI8WfL7B4P5URhrtPKdisIYI9lv/oYN2y7IBYsR
1toXQtPRNBNVkWRiqFSIIyvD5pLXZT2UDIa11Pr5oO99hzmug4LILjJOLZMG/IM1
A/dsD10goNyRbP/IwuuK
=bLie
-----END PGP SIGNATURE-----

--Signature=_Wed__2_Jan_2013_10_37_26_+1100_viJN9a=_1zFiWlYm--
