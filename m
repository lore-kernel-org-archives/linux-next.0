From: Miquel Raynal <miquel.raynal@bootlin.com>
Subject: Re: linux-next: build warning after merge of the nand tree
Date: Wed, 3 Apr 2019 09:49:47 +0200
Message-ID: <20190403094947.1d9be502@xps13>
References: <20190403102239.174fbe35@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 boundary="Sig_/qsqmeb635Ca4Dp/b1OU2MMw"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190403102239.174fbe35@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Boris Brezillon <boris.brezillon@collabora.com>, Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Paul Cercueil <paul@crapouillou.net>
List-Id: linux-next.vger.kernel.org

--Sig_/qsqmeb635Ca4Dp/b1OU2MMw
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Hi Stephen,

Stephen Rothwell <sfr@canb.auug.org.au> wrote on Wed, 3 Apr 2019
10:22:39 +1100:

> Hi all,
>=20
> After merging the nand tree, today's linux-next build (x86_64
> allmodconfig) produced this warning:
>=20
> drivers/mtd/nand/raw/ingenic/jz4725b_bch.c: In function 'jz4725b_bch_read=
_parity':
> drivers/mtd/nand/raw/ingenic/jz4725b_bch.c:147:12: warning: this statemen=
t may fall through [-Wimplicit-fallthrough=3D]
>    dest8[2] =3D (val >> 16) & 0xff;
>    ~~~~~~~~~^~~~~~~~~~~~~~~~~~~~
> drivers/mtd/nand/raw/ingenic/jz4725b_bch.c:148:2: note: here
>   case 2: /* fall-through */
>   ^~~~
> drivers/mtd/nand/raw/ingenic/jz4725b_bch.c:149:12: warning: this statemen=
t may fall through [-Wimplicit-fallthrough=3D]
>    dest8[1] =3D (val >> 8) & 0xff;
>    ~~~~~~~~~^~~~~~~~~~~~~~~~~~~
> drivers/mtd/nand/raw/ingenic/jz4725b_bch.c:150:2: note: here
>   case 1: /* fall-through */
>   ^~~~
>=20
> Introduced by commit
>=20
>   acb29396f956 ("mtd: rawnand: ingenic: Add support for the JZ4725B")
>=20
> I get this warning because I am building with -Wimplicit-fallthrough
> in attempt to catch new additions early.  The gcc warning can be turned
> off by adding a /* fall through */ comment at the point the fall through
> happens (i.e. before the next case label).
>=20

Thanks for the warnings, I moved the fall-through comments so the
warnings are gone.

I also added -Wextra in my "mtd-builds" setup to catch these earlier.


Thanks,
Miqu=C3=A8l

--Sig_/qsqmeb635Ca4Dp/b1OU2MMw
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCgAdFiEE9HuaYnbmDhq/XIDIJWrqGEe9VoQFAlykZZsACgkQJWrqGEe9
VoTvvAf/Uq/tS1GdWpDRK0XyZf+vq8o1M/iNbQjxAFvQ5ngX0S2jyYtOi/XEePtr
P8eIDADsSC23QHUqk7JoAx0fyyVKVs/MkmHiRhwN+0ILaEUIzcNuNsO8GN391WYB
ucm2WlP0v7EmeWim1sC6Apk18avv4ezXdHozFLe+P52POFpdR99lYqteNMODMSCZ
zppF+sbbfK0LmHh88ivWpkJKfV8Lrofo2V2BcXJaAEOYna2CRNeasRurHx1wc2/1
YdQRd0SRYWwxReXThYh4xWPZsMqcj6EdkmX+TKecK/s/BfxrykbCBbTNra172xvz
YHa/Yjdt+oLkORzguxyno31pc466kA==
=LNeA
-----END PGP SIGNATURE-----

--Sig_/qsqmeb635Ca4Dp/b1OU2MMw--
