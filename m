From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the imx-mxs tree with the arm-soc tree
Date: Tue, 13 Jan 2015 11:16:36 +1100
Message-ID: <20150113111636.7bc5785c@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/JTIG4GBsZouOYHG=NB1Bity"; protocol="application/pgp-signature"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:34808 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751190AbbAMAQp (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Mon, 12 Jan 2015 19:16:45 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Shawn Guo <shawn.guo@linaro.org>, Olof Johansson <olof@lixom.net>, Arnd Bergmann <arnd@arndb.de>, linux-arm-kernel@lists.infradead.org
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Anson Huang <b20788@freescale.com>, Peter Robinson <pbrobinson@gmail.com>

--Sig_/JTIG4GBsZouOYHG=NB1Bity
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Shawn,

Today's linux-next merge of the imx-mxs tree got a conflict in
arch/arm/boot/dts/Makefile between commit 6f1650f15bc4 ("ARM: dts: Only
build dtb if associated Arch and/or SoC is enabled") from the arm-soc
tree and commit 99fc5ba0bfb6 ("ARM: dts: imx6sx: add i.mx6sx sabreauto
board support") from the imx-mxs tree.

I fixed it up (I think - see below) and can carry the fix as necessary
(no action is required).

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au

diff --cc arch/arm/boot/dts/Makefile
index 1c1cefc434a2,1236b8c0eb60..000000000000
--- a/arch/arm/boot/dts/Makefile
+++ b/arch/arm/boot/dts/Makefile
@@@ -295,15 -265,12 +296,16 @@@ dtb-$(CONFIG_SOC_IMX6Q) +=3D=20
  	imx6q-tx6q-1010-comtft.dtb \
  	imx6q-tx6q-1020.dtb \
  	imx6q-tx6q-1020-comtft.dtb \
 -	imx6q-tx6q-1110.dtb \
 -	imx6sl-evk.dtb \
 +	imx6q-tx6q-1110.dtb
 +dtb-$(CONFIG_SOC_IMX6SL) +=3D \
 +	imx6sl-evk.dtb
 +dtb-$(CONFIG_SOC_IMX6SX) +=3D \
+ 	imx6sx-sabreauto.dtb \
  	imx6sx-sdb.dtb \
 +dtb-$(CONFIG_SOC_LS1021A) +=3D \
  	ls1021a-qds.dtb \
 -	ls1021a-twr.dtb \
 +	ls1021a-twr.dtb
 +dtb-$(CONFIG_SOC_VF610) +=3D \
  	vf500-colibri-eval-v3.dtb \
  	vf610-colibri-eval-v3.dtb \
  	vf610-cosmic.dtb \

--Sig_/JTIG4GBsZouOYHG=NB1Bity
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJUtGPqAAoJEMDTa8Ir7ZwV92UQAIkZRnn9Zp1Cjv67UtbTVazN
UpgCa5DZAJmhebzGPcbk9B5srEyvZyIWb0tWHrYluSyJ31BdJDP1amwXDKybcsB8
SDj7klShw/Q5k+zQFsQ6sPvgdOtxwu3B+OvRULznXh9Fl8nmxZIIH3aRo33D1hz2
05A4sQzTX+MXyGZmukbgkCdWTe++mYDjm7beH5lKe98F4vSpJxSSU3wIy1UR3LU9
M1o9U71plJWuv/uS5BeKDvBSsrpnfROActb34oHG+ttiN75zzsW7eh3u0sb48fxN
gfFhrZYbqoLcA25dEfjmAV19yOFDXdTAgMRHnYIXXByMx+vyDEtP0OpdwVrF2yd7
dOhXKT6aPxHeCB3EUJv4dYn482m8BCNxE6lIoMKUI1Bo1mYRtP3/0zrPJ3Peq8g8
qbdx1WK9Ry2DCVhTBw2YRkJBuJ+tPreB310J3Dnmjw3/jZycJ4c6D7EkZ8Dg4ZHb
kpYYkWbmNPoOc67xZvVFjt7ApCdocr4l3vCRORjATVrIxnAmuRVL7Cgd4JGRHxdS
SXF5BsbC4uIancmSB6sWvG53u1poAl2CdNJ1757yhZrwjYFUu320yppsSaKvBDnP
4AxQ9QCF+2qzfNpiU9Be6tWHG/xVfW2QZElt+mZEmQwy/gJPHQpkWxT6oRRQMu/u
vhh+9eu3dXsWe7dUny3+
=ZtCk
-----END PGP SIGNATURE-----

--Sig_/JTIG4GBsZouOYHG=NB1Bity--
