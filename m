From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the mips tree with Linus' tree
Date: Sun, 22 Feb 2015 11:15:28 +1100
Message-ID: <20150222111528.3b66e61c@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/hyHY0HeNqvMJ5+Z.K9sSWZI"; protocol="application/pgp-signature"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:54284 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751745AbbBVAPh (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Sat, 21 Feb 2015 19:15:37 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Ralf Baechle <ralf@linux-mips.org>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, "Steven J. Hill" <Steven.Hill@imgtec.com>, "Kirill A. Shutemov" <kirill@shutemov.name>

--Sig_/hyHY0HeNqvMJ5+Z.K9sSWZI
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Ralf,

Today's linux-next merge of the mips tree got a conflict in
arch/mips/include/asm/pgtable-bits.h between commit b32da82e28ce
("mips: drop _PAGE_FILE and pte_file()-related helpers") from Linus'
tree and commit 05f9883a2899 ("MIPS: Usage and cosmetic cleanups of
page table bits.") from the mips tree.

I fixed it up (see below) and can carry the fix as necessary (no action
is required).

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au

diff --cc arch/mips/include/asm/pgtable-bits.h
index fc807aa5ec8d,156fd6eb1e03..000000000000
--- a/arch/mips/include/asm/pgtable-bits.h
+++ b/arch/mips/include/asm/pgtable-bits.h
@@@ -167,9 -150,13 +150,9 @@@
 =20
  #endif /* defined(CONFIG_PHYS_ADDR_T_64BIT && defined(CONFIG_CPU_MIPS32) =
*/
 =20
- #ifndef _PFN_SHIFT
- #define _PFN_SHIFT		    PAGE_SHIFT
- #endif
 -/*
 - * _PAGE_FILE semantics: set:pagecache unset:swap
 - */
 -#define _PAGE_FILE		_PAGE_MODIFIED
+ #define _PAGE_SILENT_READ	_PAGE_VALID
+ #define _PAGE_SILENT_WRITE	_PAGE_DIRTY
+=20
  #define _PFN_MASK		(~((1 << (_PFN_SHIFT)) - 1))
 =20
  #ifndef _PAGE_NO_READ

--Sig_/hyHY0HeNqvMJ5+Z.K9sSWZI
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJU6R+lAAoJEMDTa8Ir7ZwVCbUP/inRCauLkMM1bhUkoX16zMTX
1EEfuUAVafprApMhLxfSJML+/rJdlHot2yw99hEUJ29+69OVmEa/KdO+oJG0D88V
1pC2sZMy/lgG8OG6xcIrgOUr6+HmcgJScwwRChi5ce32jhZ+jictZdMUmrNv/vP+
5b4Ie6IYLitYJir6DbJVsNMssUtBnFPNAgBhlY8S9JGiZbnGgJeLnMbacLB3UQPw
ZHpG4Uwg1Jvq0/yeCUhZCeUAU9HoOndKSNr07c6qh74JXVBSQp3ELkNc0tUfciU5
TfwjnQF5ZKzZv8nZ79eQEbmyf3piC21oz0z7K6XjgK50fiHlr2iZhDMqTzl8Ntww
aWFAch2cediInuDbjatwBk+liB96hQJu05zs4zZHNDAPs7J2cntWiqd2HVcKINJs
bUXcGNdfVcCJXM9pxWD0iFBId24eTYN6V6A9UMU5Wb1+G20rWEhF3uZfWzUIyWmz
hAYBYc6F9Z6NQBoaMlfuEqmT7uIL5knpzyGUUd0PEUueZWthVzlYajqgKW/THLNZ
cIOFfluBLKYgrKDMzxWGu4wkaIlM81rKNF5RanLIRRhJwjhepiswgMS5dK2n1a1o
P0G+7YYf/BXA5Q5l62Qs9sBiuLGF6XzzxQrV8ys+tc7DL7Al8Ir74wh+B/Bm6FyP
Z+oKcQRujpOgoRivUFfy
=k2ZL
-----END PGP SIGNATURE-----

--Sig_/hyHY0HeNqvMJ5+Z.K9sSWZI--
