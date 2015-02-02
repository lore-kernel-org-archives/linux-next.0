From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the akpm-current tree with the fsl tree
Date: Mon, 2 Feb 2015 19:02:09 +1100
Message-ID: <20150202190209.122113bb@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/s.WGTkJQphaxyKvwo7m4JWg"; protocol="application/pgp-signature"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:48461 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S932245AbbBBICQ (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Mon, 2 Feb 2015 03:02:16 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Andrew Morton <akpm@linux-foundation.org>, Scott Wood <scottwood@freescale.com>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, LEROY Christophe <christophe.leroy@c-s.fr>, "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>

--Sig_/s.WGTkJQphaxyKvwo7m4JWg
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Andrew,

Today's linux-next merge of the akpm-current tree got a conflict in
arch/powerpc/include/asm/pgtable-ppc32.h between commit ce67f5d0a00c
("powerpc32: Use kmem_cache memory for PGDIR") from the fsl tree and
commit f8b48f1a9895 ("powerpc: drop _PAGE_FILE and pte_file()-related
helpers") from the akpm-current tree.

I fixed it up (see below) and can carry the fix as necessary (no action
is required).

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au

diff --cc arch/powerpc/include/asm/pgtable-ppc32.h
index 26ce0ab0a9e4,cc3e621aa830..000000000000
--- a/arch/powerpc/include/asm/pgtable-ppc32.h
+++ b/arch/powerpc/include/asm/pgtable-ppc32.h
@@@ -342,14 -341,6 +342,9 @@@ static inline void __ptep_set_access_fl
  #define __pte_to_swp_entry(pte)		((swp_entry_t) { pte_val(pte) >> 3 })
  #define __swp_entry_to_pte(x)		((pte_t) { (x).val << 3 })
 =20
- /* Encode and decode a nonlinear file mapping entry */
- #define PTE_FILE_MAX_BITS	29
- #define pte_to_pgoff(pte)	(pte_val(pte) >> 3)
- #define pgoff_to_pte(off)	((pte_t) { ((off) << 3) | _PAGE_FILE })
-=20
 +#ifndef CONFIG_PPC_4K_PAGES
 +void pgtable_cache_init(void);
 +#else
  /*
   * No page table caches to initialise
   */

--Sig_/s.WGTkJQphaxyKvwo7m4JWg
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJUzy8GAAoJEMDTa8Ir7ZwVkzkP/i/fc29twRYwYkCPqXRamHsD
9uoOSqjsUYoYfLiLH5WSoBt0FJnnUF/Y6UpYf2E3cWMd/ch6WML/GJOCXGa6nkh5
kZjeSIC7GGPD3BNS0Ch9pj31TXxRej7wagnrafnQbq7lncIi3mH6TOUM2pY2lfVu
JAU8myTI3Unaz+5PYR/01CV55w4ZIQ/EGEzMJjbuoKuWhsbx8Tdv44XTuRMNvIUz
5MVJ5f6cd2q+ncZOB9aOZSKeOv11Ogsb9bNxrEWDQwUkpt76+4rTjYVDN+egOqbT
eZSndFzamqIiuWrgHvYTtmfCBjObSxziPmc2/IRlxZNAel2jzPnpLNUZPMDfeb3v
gWrvzjxaC1CWHs+3fiuFZphc1A235tAAwMzPiL+FrovEuoT1U0ShTBAbSuDk5euM
whV3cCCewEP2iamdaQ4BTalED9Zw5jtl5Tvlh/zoVFKKvo93UpcCOgo0gpN5OpVO
BgoPISqCmgAvRlmNtbULi7CYIQ1SlRuEz03athImubTM4sNhEqh3gkhniCCZC43a
cOrqWO+NtBL9ezgLKBSBA8AOqdrlXw4UBkBIZsHy+QEXeaxAX3c68VoXHXtkyEhZ
dHkCsBKsuwQZKHlHuuMyA3D6+OUZnYZ4MDMllKwP4FiAn36YLBAXpUlFEox5FB9e
RwOCsYkl1fdl5MrwdPOT
=ajkV
-----END PGP SIGNATURE-----

--Sig_/s.WGTkJQphaxyKvwo7m4JWg--
