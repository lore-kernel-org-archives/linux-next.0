From: Mark Brown <broonie@kernel.org>
Subject: linux-next: manual merge of the thermal tree with the imx-mxs tree
Date: Mon, 16 Oct 2017 10:17:28 +0100
Message-ID: <20171016091728.gbtoakghi4ndyyt2@sirena.co.uk>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="fajimcv5bkp6vqgc"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from heliosphere.sirena.org.uk ([172.104.155.198]:45726 "EHLO
        heliosphere.sirena.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750914AbdJPJRq (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 16 Oct 2017 05:17:46 -0400
Content-Disposition: inline
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Zhang Rui <rui.zhang@intel.com>, Leonard Crestez <leonard.crestez@nxp.com>, Shawn Guo <shawnguo@kernel.org>, Marco Franchi <marco.franchi@nxp.com>
Cc: linux-arm-kernel@lists.infradead.org, Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>


--fajimcv5bkp6vqgc
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Zhang,

Today's linux-next merge of the thermal tree got a conflict in:

  arch/arm/boot/dts/imx6ul.dtsi

between commit:

   efb9adb274754 ("ARM: dts: imx6ul: Remove leading zeroes from unit addres=
ses")

=66rom the imx-mxs tree and commit:

   1dc31d4981dd9 ("ARM: dts: imx6ul: Add imx6ul-tempmon")

=66rom the thermal tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.  Usually DTS changes go through arm-soc to avoid
issues like this.

diff --cc arch/arm/boot/dts/imx6ul.dtsi
index 2057ee695a66,51717d54f285..000000000000
--- a/arch/arm/boot/dts/imx6ul.dtsi
+++ b/arch/arm/boot/dts/imx6ul.dtsi
@@@ -860,13 -869,23 +869,23 @@@
  				reg =3D <0x021b0000 0x4000>;
  			};
 =20
 -			ocotp: ocotp-ctrl@021bc000 {
 +			ocotp: ocotp-ctrl@21bc000 {
+ 				#address-cells =3D <1>;
+ 				#size-cells =3D <1>;
  				compatible =3D "fsl,imx6ul-ocotp", "syscon";
  				reg =3D <0x021bc000 0x4000>;
  				clocks =3D <&clks IMX6UL_CLK_OCOTP>;
+=20
+ 				tempmon_calib: calib@38 {
+ 					reg =3D <0x38 4>;
+ 				};
+=20
+ 				tempmon_temp_grade: temp-grade@20 {
+ 					reg =3D <0x20 4>;
+ 				};
  			};
 =20
 -			lcdif: lcdif@021c8000 {
 +			lcdif: lcdif@21c8000 {
  				compatible =3D "fsl,imx6ul-lcdif", "fsl,imx28-lcdif";
  				reg =3D <0x021c8000 0x4000>;
  				interrupts =3D <GIC_SPI 5 IRQ_TYPE_LEVEL_HIGH>;

--fajimcv5bkp6vqgc
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCAAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAlnkeSgACgkQJNaLcl1U
h9CTwwf/eZqJZVb/XjrTPD4d04ljGLNkL4rm4+9B+gDxbqMRHHaSxg5FtSFoUWVd
uyt98iSWDaCMWX3/yozmC9dBnf2Yb7OxrY6mTBolsnqJoF69HQUSQsCoZhfusNt7
XDCwlDU2nNF+hqrq6th+kBt+yAkGfucO2jZzuXZB7VmnWsV47TQHGB1gYleJUG2C
f2bTtrkvrzcqbHh1Cr1F/unVj/wbDDFtPpecYVOebEPfhYWJUD2jk3q+LdEmxbJG
J7D5MFhd3tzzLv+vLwDvgRqY00OepM4f2n/WoAs0yY/nxYGS+gqXw4hIG1MjhzW4
EuwfZGx+9Eo9Z+5Dn+hWMNp1b93kGw==
=fLAc
-----END PGP SIGNATURE-----

--fajimcv5bkp6vqgc--
