From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the akpm tree with Linus' tree
Date: Mon, 15 Oct 2018 18:22:34 +1100
Message-ID: <20181015182234.66638c37@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/bxVPt/rE9KO+6_+BubvaSW3"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Will Deacon <will.deacon@arm.com>, Mike Rapoport <rppt@linux.vnet.ibm.com>
List-Id: linux-next.vger.kernel.org

--Sig_/bxVPt/rE9KO+6_+BubvaSW3
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the akpm tree got a conflict in:

  arch/arm64/kernel/setup.c

between commit:

  d91680e687f4 ("arm64: Fix /proc/iomem for reserved but not memory regions=
")

from Linus' tree and patch:

  "memblock: stop using implicit alignment to SMP_CACHE_BYTES"

from the akpm tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

--=20
Cheers,
Stephen Rothwell

diff --cc arch/arm64/kernel/setup.c
index 811e3267412a,9084fec753f5..000000000000
--- a/arch/arm64/kernel/setup.c
+++ b/arch/arm64/kernel/setup.c
@@@ -215,12 -211,8 +215,13 @@@ static void __init request_standard_res
  	kernel_data.start   =3D __pa_symbol(_sdata);
  	kernel_data.end     =3D __pa_symbol(_end - 1);
 =20
 +	num_standard_resources =3D memblock.memory.cnt;
 +	standard_resources =3D memblock_alloc_low(num_standard_resources *
- 						sizeof(*standard_resources), 0);
++						sizeof(*standard_resources),
++						SMP_CACHE_BYTES);
 +
  	for_each_memblock(memory, region) {
 -		res =3D memblock_alloc_low(sizeof(*res), SMP_CACHE_BYTES);
 +		res =3D &standard_resources[i++];
  		if (memblock_is_nomap(region)) {
  			res->name  =3D "reserved";
  			res->flags =3D IORESOURCE_MEM;

--Sig_/bxVPt/rE9KO+6_+BubvaSW3
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAlvEQDoACgkQAVBC80lX
0GybwQf/cQBug8TGVqSUlnmyPiqUMn1xfexhce2JLNkXcSMg8dsBW+0pvwRK6Cy6
Yry50ezirLh8ytG0VYryLF+kLkaHzirH6UGCNAZvFfXaI2VIxqu9IbVwBXonWIzU
DMkFpMagmLFNMWI9+VMfEdVjd/FeUwcwEfNZGwNtIT/k5e313Gg/bIR4SAojNjsA
+67I5RUd7D+3m0iDAxTZ0BsIeW7wkEFeZiuwV410rFbFvDLuSJ2vauf24KOPurf7
WWg6XHb/iE40vTii90paIy2dmRS1YWxWilzbzF2ww7uCCS55/LBc1NaHhtc+/kw9
hYQNplWWjOOEN8ABx/i56T1F4yGB5w==
=Lj2L
-----END PGP SIGNATURE-----

--Sig_/bxVPt/rE9KO+6_+BubvaSW3--
