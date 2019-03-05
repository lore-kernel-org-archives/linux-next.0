From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: linux-next: manual merge of the regulator tree with the arm-soc
 tree
Date: Wed, 6 Mar 2019 09:27:14 +1100
Message-ID: <20190306092714.23cf72d6@canb.auug.org.au>
References: <20190218125627.003fc22c@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/zyDoips50+zG4pgA22y7AE4"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190218125627.003fc22c@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Olof Johansson <olof@lixom.net>, Arnd Bergmann <arnd@arndb.de>, ARM <linux-arm-kernel@lists.infradead.org>
Cc: Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>, Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Daniel Mack <daniel@zonque.org>, Robert Jarzmik <robert.jarzmik@free.fr>, Linus Walleij <linus.walleij@linaro.org>
List-Id: linux-next.vger.kernel.org

--Sig_/zyDoips50+zG4pgA22y7AE4
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

On Mon, 18 Feb 2019 12:56:27 +1100 Stephen Rothwell <sfr@canb.auug.org.au> =
wrote:
>
> Today's linux-next merge of the regulator tree got a conflict in:
>=20
>   arch/arm/mach-pxa/raumfeld.c
>=20
> between commit:
>=20
>   0f884f8a090e ("ARM: pxa: remove raumfeld board files and defconfig")
>=20
> from the arm-soc tree and commit:
>=20
>   01dc79cd6fe7 ("regulator: fixed/gpio: Pull inversion/OD into gpiolib")
>=20
> from the regulator tree.
>=20
> I fixed it up (the former removed the file, so I did that) and can
> carry the fix as necessary. This is now fixed as far as linux-next is
> concerned, but any non trivial conflicts should be mentioned to your
> upstream maintainer when your tree is submitted for merging.  You may
> also want to consider cooperating with the maintainer of the conflicting
> tree to minimise any particularly complex conflicts.

This is now a conflict between Linus' tree and the arm-soc tree.

--=20
Cheers,
Stephen Rothwell

--Sig_/zyDoips50+zG4pgA22y7AE4
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAlx+98IACgkQAVBC80lX
0GwSHQf/en4eIkxCGL1kDVBrGK2ANdvzi4G9duJ7LfI8yznBHU0Q6ts91DjdM/gO
UwXwaWgcWpVYZo8o3V3tX6ByZCgJOho8h5MdY+mgRHsiOKjibWy0kXFj37gcKFM8
9JJ52uVe9KstcpvPJF+9aETJBJrkfsOu5fv2yXZfgc6k0fHUfmWfph1coaSKWctD
LczcOqGiTYCXyNw3so082ndI0qnOs4eM9cJ6EwZ8suEPNtTtJe7CeK34cmUGc3o0
uRJRPJ6x5UOgkPmM/2lx7caqI8UTzoVi7bWyN05AyxTRfFWYPhYHk5i5w3w/hbh3
Xb8SasdRsz0LL745TA99USUPgyv2dg==
=TFaY
-----END PGP SIGNATURE-----

--Sig_/zyDoips50+zG4pgA22y7AE4--
