From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the tty tree with the arm-soc tree
Date: Thu, 15 Mar 2018 17:28:58 +1100
Message-ID: <20180315172858.7928ed93@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/4ha+r0qvfPKGPW1D4+qMNM."; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Greg KH <greg@kroah.com>, Olof Johansson <olof@lixom.net>, Arnd Bergmann <arnd@arndb.de>, ARM <linux-arm-kernel@lists.infradead.org>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Patrice Chotard <patrice.chotard@st.com>, Rob Herring <robh@kernel.org>
List-Id: linux-next.vger.kernel.org

--Sig_/4ha+r0qvfPKGPW1D4+qMNM.
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Greg,

Today's linux-next merge of the tty tree got conflicts in:

  arch/arm/boot/dts/stih407-b2120.dts
  arch/arm/boot/dts/stih410-b2120.dts
  arch/arm/boot/dts/stih410-b2260.dts
  arch/arm/boot/dts/stih418-b2199.dts

between commit:

  db5430663017 ("arm: dts: replace 'linux,stdout-path' with 'stdout-path'")

from the arm-soc tree and commit:

  dbb3fb45edff ("ARM: dts: STi: Remove "console=3DttyASN" from bootargs for=
 STi boards")

from the tty tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

--=20
Cheers,
Stephen Rothwell

diff --cc arch/arm/boot/dts/stih407-b2120.dts
index de3c8bf129b5,a7a0f76e9cbc..000000000000
--- a/arch/arm/boot/dts/stih407-b2120.dts
+++ b/arch/arm/boot/dts/stih407-b2120.dts
@@@ -14,11 -14,11 +14,11 @@@
  	compatible =3D "st,stih407-b2120", "st,stih407";
 =20
  	chosen {
- 		bootargs =3D "console=3DttyAS0,115200 clk_ignore_unused";
+ 		bootargs =3D "clk_ignore_unused";
 -		linux,stdout-path =3D &sbc_serial0;
 +		stdout-path =3D &sbc_serial0;
  	};
 =20
 -	memory {
 +	memory@40000000 {
  		device_type =3D "memory";
  		reg =3D <0x40000000 0x80000000>;
  	};
diff --cc arch/arm/boot/dts/stih410-b2120.dts
index 0a59b7b0f4b2,6c6b4cc37e97..000000000000
--- a/arch/arm/boot/dts/stih410-b2120.dts
+++ b/arch/arm/boot/dts/stih410-b2120.dts
@@@ -14,11 -14,11 +14,11 @@@
  	compatible =3D "st,stih410-b2120", "st,stih410";
 =20
  	chosen {
- 		bootargs =3D "console=3DttyAS0,115200 clk_ignore_unused";
+ 		bootargs =3D "clk_ignore_unused";
 -		linux,stdout-path =3D &sbc_serial0;
 +		stdout-path =3D &sbc_serial0;
  	};
 =20
 -	memory {
 +	memory@40000000 {
  		device_type =3D "memory";
  		reg =3D <0x40000000 0x80000000>;
  	};
diff --cc arch/arm/boot/dts/stih410-b2260.dts
index feb8834478fa,50d36758391c..000000000000
--- a/arch/arm/boot/dts/stih410-b2260.dts
+++ b/arch/arm/boot/dts/stih410-b2260.dts
@@@ -15,11 -15,11 +15,11 @@@
  	compatible =3D "st,stih410-b2260", "st,stih410";
 =20
  	chosen {
- 		bootargs =3D "console=3DttyAS1,115200 clk_ignore_unused";
+ 		bootargs =3D "clk_ignore_unused";
 -		linux,stdout-path =3D &uart1;
 +		stdout-path =3D &uart1;
  	};
 =20
 -	memory {
 +	memory@40000000 {
  		device_type =3D "memory";
  		reg =3D <0x40000000 0x40000000>;
  	};
diff --cc arch/arm/boot/dts/stih418-b2199.dts
index 39b4db2e3507,7f5f3252bfc7..000000000000
--- a/arch/arm/boot/dts/stih418-b2199.dts
+++ b/arch/arm/boot/dts/stih418-b2199.dts
@@@ -14,11 -14,11 +14,11 @@@
  	compatible =3D "st,stih418-b2199", "st,stih418";
 =20
  	chosen {
- 		bootargs =3D "console=3DttyAS0,115200 clk_ignore_unused";
+ 		bootargs =3D "clk_ignore_unused";
 -		linux,stdout-path =3D &sbc_serial0;
 +		stdout-path =3D &sbc_serial0;
  	};
 =20
 -	memory {
 +	memory@40000000 {
  		device_type =3D "memory";
  		reg =3D <0x40000000 0xc0000000>;
  	};

--Sig_/4ha+r0qvfPKGPW1D4+qMNM.
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAlqqEqoACgkQAVBC80lX
0GzXvwf/T1hgz4WxTULRxPjm33O5iSXCnTGteV5a2YWbJy4xlzcB+6FOhyKYz0r2
ibpc+lETcxYrS2oOXHSYQxo/jXY1hME7L1BQ/GKlCLWNkrEqslKNnKY1iI9YfPvc
3Mm4T9qNFKq1blv7fdnKZkLELRCII60ehZEAy0BpHGMmkb3VeG3bGQj0Uu4SwKZK
u66r7+XH804AwVwGJR/Zr/mfyaVD5jERLSsEKL7B74CfJ8xRDNWXBva7gh9roQAS
bkXQGM0+lsrLF63Yx8KbOLR4YKKXf20sGer61/pMjzTAkE+CvgkamL79YCmYmviz
Xtgx4T571eAD7TLW65PIXS83YLhixw==
=SQkC
-----END PGP SIGNATURE-----

--Sig_/4ha+r0qvfPKGPW1D4+qMNM.--
