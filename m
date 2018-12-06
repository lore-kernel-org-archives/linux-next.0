From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the akpm-current tree with the powerpc
 tree
Date: Thu, 6 Dec 2018 17:44:17 +1100
Message-ID: <20181206174417.45fe3e7a@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/.zLNjQH4ObXZYR53yJAEYhH"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Andrew Morton <akpm@linux-foundation.org>, Michael Ellerman <mpe@ellerman.id.au>, Benjamin Herrenschmidt <benh@kernel.crashing.org>, PowerPC <linuxppc-dev@lists.ozlabs.org>
Cc: Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, "Joel Fernandes (Google)" <joel@joelfernandes.org>, Christophe Leroy <christophe.leroy@c-s.fr>
List-Id: linux-next.vger.kernel.org

--Sig_/.zLNjQH4ObXZYR53yJAEYhH
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Andrew,

Today's linux-next merge of the akpm-current tree got conflicts in:

  arch/powerpc/include/asm/book3s/32/pgalloc.h
  arch/powerpc/include/asm/nohash/32/pgalloc.h
  arch/powerpc/mm/pgtable-book3s64.c

between commits:

  a95d133c8643 ("powerpc/mm: Move pte_fragment_alloc() to a common location=
")
  32ea4c149990 ("powerpc/mm: Extend pte_fragment functionality to PPC32")

from the powerpc tree and commit:

  913c2d755b39 ("mm: treewide: remove unused address argument from pte_allo=
c functions")

from the akpm-current tree.

I fixed it up (see below, plus the extra merge fix patch) and can
carry the fix as necessary. This is now fixed as far as linux-next is
concerned, but any non trivial conflicts should be mentioned to your
upstream maintainer when your tree is submitted for merging.  You may
also want to consider cooperating with the maintainer of the conflicting
tree to minimise any particularly complex conflicts.

From: Stephen Rothwell <sfr@canb.auug.org.au>
Date: Thu, 6 Dec 2018 17:41:27 +1100
Subject: [PATCH] fix up for "mm: treewide: remove unused address argument f=
rom
 pte_alloc functions"

Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
---
 arch/powerpc/mm/pgtable-frag.c | 2 +-
 arch/powerpc/mm/pgtable_32.c   | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/powerpc/mm/pgtable-frag.c b/arch/powerpc/mm/pgtable-frag.c
index af23a587f019..a7b05214760c 100644
--- a/arch/powerpc/mm/pgtable-frag.c
+++ b/arch/powerpc/mm/pgtable-frag.c
@@ -95,7 +95,7 @@ static pte_t *__alloc_for_ptecache(struct mm_struct *mm, =
int kernel)
 	return (pte_t *)ret;
 }
=20
-pte_t *pte_fragment_alloc(struct mm_struct *mm, unsigned long vmaddr, int =
kernel)
+pte_t *pte_fragment_alloc(struct mm_struct *mm, int kernel)
 {
 	pte_t *pte;
=20
diff --git a/arch/powerpc/mm/pgtable_32.c b/arch/powerpc/mm/pgtable_32.c
index deda68e02338..5b1e1adeb4d2 100644
--- a/arch/powerpc/mm/pgtable_32.c
+++ b/arch/powerpc/mm/pgtable_32.c
@@ -48,12 +48,12 @@ __ref pte_t *pte_alloc_one_kernel(struct mm_struct *mm)
 	if (!slab_is_available())
 		return memblock_alloc(PTE_FRAG_SIZE, PTE_FRAG_SIZE);
=20
-	return (pte_t *)pte_fragment_alloc(mm, address, 1);
+	return (pte_t *)pte_fragment_alloc(mm, 1);
 }
=20
 pgtable_t pte_alloc_one(struct mm_struct *mm)
 {
-	return (pgtable_t)pte_fragment_alloc(mm, address, 0);
+	return (pgtable_t)pte_fragment_alloc(mm, 0);
 }
=20
 void __iomem *
--=20
2.19.1

--=20
Cheers,
Stephen Rothwell

diff --cc arch/powerpc/include/asm/book3s/32/pgalloc.h
index b5b955eb2fb7,af9e13555d95..000000000000
--- a/arch/powerpc/include/asm/book3s/32/pgalloc.h
+++ b/arch/powerpc/include/asm/book3s/32/pgalloc.h
@@@ -56,16 -61,29 +56,16 @@@ static inline void pmd_populate_kernel(
  static inline void pmd_populate(struct mm_struct *mm, pmd_t *pmdp,
  				pgtable_t pte_page)
  {
 -	*pmdp =3D __pmd((page_to_pfn(pte_page) << PAGE_SHIFT) | _PMD_PRESENT);
 -}
 -
 -#define pmd_pgtable(pmd) pmd_page(pmd)
 -#else
 -
 -static inline void pmd_populate_kernel(struct mm_struct *mm, pmd_t *pmdp,
 -				       pte_t *pte)
 -{
 -	*pmdp =3D __pmd((unsigned long)pte | _PMD_PRESENT);
 -}
 -
 -static inline void pmd_populate(struct mm_struct *mm, pmd_t *pmdp,
 -				pgtable_t pte_page)
 -{
 -	*pmdp =3D __pmd((unsigned long)lowmem_page_address(pte_page) | _PMD_PRES=
ENT);
 +	*pmdp =3D __pmd(__pa(pte_page) | _PMD_PRESENT);
  }
 =20
 -#define pmd_pgtable(pmd) pmd_page(pmd)
 -#endif
 +#define pmd_pgtable(pmd) ((pgtable_t)pmd_page_vaddr(pmd))
 =20
- extern pte_t *pte_alloc_one_kernel(struct mm_struct *mm, unsigned long ad=
dr);
- extern pgtable_t pte_alloc_one(struct mm_struct *mm, unsigned long addr);
+ extern pte_t *pte_alloc_one_kernel(struct mm_struct *mm);
+ extern pgtable_t pte_alloc_one(struct mm_struct *mm);
 +void pte_frag_destroy(void *pte_frag);
- pte_t *pte_fragment_alloc(struct mm_struct *mm, unsigned long vmaddr, int=
 kernel);
++pte_t *pte_fragment_alloc(struct mm_struct *mm, int kernel);
 +void pte_fragment_free(unsigned long *table, int kernel);
 =20
  static inline void pte_free_kernel(struct mm_struct *mm, pte_t *pte)
  {
diff --cc arch/powerpc/include/asm/nohash/32/pgalloc.h
index 17963951bdb0,16623f53f0d4..000000000000
--- a/arch/powerpc/include/asm/nohash/32/pgalloc.h
+++ b/arch/powerpc/include/asm/nohash/32/pgalloc.h
@@@ -73,17 -77,14 +73,17 @@@ static inline void pmd_populate_kernel(
  static inline void pmd_populate(struct mm_struct *mm, pmd_t *pmdp,
  				pgtable_t pte_page)
  {
 -	*pmdp =3D __pmd((unsigned long)lowmem_page_address(pte_page) | _PMD_PRES=
ENT);
 +	*pmdp =3D __pmd((unsigned long)pte_page | _PMD_PRESENT);
  }
 =20
 -#define pmd_pgtable(pmd) pmd_page(pmd)
 +#define pmd_pgtable(pmd) ((pgtable_t)pmd_page_vaddr(pmd))
  #endif
 =20
- extern pte_t *pte_alloc_one_kernel(struct mm_struct *mm, unsigned long ad=
dr);
- extern pgtable_t pte_alloc_one(struct mm_struct *mm, unsigned long addr);
+ extern pte_t *pte_alloc_one_kernel(struct mm_struct *mm);
+ extern pgtable_t pte_alloc_one(struct mm_struct *mm);
 +void pte_frag_destroy(void *pte_frag);
- pte_t *pte_fragment_alloc(struct mm_struct *mm, unsigned long vmaddr, int=
 kernel);
++pte_t *pte_fragment_alloc(struct mm_struct *mm, int kernel);
 +void pte_fragment_free(unsigned long *table, int kernel);
 =20
  static inline void pte_free_kernel(struct mm_struct *mm, pte_t *pte)
  {
diff --cc arch/powerpc/mm/pgtable-book3s64.c
index f3c31f5e1026,6f9d434b0a4c..000000000000
--- a/arch/powerpc/mm/pgtable-book3s64.c
+++ b/arch/powerpc/mm/pgtable-book3s64.c

--Sig_/.zLNjQH4ObXZYR53yJAEYhH
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAlwIxUEACgkQAVBC80lX
0GxUpAf/farV5+yCU8Lalv6I1lW9uxsa/pfQPJuU4b3PCIZNqPSawTtqgsrbaFJh
WR0GWyPIHQDCFeXLZYvfKoBRnL2jiktDvciFSAGlsYAweko2f/DCXd+1lDcbKf7M
gnaO3XM9uTI4JE1/LXy/CW48nIoAk2wUYTPAXt5cDZmLUUg3PAWA/I0zenj/EDET
YAa9UO2MqW/9jOQMG1IETtLd5DdSXI5nRPShAwSgt68tQwSVhLWHJmJW2p1IiSNT
kYAqEKG7kyyId+eSugQb2b0AoB+Tw1Sx000dOIIyVDy6aZ0dbQQywMRdfStHy3dC
NOJB/4EE916seYmURAhI7k6yvCUMuA==
=oT1P
-----END PGP SIGNATURE-----

--Sig_/.zLNjQH4ObXZYR53yJAEYhH--
