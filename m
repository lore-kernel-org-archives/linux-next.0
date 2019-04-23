From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the akpm-current tree with the
 powerpc-fixes tree
Date: Tue, 23 Apr 2019 19:06:06 +1000
Message-ID: <20190423190606.0fefb856@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/2ARaGh/=BsU+UGXvuPb+u_l"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Andrew Morton <akpm@linux-foundation.org>, Michael Ellerman <mpe@ellerman.id.au>, PowerPC <linuxppc-dev@lists.ozlabs.org>
Cc: Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Alexey Kardashevskiy <aik@ozlabs.ru>, Ira Weiny <ira.weiny@intel.com>
List-Id: linux-next.vger.kernel.org

--Sig_/2ARaGh/=BsU+UGXvuPb+u_l
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the akpm-current tree got a conflict in:

  arch/powerpc/mm/mmu_context_iommu.c

between commits:

  eb9d7a62c386 ("powerpc/mm_iommu: Fix potential deadlock")
  7a3a4d763837 ("powerpc/mm_iommu: Allow pinning large regions")

from the powerpc-fixes tree and commit:

  02f506bad7af ("mm/gup: replace get_user_pages_longterm() with FOLL_LONGTE=
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

diff --cc arch/powerpc/mm/mmu_context_iommu.c
index 8330f135294f,755fe7adc0d8..000000000000
--- a/arch/powerpc/mm/mmu_context_iommu.c
+++ b/arch/powerpc/mm/mmu_context_iommu.c
@@@ -135,27 -144,18 +131,28 @@@ static long mm_iommu_do_alloc(struct mm
  	}
 =20
  	down_read(&mm->mmap_sem);
 -	ret =3D get_user_pages(ua, entries, FOLL_WRITE | FOLL_LONGTERM,
 -			     mem->hpages, NULL);
 +	chunk =3D (1UL << (PAGE_SHIFT + MAX_ORDER - 1)) /
 +			sizeof(struct vm_area_struct *);
 +	chunk =3D min(chunk, entries);
 +	for (entry =3D 0; entry < entries; entry +=3D chunk) {
 +		unsigned long n =3D min(entries - entry, chunk);
 +
- 		ret =3D get_user_pages_longterm(ua + (entry << PAGE_SHIFT), n,
- 				FOLL_WRITE, mem->hpages + entry, NULL);
++		ret =3D get_user_pages(ua + (entry << PAGE_SHIFT), n,
++				     FOLL_WRITE | FOLL_LONGTERM,
++				     mem->hpages + entry, NULL);
 +		if (ret =3D=3D n) {
 +			pinned +=3D n;
 +			continue;
 +		}
 +		if (ret > 0)
 +			pinned +=3D ret;
 +		break;
 +	}
  	up_read(&mm->mmap_sem);
 -	if (ret !=3D entries) {
 -		/* free the reference taken */
 -		for (i =3D 0; i < ret; i++)
 -			put_page(mem->hpages[i]);
 -
 -		vfree(mem->hpas);
 -		kfree(mem);
 -		ret =3D -EFAULT;
 -		goto unlock_exit;
 +	if (pinned !=3D entries) {
 +		if (!ret)
 +			ret =3D -EFAULT;
 +		goto free_exit;
  	}
 =20
  	pageshift =3D PAGE_SHIFT;

--Sig_/2ARaGh/=BsU+UGXvuPb+u_l
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAly+1X4ACgkQAVBC80lX
0GzKPwf/eFaYcP4HXH0SSp2FFkj7xchpF5DtNJfmEvjnf230qoH/ZqNgTpSV9hBK
Yonl18q1M7BNr13j+CNeKVr6iZOSDNPqSHCvB83cqIS7XcH8UzJEbuhpIfbAcI9f
B06JwSs4eFhhpAINXRGbE492Jl5DGB8Rxl2+KWRjXRBqYD7Q5V9d5pzj0HAt8N8/
zRvIEfDRxcCspk+x5LakeyiOh90fJC70+E72PhEtKHSYvjoLZ9pYtUARUVFaLfQG
p7RTS+px69y4nCYuQp4zCAMpzRaTBSSGHAatg+W7G+SIAtfd/wbCgkrG3Y9f9SGk
V9thHtcPP8+1j/HhkIipX9Fh0Skyow==
=OJEv
-----END PGP SIGNATURE-----

--Sig_/2ARaGh/=BsU+UGXvuPb+u_l--
