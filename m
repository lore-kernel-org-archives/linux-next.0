From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: linux-next: manual merge of the akpm-current tree with the
 arm64 tree
Date: Thu, 16 Aug 2018 10:11:35 +1000
Message-ID: <20180816101135.39a1a344@canb.auug.org.au>
References: <20180727205532.28de3353@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/u19SvlrAvGd.pz6edCsx8gA"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180727205532.28de3353@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will.deacon@arm.com>, Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Laura Abbott <labbott@redhat.com>, Ard Biesheuvel <ard.biesheuvel@linaro.org>
List-Id: linux-next.vger.kernel.org

--Sig_/u19SvlrAvGd.pz6edCsx8gA
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

On Fri, 27 Jul 2018 20:55:32 +1000 Stephen Rothwell <sfr@canb.auug.org.au> =
wrote:
>
> Today's linux-next merge of the akpm-current tree got a conflict in:
>=20
>   drivers/firmware/efi/libstub/Makefile
>=20
> between commit:
>=20
>   0b3e336601b8 ("arm64: Add support for STACKLEAK gcc plugin")
>=20
> from the arm64 tree and commit:
>=20
>   08cc64a7109b ("module: allow symbol exports to be disabled")
>=20
> from the akpm-current tree.
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
> diff --cc drivers/firmware/efi/libstub/Makefile
> index 25dd2a14560d,0d0d3483241c..000000000000
> --- a/drivers/firmware/efi/libstub/Makefile
> +++ b/drivers/firmware/efi/libstub/Makefile
> @@@ -21,7 -21,7 +21,8 @@@ KBUILD_CFLAGS			:=3D $(cflags-y) -DDISABL
>   				   -D__NO_FORTIFY \
>   				   $(call cc-option,-ffreestanding) \
>   				   $(call cc-option,-fno-stack-protector) \
> - 				   $(DISABLE_STACKLEAK_PLUGIN)
> ++				   $(DISABLE_STACKLEAK_PLUGIN) \
> + 				   -D__DISABLE_EXPORTS
>  =20
>   GCOV_PROFILE			:=3D n
>   KASAN_SANITIZE			:=3D n

This is now a conflict between Linus' tree and the akpm-current tree.

--=20
Cheers,
Stephen Rothwell

--Sig_/u19SvlrAvGd.pz6edCsx8gA
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAlt0wTcACgkQAVBC80lX
0Gw/0wf+OtvMceJoBJYvCid/cAlozmHf6Qcr/xtP1XSgxbr/GniHAG/UEuIRcZox
FWCAx2WNgdDmakjlrDRoGRe3buQ/vKoTBYsxiNDu8LR+QOCN6BPnp7HeL7iMKN9W
okpO8Ax4WOmyTQrkwnKYpT7rmVWtliNS9PJw9Li5WCnZg0sOA835I6eBawJJkpQm
XZtRb5Zy2us29vM2ePqvVzVqD0XAmydPA1aeepTXghScjz6trA14GO0A992yTdt4
/wJWU5itTSa4oNFh+E+96OESMV6XNZYt31gq85wCheYM3WAIb1Y19ElN6+07v2mV
7KiUzbU5SJQuN/Bn9BP3Pgaky/mmfw==
=Umbt
-----END PGP SIGNATURE-----

--Sig_/u19SvlrAvGd.pz6edCsx8gA--
