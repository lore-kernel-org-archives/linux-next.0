From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: linux-next: manual merge of the input tree with the arm-soc
 tree
Date: Mon, 13 May 2019 09:28:06 +1000
Message-ID: <20190513092756.0eb03c72@canb.auug.org.au>
References: <20190501134054.4271616e@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/1Ut8vlM/tSGq=IsIjYTN6gG"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190501134054.4271616e@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Olof Johansson <olof@lixom.net>, Arnd Bergmann <arnd@arndb.de>, ARM <linux-arm-kernel@lists.infradead.org>
Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>, Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, =?UTF-8?B?Q2zDqW1lbnQgUMOpcm9u?= <peron.clem@gmail.com>, Maxime Ripard <maxime.ripard@bootlin.com>, Jeff LaBundy <jeff@labundy.com>
List-Id: linux-next.vger.kernel.org

--Sig_/1Ut8vlM/tSGq=IsIjYTN6gG
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

On Wed, 1 May 2019 13:40:54 +1000 Stephen Rothwell <sfr@canb.auug.org.au> w=
rote:
>
> Today's linux-next merge of the input tree got a conflict in:
>=20
>   Documentation/devicetree/bindings/vendor-prefixes.txt
>=20
> between commit:
>=20
>   2c98d9e47533 ("dt-bindings: vendor-prefixes: add AZW")
>=20
> from the arm-soc tree and commit:
>=20
>   7b5bb55d0dad ("Input: add support for Azoteq IQS550/572/525")
>=20
> from the input tree.
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
> diff --cc Documentation/devicetree/bindings/vendor-prefixes.txt
> index 5f2b185a04e6,51f99549161e..000000000000
> --- a/Documentation/devicetree/bindings/vendor-prefixes.txt
> +++ b/Documentation/devicetree/bindings/vendor-prefixes.txt
> @@@ -54,7 -53,7 +54,8 @@@ avic	Shanghai AVIC Optoelectronics Co.
>   avnet	Avnet, Inc.
>   axentia	Axentia Technologies AB
>   axis	Axis Communications AB
> + azoteq	Azoteq (Pty) Ltd
>  +azw     Shenzhen AZW Technology Co., Ltd.
>   bananapi BIPAI KEJI LIMITED
>   bhf	Beckhoff Automation GmbH & Co. KG
>   bitmain	Bitmain Technologies

Thie is now a conflict between the arm-soc tree and Linus' tree.

--=20
Cheers,
Stephen Rothwell

--Sig_/1Ut8vlM/tSGq=IsIjYTN6gG
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAlzYrAYACgkQAVBC80lX
0GxLUgf/TPvpX9Qyf51e5o+3yuVhTPB/uirCiqJYU1bRIO1fKDPYvNJR9p0jvYQk
UKK0tj7AbhRaAsHumme0mXwU5fc5QYX0/XpQrtL/CVHxk7ua1FmtFIwDcI3bFY48
Tub91jqGMQSJtg8KdPHC5vs/B/6xf/YmLO6PBItiaQtiktN2ZAI3B4erVt4lij55
+/Yx3J5Qg735hUCpAM1FaK3swlHGCIOgl9c20xHlu75u59osFIpEAqeaD1tCHrqi
9sPGAFX8y/VtDfbPtVt1PS6TXLAttDWimk+MbntOJ7EctgbVcVZ1Ayf4A6nIZ7ou
RzsPGMCTB930djEoKWqmEKMVRs4J1g==
=JkKI
-----END PGP SIGNATURE-----

--Sig_/1Ut8vlM/tSGq=IsIjYTN6gG--
