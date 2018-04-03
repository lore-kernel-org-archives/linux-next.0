From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: linux-next: manual merge of the asm-generic tree with the
 kbuild tree
Date: Wed, 4 Apr 2018 09:07:35 +1000
Message-ID: <20180404090735.2c8f0231@canb.auug.org.au>
References: <20180315094201.1a70ed2a@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/1fJo3Vz.PVmOhB5=qIUzOI6"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180315094201.1a70ed2a@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: Arnd Bergmann <arnd@arndb.de>, Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Nicholas Piggin <npiggin@gmail.com>
List-Id: linux-next.vger.kernel.org

--Sig_/1fJo3Vz.PVmOhB5=qIUzOI6
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

On Thu, 15 Mar 2018 09:42:01 +1100 Stephen Rothwell <sfr@canb.auug.org.au> =
wrote:
>
> Today's linux-next merge of the asm-generic tree got a conflict in:
>=20
>   arch/blackfin/kernel/bfin_ksyms.c
>=20
> between commit:
>=20
>   4d9c7a5907dd ("kbuild: rename built-in.o to built-in.a")
>=20
> from the kbuild tree and commit:
>=20
>   e7e57f690e38 ("arch: remove blackfin port")
>=20
> from the asm-generic tree.
>=20
> I fixed it up (I just removed the file) and can carry the fix as
> necessary. This is now fixed as far as linux-next is concerned, but any
> non trivial conflicts should be mentioned to your upstream maintainer
> when your tree is submitted for merging.  You may also want to consider
> cooperating with the maintainer of the conflicting tree to minimise any
> particularly complex conflicts.

This conflict now exists between the kbuild tree and Linus' tree.

--=20
Cheers,
Stephen Rothwell

--Sig_/1fJo3Vz.PVmOhB5=qIUzOI6
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAlrECTcACgkQAVBC80lX
0GxgWAgAhEOFS5fA75ohZ4C3BYG+rUDJ5sXGtEuzZsa/e+/IXGnKE4cYKiuk/vYS
+scdFSYoi5klaA2+8pED8zyDMDQn6AhXMPa830zap+e6rUTlwUO89COYT/yzMxdm
vnl7siEYplai2ZVJpZqDbckoHy4iFO3Ryg+i+0nG2+SdhTjUl6URakBzy+abh15j
DSD08lAaVOQX9vpmSzXqruJCv5FM1wMpNlONU9VW3UsupNhEHufRXWUvf9Yb2XO7
2wFVMFPuS4qnSQr1Ezh6C9+HZa1R8jjncoeXO0S4SJCy2qGcVSoDeEpfw4xoH5C9
MrdK0Aouh+W9z4xl/KplMV3JRznS3g==
=H1Vv
-----END PGP SIGNATURE-----

--Sig_/1fJo3Vz.PVmOhB5=qIUzOI6--
