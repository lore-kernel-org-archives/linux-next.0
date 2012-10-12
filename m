From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the pinctrl tree with Linus' tree
Date: Fri, 12 Oct 2012 13:56:38 +1100
Message-ID: <20121012135638.e42f668a360bddee7a54dea8@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA256";
 boundary="Signature=_Fri__12_Oct_2012_13_56_38_+1100_RZ=qqPf+C3GkC6W."
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Ludovic Desroches <ludovic.desroches@atmel.com>, Wolfram Sang <w.sang@pengutronix.de>, Jean-Christophe PLAGNIOL-VILLARD <plagnioj@jcrosoft.com>, Nicolas Ferre <nicolas.ferre@atmel.com>
List-Id: linux-next.vger.kernel.org

--Signature=_Fri__12_Oct_2012_13_56_38_+1100_RZ=qqPf+C3GkC6W.
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Linus,

Today's linux-next merge of the pinctrl tree got a conflict in
arch/arm/boot/dts/at91sam9g25ek.dts between commit fbc1871511ed ("ARM:
dts: add twi nodes for atmel boards") from Linus' tree and commit
77ccddbdc0c9 ("arm: at91: dt: at91sam9 add serial pinctrl support") from
the pinctrl tree.

I fixed it up (see below) and can carry the fix as necessary (no action
is required).

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au

diff --cc arch/arm/boot/dts/at91sam9g25ek.dts
index 877c08f,c5ab16f..0000000
--- a/arch/arm/boot/dts/at91sam9g25ek.dts
+++ b/arch/arm/boot/dts/at91sam9g25ek.dts
@@@ -13,49 -13,4 +13,20 @@@
  / {
  	model =3D "Atmel AT91SAM9G25-EK";
  	compatible =3D "atmel,at91sam9g25ek", "atmel,at91sam9x5ek", "atmel,at91s=
am9x5", "atmel,at91sam9";
 +
- 	chosen {
- 		bootargs =3D "console=3DttyS0,115200 root=3D/dev/mtdblock1 rw rootfstyp=
e=3Dubifs ubi.mtd=3D1 root=3Dubi0:rootfs";
- 	};
-=20
 +	ahb {
 +		apb {
- 			dbgu: serial@fffff200 {
- 				status =3D "okay";
- 			};
-=20
- 			usart0: serial@f801c000 {
- 				status =3D "okay";
- 			};
-=20
- 			macb0: ethernet@f802c000 {
- 				phy-mode =3D "rmii";
- 				status =3D "okay";
- 			};
-=20
 +			i2c0: i2c@f8010000 {
 +				status =3D "okay";
 +			};
 +
 +			i2c1: i2c@f8014000 {
 +				status =3D "okay";
 +			};
 +
 +			i2c2: i2c@f8018000 {
 +				status =3D "okay";
 +			};
 +		};
-=20
- 		usb0: ohci@00600000 {
- 			status =3D "okay";
- 			num-ports =3D <2>;
- 			atmel,vbus-gpio =3D <&pioD 19 1
- 					   &pioD 20 1
- 					  >;
- 		};
-=20
- 		usb1: ehci@00700000 {
- 			status =3D "okay";
- 		};
 +	};
  };

--Signature=_Fri__12_Oct_2012_13_56_38_+1100_RZ=qqPf+C3GkC6W.
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAEBCAAGBQJQd4bmAAoJEECxmPOUX5FERl8P/31OW/AtKCL008JqhncAJlyk
R+H3IJeXKpfxqBxetR2ZSFSqt0w6We4Sqv9YaHwTGZa4YO6iplMoFoqH3eyToQx0
GcZ3SDPHztuOrxaVlPDj90W+VtSW8A3T/vjlwO9+z7VUDLJuUxosP0E8p+R1kf+Y
A7gzs6uBBzPBirrrU1U8e14HyukpyHVtKc0L62sV6RpBmDSiL9E3URR37mWkK+6+
u4MVfaMHAk/2tDMxUU/DmHXmpBHQxayPrinDiZ4wwqmJXUEfC2c401XRw/Ntbh6G
WKT/KTJYUUFrh64oIrxjEAm0YDVHgTXxCRGLZE3uMtIov5R5kKuexkATQ9Lfk40q
o+J2bHXavZSktTeuu4PmZjnM8LMVxPuu/fScByRK1mLcE0dzYTeYDt/K06XLQQ/A
i2D9VH/g/9otOK5fc0KC9yjIVo7P7fEbPulpS/7bkxCpYm+y9/OCJIbDrBmFtGtT
v/BlfhpryP/H46J50Ff1GMv2Mgl+9X5gLrgFiIHEB7V9PIOFkMcX2raWkiOFUd3Y
46UkYJcaQyNNaBexbVZaIiu6zbl8j7pszd3WFY/gzWwKjBdl/Gd4uuc9G8EVSjzh
k8VrleeV+5o3wEvsgvxqD0C9T1Zv7zDBpKGeMIdYTDCkcjTyU8aGpG+/bEIxX3au
7ux+r70O1KxxCyL3cMDD
=/V5S
-----END PGP SIGNATURE-----

--Signature=_Fri__12_Oct_2012_13_56_38_+1100_RZ=qqPf+C3GkC6W.--
