From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: linux-next: manual merge of the asm-generic tree with the
 kbuild tree
Date: Wed, 4 Apr 2018 09:10:58 +1000
Message-ID: <20180404091058.34069098@canb.auug.org.au>
References: <20180328090222.0f3c34da@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/E13fQf4gc_S7PZ4cxU0NlGS"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180328090222.0f3c34da@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: Arnd Bergmann <arnd@arndb.de>, Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, James Hogan <jhogan@kernel.org>
List-Id: linux-next.vger.kernel.org

--Sig_/E13fQf4gc_S7PZ4cxU0NlGS
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

On Wed, 28 Mar 2018 09:02:22 +1100 Stephen Rothwell <sfr@canb.auug.org.au> =
wrote:
>
> Today's linux-next merge of the asm-generic tree got a conflict in:
>=20
>   arch/metag/boot/dts/Makefile
>=20
> between commit:
>=20
>   b985b71d295f ("kbuild: mark $(targets) as .SECONDARY and remove .PRECIO=
US markers")
>=20
> from the kbuild tree and commit:
>=20
>   bb6fb6dfcc17 ("metag: Remove arch/metag/")
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

--Sig_/E13fQf4gc_S7PZ4cxU0NlGS
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAlrECgIACgkQAVBC80lX
0GyCjQf/dYyUTBPVjsx9TnSxx1AKQwKhja6O0pQ7RH0dMid8KTATN0TyMRjQtOoa
djXAyuNZkJNSG5FSFeRpZhRPgJITMwQ5MJt7U7LUb9ceRWa5v1GdF+he5d/301BH
lJ7zzY8E7srfhh43MevccIF3nRufMFFcZ9eXqoXO8IUKRkqtaA9qU1DvGSmbCKoM
ob1j0pNATyrgyhHfirGD4tl/2dTxmIC7Jb72bFFCNlCpb3zUnaBGEW3axzSf14Rd
3GSjmg0yQLS/U9wCUlKGeXXRFhfc0Qblp5BkhtFAmbkcINdAoAGG/lAKvEz1jEAf
gBrr3VExzvqG3MKWmRqfbw9hc237gg==
=ZvJZ
-----END PGP SIGNATURE-----

--Sig_/E13fQf4gc_S7PZ4cxU0NlGS--
