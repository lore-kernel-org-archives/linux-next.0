From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the driver-core tree with the iommu
 tree
Date: Wed, 11 Jul 2018 13:14:45 +1000
Message-ID: <20180711131445.7e1e211b@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/ZB_EV=/VOo4LV+5uIju_jPU"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Greg KH <greg@kroah.com>, Joerg Roedel <jroedel@suse.de>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Rob Herring <robh@kernel.org>, Jacopo Mondi <jacopo+renesas@jmondi.org>, Simon Horman <horms+renesas@verge.net.au>, Magnus Damm <damm+renesas@opensource.se>
List-Id: linux-next.vger.kernel.org

--Sig_/ZB_EV=/VOo4LV+5uIju_jPU
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the driver-core tree got a conflict in:

  drivers/iommu/ipmmu-vmsa.c

between commits:

  0b8ac1409641 ("iommu/ipmmu-vmsa: Hook up r8a7796 DT matching code")
  3701c123e1c1 ("iommu/ipmmu-vmsa: Hook up r8a779(70|95) DT matching code")
  98dbffd39a65 ("iommu/ipmmu-vmsa: Hook up R8A77965 DT matching code")

from the iommu tree and commit:

  ac6bbf0cdf42 ("iommu: Remove IOMMU_OF_DECLARE")

from the driver-core tree.

I fixed it up (I removed the new IOMMU_OF_DECLARE() lines) and can
carry the fix as necessary. This is now fixed as far as linux-next is
concerned, but any non trivial conflicts should be mentioned to your
upstream maintainer when your tree is submitted for merging.  You may
also want to consider cooperating with the maintainer of the
conflicting tree to minimise any particularly complex conflicts.

--=20
Cheers,
Stephen Rothwell

--Sig_/ZB_EV=/VOo4LV+5uIju_jPU
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAltFdiUACgkQAVBC80lX
0GwyGQgAgumIwKcl83UyqhQ47y1sbnT5VKpE+SMWaoYqmGtSzDmA2daouViyoBA/
8ZGxSoqGqNA28k/RUJ7AQ+NI5H+DIG1Lp2+YniSRKUDDTMSFg35IeYaQwRhloPUL
EQ+O+poHFFjVrB2kkm5zOIwN82c1t09E/8GMavPrs3Fiod5mcs9HDtOr1DZxNH0o
MygnAOvqWc+P7ygyojBWkMWlaDVi2O3xmWULiGiE5Ri2NVMwnZmtnA8/cFrCfAVP
hfTAVtj11eEomuFxTWRjWfS9hoh333G6hAuf/7oy8Xah/46t0kOTiFYkdmo3nOFo
EwbtFi4tNJ9ubJl6YMh475DsQGVfRA==
=PPHf
-----END PGP SIGNATURE-----

--Sig_/ZB_EV=/VOo4LV+5uIju_jPU--
