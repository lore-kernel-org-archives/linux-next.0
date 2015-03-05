From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: [PATCH] Fix build errors in asm-generic/pgtable.h
Date: Fri, 6 Mar 2015 10:43:50 +1100
Message-ID: <20150306104350.1f46f1a3@canb.auug.org.au>
References: <1425573607-4801-1-git-send-email-toshi.kani@hp.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/2LFCnNXXPri0+zDdrLbRK.R"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1425573607-4801-1-git-send-email-toshi.kani@hp.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Toshi Kani <toshi.kani@hp.com>
Cc: akpm@linux-foundation.org, linux-mm@kvack.org, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, kbuild-all@01.org, fengguang.wu@intel.com, hannes@cmpxchg.org
List-Id: linux-next.vger.kernel.org

--Sig_/2LFCnNXXPri0+zDdrLbRK.R
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Toshi,

On Thu,  5 Mar 2015 09:40:07 -0700 Toshi Kani <toshi.kani@hp.com> wrote:
>
> Fix build errors in pud_set_huge() and pmd_set_huge() in
> asm-generic/pgtable.h on some architectures in linux-next
> and -mm trees.
>=20
> C-stype code needs be used under #ifndef __ASSEMBLY__.
>=20
> Signed-off-by: Toshi Kani <toshi.kani@hp.com>
> ---
>  include/asm-generic/pgtable.h |   12 ++++++------
>  1 file changed, 6 insertions(+), 6 deletions(-)

Added to my copy of the akpm-current tree today (and thus to linux-next).
--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au

--Sig_/2LFCnNXXPri0+zDdrLbRK.R
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJU+Oo6AAoJEMDTa8Ir7ZwVd9AP/ixTZSUMkaAZrQHL8V0x6Qmf
LpmcucMvm9uG0iWDkqCmKR8F6/aZLuE7AlX477XOuDRPr0kLV4bJA1VLsb+S0n9m
aOotNxKmqPNzhWp9+Cpg+hGI4+UjqXSyI8pPKtS7eptDQMx5Gr08ciEzREYxjp2D
yUbKzl2soqsxCwr2KH97JUk/ys2BhjIjotGJt/rAXemiGzwe2riqmvnkZ0QYD3RV
fmrDROxMMmoABjNeGTCYj7uhiAOnO8clTPqH2cta1qEUV90ggK3LUVTpyKR1CgR4
ddpFE5GKKEemfYrnp0YfMfxPMcPBuog7u4pWtzZE7TgbdIEpAfjpKTkorKztAbcF
WUhjpgAphXlb2cgEdqzS2dkeiQYzijZz8fx0zaS9HYI4Wg4c6ZUtgSSumhxyru6J
+zD0/gshMG5gUwf8omLpgOULVwwRufw7/53iJ4IMpYjJjNJfNn2LwQULNG/g1cdn
TndzEa0bq/NVFaKv3yJAmXccEfbm1PaIowh6nxbJniOaRvz4/iIbCJGXm3q+UzvX
CjMv2RQhFc1QXY94DGpxYQIMnR2IBZEZmVNdz0oYxovTo9aHG03mYic9kafwYV7X
FBNCryjXeGgMHuGH3malo0Jz2970kaUi0iTJh4Q0rRkGHPUqWe72TpHSf5r50tqz
Ria3RYwNMYe/kZwdnuw3
=JPxh
-----END PGP SIGNATURE-----

--Sig_/2LFCnNXXPri0+zDdrLbRK.R--
