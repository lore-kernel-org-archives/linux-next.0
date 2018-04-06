From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: linux-next: manual merge of the tty tree with the arm-soc tree
Date: Fri, 6 Apr 2018 10:38:57 +1000
Message-ID: <20180406103857.02c15ff4@canb.auug.org.au>
References: <20180315172858.7928ed93@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/pEQT=.bz1dZ_Ko8F6ch/4Vs"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180315172858.7928ed93@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Olof Johansson <olof@lixom.net>, Arnd Bergmann <arnd@arndb.de>, ARM <linux-arm-kernel@lists.infradead.org>
Cc: Greg KH <greg@kroah.com>, Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Patrice Chotard <patrice.chotard@st.com>, Rob Herring <robh@kernel.org>
List-Id: linux-next.vger.kernel.org

--Sig_/pEQT=.bz1dZ_Ko8F6ch/4Vs
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi All,

On Thu, 15 Mar 2018 17:28:58 +1100 Stephen Rothwell <sfr@canb.auug.org.au> =
wrote:
>
> Today's linux-next merge of the tty tree got conflicts in:
>=20
>   arch/arm/boot/dts/stih407-b2120.dts
>   arch/arm/boot/dts/stih410-b2120.dts
>   arch/arm/boot/dts/stih410-b2260.dts
>   arch/arm/boot/dts/stih418-b2199.dts
>=20
> between commit:
>=20
>   db5430663017 ("arm: dts: replace 'linux,stdout-path' with 'stdout-path'=
")
>=20
> from the arm-soc tree and commit:
>=20
>   dbb3fb45edff ("ARM: dts: STi: Remove "console=3DttyASN" from bootargs f=
or STi boards")
>=20
> from the tty tree.
>=20
> I fixed it up (see below) and can carry the fix as necessary. This
> is now fixed as far as linux-next is concerned, but any non trivial
> conflicts should be mentioned to your upstream maintainer when your tree
> is submitted for merging.  You may also want to consider cooperating
> with the maintainer of the conflicting tree to minimise any particularly
> complex conflicts.
>=20
> --=20
> Cheers,
> Stephen Rothwell
>=20
> diff --cc arch/arm/boot/dts/stih407-b2120.dts
> index de3c8bf129b5,a7a0f76e9cbc..000000000000
> --- a/arch/arm/boot/dts/stih407-b2120.dts
> +++ b/arch/arm/boot/dts/stih407-b2120.dts
> @@@ -14,11 -14,11 +14,11 @@@
>   	compatible =3D "st,stih407-b2120", "st,stih407";
>  =20
>   	chosen {
> - 		bootargs =3D "console=3DttyAS0,115200 clk_ignore_unused";
> + 		bootargs =3D "clk_ignore_unused";
>  -		linux,stdout-path =3D &sbc_serial0;
>  +		stdout-path =3D &sbc_serial0;
>   	};
>  =20
>  -	memory {
>  +	memory@40000000 {
>   		device_type =3D "memory";
>   		reg =3D <0x40000000 0x80000000>;
>   	};
> diff --cc arch/arm/boot/dts/stih410-b2120.dts
> index 0a59b7b0f4b2,6c6b4cc37e97..000000000000
> --- a/arch/arm/boot/dts/stih410-b2120.dts
> +++ b/arch/arm/boot/dts/stih410-b2120.dts
> @@@ -14,11 -14,11 +14,11 @@@
>   	compatible =3D "st,stih410-b2120", "st,stih410";
>  =20
>   	chosen {
> - 		bootargs =3D "console=3DttyAS0,115200 clk_ignore_unused";
> + 		bootargs =3D "clk_ignore_unused";
>  -		linux,stdout-path =3D &sbc_serial0;
>  +		stdout-path =3D &sbc_serial0;
>   	};
>  =20
>  -	memory {
>  +	memory@40000000 {
>   		device_type =3D "memory";
>   		reg =3D <0x40000000 0x80000000>;
>   	};
> diff --cc arch/arm/boot/dts/stih410-b2260.dts
> index feb8834478fa,50d36758391c..000000000000
> --- a/arch/arm/boot/dts/stih410-b2260.dts
> +++ b/arch/arm/boot/dts/stih410-b2260.dts
> @@@ -15,11 -15,11 +15,11 @@@
>   	compatible =3D "st,stih410-b2260", "st,stih410";
>  =20
>   	chosen {
> - 		bootargs =3D "console=3DttyAS1,115200 clk_ignore_unused";
> + 		bootargs =3D "clk_ignore_unused";
>  -		linux,stdout-path =3D &uart1;
>  +		stdout-path =3D &uart1;
>   	};
>  =20
>  -	memory {
>  +	memory@40000000 {
>   		device_type =3D "memory";
>   		reg =3D <0x40000000 0x40000000>;
>   	};
> diff --cc arch/arm/boot/dts/stih418-b2199.dts
> index 39b4db2e3507,7f5f3252bfc7..000000000000
> --- a/arch/arm/boot/dts/stih418-b2199.dts
> +++ b/arch/arm/boot/dts/stih418-b2199.dts
> @@@ -14,11 -14,11 +14,11 @@@
>   	compatible =3D "st,stih418-b2199", "st,stih418";
>  =20
>   	chosen {
> - 		bootargs =3D "console=3DttyAS0,115200 clk_ignore_unused";
> + 		bootargs =3D "clk_ignore_unused";
>  -		linux,stdout-path =3D &sbc_serial0;
>  +		stdout-path =3D &sbc_serial0;
>   	};
>  =20
>  -	memory {
>  +	memory@40000000 {
>   		device_type =3D "memory";
>   		reg =3D <0x40000000 0xc0000000>;
>   	};

These are now conflicts between the arm-soc tree and Linus' tree.

--=20
Cheers,
Stephen Rothwell

--Sig_/pEQT=.bz1dZ_Ko8F6ch/4Vs
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAlrGwaEACgkQAVBC80lX
0GwoiAf+ISjuR9YMTwQ/CAwXl93St7eITUDdpyGhdiguuZgW5YU4pz5wQ7b4YvJ7
puRUpTm/2D/3CNJY6k56TN5z+AJYJH6pfLiJ9TIBJGprJibK3iA03gTFiJTEuCi4
L10r16USA3S8y5LgWtZ3ysnn0J0dPLrE+43LJm4pF6C1YmzLyWx3iNCFLJdxpmKa
gk640DqL3AaNg+0lAPK5kqx9fV4oucVvpD3tZEXz0QkMQnd/FxzStt61q/x9EUNH
pfXMk0DYMT3egWjxQwuW1PG6zIJ5nkUjBSqz+ls/7ZniryE7UzbD330er7W6gepk
zmtPTZqni0jDhIaewEfguBjYjX2XzA==
=6MAp
-----END PGP SIGNATURE-----

--Sig_/pEQT=.bz1dZ_Ko8F6ch/4Vs--
