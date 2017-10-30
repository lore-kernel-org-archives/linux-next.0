From: Mark Brown <broonie@kernel.org>
Subject: linux-next: manual merge of the imx-mxs tree with the arm-soc tree
Date: Mon, 30 Oct 2017 11:58:11 +0000
Message-ID: <20171030115811.gh6uh5v3bod7s6wr@sirena.co.uk>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="hgafao7wijk2of6q"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
Sender: linux-kernel-owner@vger.kernel.org
To: Shawn Guo <shawn.guo@linaro.org>, rob.herring@linaro.org, arnd@arndb.de
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
List-Id: linux-next.vger.kernel.org


--hgafao7wijk2of6q
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Shawn,

Today's linux-next merge of the imx-mxs tree got a conflict in:

  arch/arm/boot/dts/imx6q-tx6q-11x0-mb7.dts
  arch/arm/boot/dts/imx53-tx53-x13x.dts
  arch/arm/boot/dts/imx6dl-tx6u-811x.dts
  arch/arm/boot/dts/imx6q-icore-rqs.dts
  arch/arm/boot/dts/imx6q-tx6q-1110.dts
  arch/arm/boot/dts/imx6q-tx6q-11x0-mb7.dts
  arch/arm/boot/dts/imx6sx.dtsi
  arch/arm/boot/dts/imx6ul.dtsi

between commit:

  8dccafaa281aa1 ("arm: dts: fix unit-address leading 0s")

=66rom the arm-soc tree and various commits from the imx-mxs tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

diff --cc arch/arm/boot/dts/imx53-tx53-x13x.dts
index be31c5d1db05,a87a10b942cf..000000000000
--- a/arch/arm/boot/dts/imx53-tx53-x13x.dts
+++ b/arch/arm/boot/dts/imx53-tx53-x13x.dts
@@@ -106,11 -121,14 +121,14 @@@
  };
 =20
  &i2c3 {
- 	pinctrl-names =3D "default";
+ 	pinctrl-names =3D "default", "gpio";
  	pinctrl-0 =3D <&pinctrl_i2c3>;
+ 	pinctrl-1 =3D <&pinctrl_i2c3_gpio>;
+ 	scl-gpios =3D <&gpio3 21 GPIO_ACTIVE_HIGH>;
+ 	sda-gpios =3D <&gpio3 28 GPIO_ACTIVE_HIGH>;
  	status =3D "okay";
 =20
 -	sgtl5000: codec@0a {
 +	sgtl5000: codec@a {
  		compatible =3D "fsl,sgtl5000";
  		reg =3D <0x0a>;
  		VDDA-supply =3D <&reg_2v5>;
diff --cc arch/arm/boot/dts/imx6dl-tx6u-811x.dts
index 94bf1c485740,5342f2f5a8a8..000000000000
--- a/arch/arm/boot/dts/imx6dl-tx6u-811x.dts
+++ b/arch/arm/boot/dts/imx6dl-tx6u-811x.dts
diff --cc arch/arm/boot/dts/imx6dl-tx6u-81xx-mb7.dts
index 839ab8619bbd,c4588fb0bf6f..000000000000
--- a/arch/arm/boot/dts/imx6dl-tx6u-81xx-mb7.dts
+++ b/arch/arm/boot/dts/imx6dl-tx6u-81xx-mb7.dts
diff --cc arch/arm/boot/dts/imx6q-icore-rqs.dts
index 745bc2886a47,b81f48c6a8c6..000000000000
--- a/arch/arm/boot/dts/imx6q-icore-rqs.dts
+++ b/arch/arm/boot/dts/imx6q-icore-rqs.dts
diff --cc arch/arm/boot/dts/imx6q-tx6q-1110.dts
index f4793dec5d9b,f7b0acb65352..000000000000
--- a/arch/arm/boot/dts/imx6q-tx6q-1110.dts
+++ b/arch/arm/boot/dts/imx6q-tx6q-1110.dts
diff --cc arch/arm/boot/dts/imx6sx.dtsi
index 32d71245b2a6,375efa3f547e..000000000000
--- a/arch/arm/boot/dts/imx6sx.dtsi
+++ b/arch/arm/boot/dts/imx6sx.dtsi
@@@ -993,13 -994,23 +994,23 @@@
  				status =3D "disabled";
  			};
 =20
 -			ocotp: ocotp@021bc000 {
 +			ocotp: ocotp@21bc000 {
+ 				#address-cells =3D <1>;
+ 				#size-cells =3D <1>;
  				compatible =3D "fsl,imx6sx-ocotp", "syscon";
  				reg =3D <0x021bc000 0x4000>;
  				clocks =3D <&clks IMX6SX_CLK_OCOTP>;
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
 -			sai1: sai@021d4000 {
 +			sai1: sai@21d4000 {
  				compatible =3D "fsl,imx6sx-sai";
  				reg =3D <0x021d4000 0x4000>;
  				interrupts =3D <GIC_SPI 97 IRQ_TYPE_LEVEL_HIGH>;
diff --cc arch/arm/boot/dts/imx6ul.dtsi
index 2057ee695a66,d5181f85ca9c..000000000000
--- a/arch/arm/boot/dts/imx6ul.dtsi
+++ b/arch/arm/boot/dts/imx6ul.dtsi

--hgafao7wijk2of6q
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAln3E9IACgkQJNaLcl1U
h9CKnQf9H6jiXE3LK6MZmLkWEKKdelRiXP1XyO0fBDW3Ez/5krJHpuaDNKSxpZg3
XxHrxyfmRnPlWJc04rGUD+KrLBrPQ4NaFD0OqXWfkr0q2M9FcLNM8IYONNkCacAw
7LCyhNtn4zm2ahbQ3bfRE6lhYpoeSj+O2gAH1HEQrTX2tKtBJpi2nnYgV9PNBzYq
pBBd2h9sT1jFyGK0AKSfW+zZaX4sHrR4cBlbswzyf7n6nVG4bO+nzNX39b8m4KAV
Yvax30yxaxVteh9aoB2sP9sl1AFg4qTUkdGfFtdxYNZdx3HnLgWBK5HLXfv+/7zK
25dhF2PTEs0aKtlZ0kjE264KwE+5cw==
=SINC
-----END PGP SIGNATURE-----

--hgafao7wijk2of6q--
