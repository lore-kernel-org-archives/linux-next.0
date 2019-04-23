From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the akpm-current tree with the
 powerpc-fixes and powerpc trees
Date: Tue, 23 Apr 2019 19:13:51 +1000
Message-ID: <20190423191351.5824b525@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/R84=d46Rj=zQUc3yYyHaa/U"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Andrew Morton <akpm@linux-foundation.org>, Michael Ellerman <mpe@ellerman.id.au>, PowerPC <linuxppc-dev@lists.ozlabs.org>
Cc: Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Russell Currey <ruscur@russell.cc>, Alexandre Ghiti <alex@ghiti.fr>
List-Id: linux-next.vger.kernel.org

--Sig_/R84=d46Rj=zQUc3yYyHaa/U
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the akpm-current tree got a conflict in:

  arch/powerpc/platforms/Kconfig.cputype

between commit:

  8adddf349fda ("powerpc/mm/radix: Make Radix require HUGETLB_PAGE")

from the powerpc-fixes tree and commits:

  1bb2bae2e6c7 ("powerpc/mm/radix: Use KUEP API for Radix MMU")
  890274c2dc4c ("powerpc/64s: Implement KUAP for Radix MMU")

from the powerpc tree and commits:

  80d5ae3cf456 ("mm: simplify MEMORY_ISOLATION && COMPACTION || CMA into CO=
NTIG_ALLOC")
  3653abf7cded ("hugetlb: allow to free gigantic pages regardless of the co=
nfiguration")

from the akpm-current tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

--=20
Cheers,
Stephen Rothwell

diff --cc arch/powerpc/platforms/Kconfig.cputype
index 00b2bb536c74,03ca91439473..000000000000
--- a/arch/powerpc/platforms/Kconfig.cputype
+++ b/arch/powerpc/platforms/Kconfig.cputype
@@@ -328,10 -324,8 +328,10 @@@ config ARCH_ENABLE_SPLIT_PMD_PTLOC
 =20
  config PPC_RADIX_MMU
  	bool "Radix MMU Support"
 -	depends on PPC_BOOK3S_64
 +	depends on PPC_BOOK3S_64 && HUGETLB_PAGE
- 	select ARCH_HAS_GIGANTIC_PAGE if (MEMORY_ISOLATION && COMPACTION) || CMA
+ 	select ARCH_HAS_GIGANTIC_PAGE
 +	select PPC_HAVE_KUEP
 +	select PPC_HAVE_KUAP
  	default y
  	help
  	  Enable support for the Power ISA 3.0 Radix style MMU. Currently this

--Sig_/R84=d46Rj=zQUc3yYyHaa/U
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAly+108ACgkQAVBC80lX
0GywTAf/W97IPQ/tIK8fZmjGIZ/gLRhR2yCYS21XLN6mGVVZ5zCRWP9h7HzSsD0n
jyR5gumaGvY/wx/LjlLE0r2+Z5hdgL5Z26Rh7UOd7HiejTS+E8brZajbytKuJPVV
VD7nsgA8IEMWL3OhSHDakJS50p262vWrQiApyqMQfxe5ev6zRe6+gmwx8FB/HBhd
LwzvBew1rIYai+jV/L/bLABs4d9J4/+oMsxnBhk7e/h+Na8jIzi0hln8JjzPvxxV
IHbJgOmQWgQK9BQUkvwEgTYLMGmHt27xiXg+Jx3cTl7mf6p4jP/TCqWMitr0whT+
MkgbzmSMjhh6RG1dlzXqnoetBvo6AA==
=uWCC
-----END PGP SIGNATURE-----

--Sig_/R84=d46Rj=zQUc3yYyHaa/U--
