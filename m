From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the drivers-x86 tree with the watchdog
 tree
Date: Mon, 4 Mar 2019 14:37:35 +1100
Message-ID: <20190304143735.308edd1e@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/22xVno_WMun1/gOIgWBEiZn"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy.shevchenko@gmail.com>, Wim Van Sebroeck <wim@iguana.be>
Cc: Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Michael Shych <michaelsh@mellanox.com>, Vadim Pasternak <vadimp@mellanox.com>
List-Id: linux-next.vger.kernel.org

--Sig_/22xVno_WMun1/gOIgWBEiZn
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the drivers-x86 tree got a conflict in:

  include/linux/platform_data/mlxreg.h

between commit:

  9f03161a1bd8 ("platform_data/mlxreg: additions for Mellanox watchdog driv=
er.")

from the watchdog tree and commit:

  9b28aa1d0eae ("platform_data/mlxreg: Document fixes for core platform dat=
a")

from the drivers-x86 tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

--=20
Cheers,
Stephen Rothwell

diff --cc include/linux/platform_data/mlxreg.h
index 31f7c25a44da,1b2f86f96743..000000000000
--- a/include/linux/platform_data/mlxreg.h
+++ b/include/linux/platform_data/mlxreg.h
@@@ -120,12 -109,9 +122,12 @@@ struct mlxreg_core_item=20
  /**
   * struct mlxreg_core_platform_data - platform data:
   *
-  * @led_data: led private data;
+  * @data: instance private data;
   * @regmap: register map of parent device;
-  * @counter: number of led instances;
+  * @counter: number of instances;
 + * @features: supported features of device;
 + * @version: implementation version;
 + * @identity: device identity name;
   */
  struct mlxreg_core_platform_data {
  	struct mlxreg_core_data *data;

--Sig_/22xVno_WMun1/gOIgWBEiZn
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAlx8nX8ACgkQAVBC80lX
0Gxv8wf/eZZGiNqsMFy4QgB0xzyZ0zDoLXsi7rJHrpTTJwTn94QopWOaWWUxvXel
/8IJhwyMrX3fs2561HhzAbhuFw/fdnz02zFsN4TATz23tKZeIMLqWLArEMWyxe3B
KPS0VPdy2NDB8sWtf0hfhROWCXYcrbj/7bMXZlMNl/uB/AOYWFTCTqGDjfCngj4Y
2EKO4gAeeR9BSQHKV6/2GchRf/LmB+KpGEZqO1d2dxeQVIRT/pN3Tmd2OBiEHMwg
OQKtVsIPUnPLIQCA3SyzA2msa5UFOksFK498+eytcN/8Kju7DHoeGJPnhV6jh/74
BytgW6gYJbcpPBVXgfUgAb+weW8ALg==
=C2Cp
-----END PGP SIGNATURE-----

--Sig_/22xVno_WMun1/gOIgWBEiZn--
