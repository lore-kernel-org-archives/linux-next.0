From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: linux-next: manual merge of the mips tree with the kbuild tree
Date: Wed, 15 Aug 2018 09:31:59 +1000
Message-ID: <20180815093159.55c5588f@canb.auug.org.au>
References: <20180803092100.7d0fda13@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/e9yn65TKcxkhbAzjCqKKUgT"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180803092100.7d0fda13@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: Ralf Baechle <ralf@linux-mips.org>, James Hogan <james.hogan@imgtec.com>, Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Paul Burton <paul.burton@mips.com>, Christoph Hellwig <hch@lst.de>
List-Id: linux-next.vger.kernel.org

--Sig_/e9yn65TKcxkhbAzjCqKKUgT
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

On Fri, 3 Aug 2018 09:21:00 +1000 Stephen Rothwell <sfr@canb.auug.org.au> w=
rote:
>
> Today's linux-next merge of the mips tree got a conflict in:
>=20
>   arch/mips/Kconfig
>=20
> between commit:
>=20
>   1572497cb0e6 ("kconfig: include common Kconfig files from top-level Kco=
nfig")
>=20
> from the kbuild tree and commit:
>=20
>   6c359eb1dcdb ("MIPS: Allow auto-dection of ARCH_PFN_OFFSET & PHYS_OFFSE=
T")
>=20
> from the mips tree.
>=20
> I fixed it up (see below) and can carry the fix as necessary. This
> is now fixed as far as linux-next is concerned, but any non trivial
> conflicts should be mentioned to your upstream maintainer when your tree
> is submitted for merging.  You may also want to consider cooperating
> with the maintainer of the conflicting tree to minimise any particularly
> complex conflicts.

> fdd83c534b114febc41ec115449cb25f421e1719
> diff --cc arch/mips/Kconfig
> index 06a633eb9777,642a56e2a1ea..2af13b162e5e
> --- a/arch/mips/Kconfig
> +++ b/arch/mips/Kconfig
> @@@ -2990,6 -2988,13 +2984,9 @@@ config PGTABLE_LEVEL
>   	default 3 if 64BIT && !PAGE_SIZE_64KB
>   	default 2
>  =20
> + config MIPS_AUTO_PFN_OFFSET
> + 	bool
> +=20
>  -source "init/Kconfig"
>  -
>  -source "kernel/Kconfig.freezer"
>  -
>   menu "Bus options (PCI, PCMCIA, EISA, ISA, TC)"
>  =20
>   config HW_HAS_EISA

This is now a conflict between Linus' tree and the kbuild tree.

--=20
Cheers,
Stephen Rothwell

--Sig_/e9yn65TKcxkhbAzjCqKKUgT
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAltzZm8ACgkQAVBC80lX
0GxOrQf5AaoxVW/CLFq46GzKU5iTB4rd4ATgqLU/dDhcfhYVY1YK6tG/bVyiX/Gg
Rt+32HH5/qeeqqtzIbbb0d2aBcwQICjb5WYm3ju61oDi8h2PSYfj8bfr3EUHymdn
XyLhjcAce/mTSCASW22v6DKnt3l0B9dabaT9mFMm6SXWAQkvyuXvkUBNegfwhhVl
PHyuMafgjlE2o979dH0fV8XxAcdpvqFcsB9ucIyBWAeb25yB+u9oIt/8YWhSHQVb
q8q1Zs2iOG/MQ5uqh4AMo9MstSt1YODbssT7gNOVPjgJrJoU9Y6US0Yt6VF0sQ/P
7wF1m5vp8SqeO9uVjU+Plu53OEOoPQ==
=DgsD
-----END PGP SIGNATURE-----

--Sig_/e9yn65TKcxkhbAzjCqKKUgT--
