From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the akpm-current tree with Linus' tree
Date: Mon, 23 Jul 2018 18:00:51 +1000
Message-ID: <20180723180051.7f896f99@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/ilYYoLw1=/Ai8=WqW9UGg2Q"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Andrew Morton <akpm@linux-foundation.org>, Linus Torvalds <torvalds@linux-foundation.org>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>
List-Id: linux-next.vger.kernel.org

--Sig_/ilYYoLw1=/Ai8=WqW9UGg2Q
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the akpm-current tree got a conflict in:

  mm/mmap.c

between commit:

  490fc053865c ("mm: make vm_area_alloc() initialize core fields")

from Linus' tree and commit:

  97478b56e246 ("mm: Fix vma_is_anonymous() false-positives")

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

diff --cc mm/mmap.c
index ff1944d8d458,b9636fa18f3c..000000000000
--- a/mm/mmap.c
+++ b/mm/mmap.c
@@@ -2983,6 -3001,9 +2994,7 @@@ static int do_brk_flags(unsigned long a
  		return -ENOMEM;
  	}
 =20
 -	INIT_LIST_HEAD(&vma->anon_vma_chain);
 -	vma->vm_mm =3D mm;
+ 	vma->vm_ops =3D &anon_vm_ops;
  	vma->vm_start =3D addr;
  	vma->vm_end =3D addr + len;
  	vma->vm_pgoff =3D pgoff;

--Sig_/ilYYoLw1=/Ai8=WqW9UGg2Q
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAltVizMACgkQAVBC80lX
0Gyndgf/StLaNhw9ZGki7TuDsFl/rvhTnZ5K7MUYun7GckFFu17obsG60jPZC3kS
86GM51WuPo+FunD7L4HrBwamLxPG+i3OC9BaYV2lJZwmCuVd5oBx+k6D56stX5+k
4GiHHX+Kh6mpotJc937mqwIDSktxA2ZvZ6CGGZ28SoygBNqcOWZIGHNZY6cyO6A5
BAM2enUrf40aA0SIsUldWttJezjuYhbllUMeapEJ90gzhm0GOx0P5QiMvY0SDvCm
roxUtRDwUt8BEOWxVk+7T/Uxqj2tibLPIj935e/GF9sP4u4PgBGyEaj2BLRD0ZW8
kmyDSTlM/Wghz/Z2qcSf/elFI3PPaw==
=0ZbU
-----END PGP SIGNATURE-----

--Sig_/ilYYoLw1=/Ai8=WqW9UGg2Q--
