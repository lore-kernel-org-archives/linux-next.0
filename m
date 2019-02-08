From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the mfd tree with Linus' tree
Date: Fri, 8 Feb 2019 13:37:37 +1100
Message-ID: <20190208133737.7e754345@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/RYFxXftXKhJ.WhDx6NNvdM1"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Lee Jones <lee.jones@linaro.org>
Cc: Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Sinan Kaya <okaya@kernel.org>, "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>, Jarkko Nikula <jarkko.nikula@linux.intel.com>
List-Id: linux-next.vger.kernel.org

--Sig_/RYFxXftXKhJ.WhDx6NNvdM1
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the mfd tree got a conflict in:

  drivers/mfd/Kconfig

between commit:

  9baddb61dfec ("mfd: Fix unmet dependency warning for MFD_TPS68470")

from Linus' tree and commit:

  09fdc9857712 ("mfd: Kconfig: Fix I2C_DESIGNWARE_PLATFORM dependencies")

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

diff --cc drivers/mfd/Kconfig
index 76f9909cf396,f38f8741c68e..000000000000
--- a/drivers/mfd/Kconfig
+++ b/drivers/mfd/Kconfig
@@@ -1419,10 -1419,10 +1419,10 @@@ config MFD_TPS6521
 =20
  config MFD_TPS68470
  	bool "TI TPS68470 Power Management / LED chips"
 -	depends on ACPI && I2C=3Dy
 +	depends on ACPI && PCI && I2C=3Dy
+ 	depends on I2C_DESIGNWARE_PLATFORM=3Dy
  	select MFD_CORE
  	select REGMAP_I2C
- 	select I2C_DESIGNWARE_PLATFORM
  	help
  	  If you say yes here you get support for the TPS68470 series of
  	  Power Management / LED chips.

--Sig_/RYFxXftXKhJ.WhDx6NNvdM1
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAlxc63EACgkQAVBC80lX
0GwF7Qf/b0JvOMzx6xHaTPm+jt9f5xJArw/OpfqpgM2hgrNnOs3aNyF9/r0HaFCE
dVAPbcASOZG2W7zUNz26dluCTxeUBl7LSk4SrJShx7CqHJkPKul3tVVAUtMdZ1NI
GzuNgi7AxVHuMv5awzVrjx/FHb4jYjyps19mlHWcfHzTGNG/TFuQS36+yd5Uwzc4
OQpRV34ViusApRFCRtfTXplTLjbP1/+O/e79A/mJr6Q9YT3Jo0Jmn0jmLmgBFvds
1h4fBa4IkAGWlV7gS6exRi4VsaoKg1QFfoop0/E1HQ+2GfL7Y7ps+IsH9CHvAr6N
ksevTALRBPXaMoYzUVnW6Sn9vMHBlg==
=VcQB
-----END PGP SIGNATURE-----

--Sig_/RYFxXftXKhJ.WhDx6NNvdM1--
