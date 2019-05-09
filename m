From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the akpm-current tree with the rdma
 tree
Date: Thu, 9 May 2019 15:38:05 +1000
Message-ID: <20190509153805.6dfbb8ef@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/N6r_ntWNktjFpZVHC1q.JuC"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Andrew Morton <akpm@linux-foundation.org>, Doug Ledford <dledford@redhat.com>, Jason Gunthorpe <jgg@mellanox.com>
Cc: Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Ira Weiny <ira.weiny@intel.com>, Shiraz Saleem <shiraz.saleem@intel.com>
List-Id: linux-next.vger.kernel.org

--Sig_/N6r_ntWNktjFpZVHC1q.JuC
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the akpm-current tree got a conflict in:

  drivers/infiniband/core/umem.c

between commit:

  db6c6774af0d ("RDMA/umem: Remove hugetlb flag")

from the rdma tree and commit:

  c041ba1a3294 ("mm/gup: replace get_user_pages_longterm() with FOLL_LONGTE=
RM")

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

diff --cc drivers/infiniband/core/umem.c
index 0a23048db523,31191f098e73..000000000000
--- a/drivers/infiniband/core/umem.c
+++ b/drivers/infiniband/core/umem.c
@@@ -295,10 -189,11 +295,11 @@@ struct ib_umem *ib_umem_get(struct ib_u
 =20
  	while (npages) {
  		down_read(&mm->mmap_sem);
- 		ret =3D get_user_pages_longterm(cur_base,
+ 		ret =3D get_user_pages(cur_base,
  				     min_t(unsigned long, npages,
  					   PAGE_SIZE / sizeof (struct page *)),
- 				     gup_flags, page_list, NULL);
+ 				     gup_flags | FOLL_LONGTERM,
 -				     page_list, vma_list);
++				     page_list, NULL);
  		if (ret < 0) {
  			up_read(&mm->mmap_sem);
  			goto umem_release;

--Sig_/N6r_ntWNktjFpZVHC1q.JuC
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAlzTvL0ACgkQAVBC80lX
0GzYdgf+NxNeHbwWOAcxbKB8cTD8a0wOTgWJkq0xlwxRVf7I6r1vfD3CA3gcrgD8
Mc+OfxE7roMfUTmSzIWw+zRffnC+yZoxt2xntOxH8+qA+qwfp6vFLCOp65wFYDsB
+3h6J5kv58Eu3+WRtu0/2aU/3Nv1JCVvONhv/cj/+8e3UjuwmyA71YtvwfeFla8R
dB853U3wstWXgYG7rbnZarfkkIeXU2AZSud8sO1YE7/QhDI6PYQ9CF7rlvSaQf57
Rzo/TAlhBwNWr3ZNTATqSp9OSzWg4rYtVWvPlN42VlvBjCE32FUuzKPrUCnE5nff
GldaAGipKirhMxn22nDicA2TRKqyIQ==
=ouBp
-----END PGP SIGNATURE-----

--Sig_/N6r_ntWNktjFpZVHC1q.JuC--
