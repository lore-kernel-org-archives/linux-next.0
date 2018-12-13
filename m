From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the akpm-current tree with the arm64
 tree
Date: Thu, 13 Dec 2018 17:01:07 +1100
Message-ID: <20181213170107.38bd04d6@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/s/dZJ6VtEHUosbgwXC4YBD8"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Andrew Morton <akpm@linux-foundation.org>, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will.deacon@arm.com>
Cc: Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Robin Murphy <robin.murphy@arm.com>
List-Id: linux-next.vger.kernel.org

--Sig_/s/dZJ6VtEHUosbgwXC4YBD8
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the akpm-current tree got a conflict in:

  arch/arm64/mm/mmu.c

between commit:

  4ab215061554 ("arm64: Add memory hotplug support")

from the arm64 tree and commit:

  232619fcc076 ("lib/ioremap: ensure break-before-make is used for huge p4d=
 mappings")

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

diff --cc arch/arm64/mm/mmu.c
index da513a1facf4,cf9a26d3d7f5..000000000000
--- a/arch/arm64/mm/mmu.c
+++ b/arch/arm64/mm/mmu.c
@@@ -1047,19 -1029,7 +1043,24 @@@ int pud_free_pmd_page(pud_t *pudp, unsi
  	return 1;
  }
 =20
 +#ifdef CONFIG_MEMORY_HOTPLUG
 +int arch_add_memory(int nid, u64 start, u64 size, struct vmem_altmap *alt=
map,
 +		    bool want_memblock)
 +{
 +	int flags =3D 0;
 +
 +	if (rodata_full || debug_pagealloc_enabled())
 +		flags =3D NO_BLOCK_MAPPINGS | NO_CONT_MAPPINGS;
 +
 +	__create_pgd_mapping(swapper_pg_dir, start, __phys_to_virt(start),
 +			     size, PAGE_KERNEL, pgd_pgtable_alloc, flags);
 +
 +	return __add_pages(nid, start >> PAGE_SHIFT, size >> PAGE_SHIFT,
 +			   altmap, want_memblock);
 +}
 +#endif
++
+ int p4d_free_pud_page(p4d_t *p4d, unsigned long addr)
+ {
+ 	return 0;	/* Don't attempt a block mapping */
+ }

--Sig_/s/dZJ6VtEHUosbgwXC4YBD8
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAlwR9aMACgkQAVBC80lX
0GzuUAgApOa/2d+NaygMl3ECyhQEDiOyxvZeByd6ZfA3RZaAzzxPl+HJzAZn+yRB
oJmCFfJe5igNQzkXUf0KYueV+e0B3JLEfMF5/B9sPKzq7ddlsgIaRWcdvsw6f83D
xnk8Kh8cOqiNxlzRccEEZUZX80bXyTmgKB8NAIJApF7iXCtg3v9V8Bt75ZyFaDtX
6FloQD+eQJp3el89yfOuJABRo/yekomit/LOUBXLJmWuEHa5vFrns+5jFNyMp4vi
9PwtGOH6CXXBFtkwvxcugCKCO/JQy0H2esFX4WOioTp+qCcGXK2jxXKhPgxHMe6Y
aRSjFFIby5cE9uE6rbe5JKLFwceMbg==
=4wCQ
-----END PGP SIGNATURE-----

--Sig_/s/dZJ6VtEHUosbgwXC4YBD8--
