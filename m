From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: linux-next: manual merge of the kspp tree with the kbuild tree
Date: Thu, 16 Aug 2018 09:56:28 +1000
Message-ID: <20180816095628.686cba3a@canb.auug.org.au>
References: <20180803173020.6ec4014b@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/A=wnYojCbZVTeGc27ID+O6Z"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180803173020.6ec4014b@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Kees Cook <keescook@google.com>
Cc: Masahiro Yamada <yamada.masahiro@socionext.com>, Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Randy Dunlap <rdunlap@infradead.org>
List-Id: linux-next.vger.kernel.org

--Sig_/A=wnYojCbZVTeGc27ID+O6Z
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

On Fri, 3 Aug 2018 17:30:20 +1000 Stephen Rothwell <sfr@canb.auug.org.au> w=
rote:
>
> Today's linux-next merge of the kspp tree got a conflict in:
>=20
>   arch/Kconfig
>=20
> between commit:
>=20
>   22471e1313f2 ("kconfig: use a menu in arch/Kconfig to reduce clutter")
>=20
> from the kbuild tree and commit:
>=20
>   45332b1bdfdc ("gcc-plugins: split out Kconfig entries to scripts/gcc-pl=
ugins/Kconfig")
>=20
> from the kspp tree.
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
> diff --cc arch/Kconfig
> index 6cf1b17a8df2,43f315b84c8f..000000000000
> --- a/arch/Kconfig
> +++ b/arch/Kconfig
> @@@ -984,4 -836,4 +847,6 @@@ config REFCOUNT_FUL
>  =20
>   source "kernel/gcov/Kconfig"
>  =20
> + source "scripts/gcc-plugins/Kconfig"
> ++
>  +endmenu

This is now a conflict between Linus' tree and the kspp tree.

--=20
Cheers,
Stephen Rothwell

--Sig_/A=wnYojCbZVTeGc27ID+O6Z
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAlt0vawACgkQAVBC80lX
0Gx3IggAlbLsi8+1ZYrdn3zGhq2NR0DV1BsbfqtUiB6NrzzDSlerpUei8Toc+lDJ
+h45As2mcjQtIMsmabx/UkmFNji03FpyXJz4Flr4F7UYpueYBxThL+R3S9CyHyFt
Nylpk8Tskg/JuPyuFDepfWOKM6yX2yMI8bEZVwy68JKWZYdBZNcFJp9Ouki03rie
OSfJ4hjtsdrkw0rDoOVW3MJNCHMu7RhKOjiAsZ/ua9H4oEtIiBa6Cg9O10Crk6Fg
xa97yhtMZGJvLcsMOxcsj8AWzoNBLSbfwfKjcsyCFJoIcD+UR7ONM7meq0N1Cdeq
qhMDtG6m02posVE2DIdcfX1u+dPQzg==
=lEyr
-----END PGP SIGNATURE-----

--Sig_/A=wnYojCbZVTeGc27ID+O6Z--
