From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the akpm-current tree with the
 sparc-next tree
Date: Mon, 19 Mar 2018 17:43:55 +1100
Message-ID: <20180319174355.02725f8f@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/e6..Ev2Ip4VFe7Pc3HaN7Vi"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Andrew Morton <akpm@linux-foundation.org>, David Miller <davem@davemloft.net>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Yu Zhao <yuzhao@google.com>, Khalid Aziz <khalid.aziz@oracle.com>
List-Id: linux-next.vger.kernel.org

--Sig_/e6..Ev2Ip4VFe7Pc3HaN7Vi
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the akpm-current tree got a conflict in:

  mm/memory.c

between commit:

  ca827d55ebaa ("mm, swap: Add infrastructure for saving page metadata on s=
wap")

from the sparc-next tree and commit:

  f2986f002986 ("mm: don't expose page to fast gup before it's ready")

from the akpm-current tree.

I fixed it up (please check, I just did the obvious fix up - see below)
and can carry the fix as necessary. This is now fixed as far as linux-next
is concerned, but any non trivial conflicts should be mentioned to your
upstream maintainer when your tree is submitted for merging.  You may
also want to consider cooperating with the maintainer of the conflicting
tree to minimise any particularly complex conflicts.

--=20
Cheers,
Stephen Rothwell

diff --cc mm/memory.c
index aed37325d94e,e0ae4999c824..000000000000
--- a/mm/memory.c
+++ b/mm/memory.c
@@@ -3052,8 -3035,6 +3035,7 @@@ int do_swap_page(struct vm_fault *vmf
  	flush_icache_page(vma, page);
  	if (pte_swp_soft_dirty(vmf->orig_pte))
  		pte =3D pte_mksoft_dirty(pte);
- 	set_pte_at(vma->vm_mm, vmf->address, vmf->pte, pte);
 +	arch_do_swap_page(vma->vm_mm, vma, vmf->address, pte, vmf->orig_pte);
  	vmf->orig_pte =3D pte;
 =20
  	/* ksm created a completely new copy */

--Sig_/e6..Ev2Ip4VFe7Pc3HaN7Vi
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAlqvXCsACgkQAVBC80lX
0Gz9LQf/Tbj3su/83xrC77vxQR+eWvjxXw4aRVcAuLyWCXV48VFc2IdvNs+fRIAN
hinRAFYPQpN9U/4mmG03L/Zjea3jnZRSNqWfMI65KuNQ5v8vLkxC+Z5z8rdNGA7u
5FI8RGv+qIJI1hjJI0cCKcJ+g08crI1vULrQoLadLmPxWCNeBqGjIw36wAb0Vw17
IjDC8uxcEOcztYpUVXYAtINGm6MwP3FFCCiQlp38LDKIJzW4AK26RWbygyHRO8Rh
f2YD1DVeDj+8amnSI1er7sSblimn945smKrXZzqgw0ZLGwnnDbbcZw2obF1zG/ss
obd14Nx1ZPMtgafy0bEMmkgjl2THhQ==
=dTgo
-----END PGP SIGNATURE-----

--Sig_/e6..Ev2Ip4VFe7Pc3HaN7Vi--
