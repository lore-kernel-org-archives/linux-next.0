From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the swiotlb tree with the powerpc tree
Date: Fri, 22 Feb 2019 11:36:24 +1100
Message-ID: <20190222113624.2499244a@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/D.FtqSliWbppHni_zlh.hJy"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, Michael Ellerman <mpe@ellerman.id.au>, Benjamin Herrenschmidt <benh@kernel.crashing.org>, PowerPC <linuxppc-dev@lists.ozlabs.org>
Cc: Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Christoph Hellwig <hch@lst.de>, Dongli Zhang <dongli.zhang@oracle.com>
List-Id: linux-next.vger.kernel.org

--Sig_/D.FtqSliWbppHni_zlh.hJy
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the swiotlb tree got a conflict in:

  kernel/dma/swiotlb.c

between commit:

  feee96440c9c ("swiotlb: remove swiotlb_dma_supported")

from the powerpc tree and commit:

  71602fe6d4e9 ("swiotlb: add debugfs to track swiotlb buffer usage")

from the swiotlb tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

--=20
Cheers,
Stephen Rothwell

diff --cc kernel/dma/swiotlb.c
index 6d0236bd3929,2b0c8fd9658e..000000000000
--- a/kernel/dma/swiotlb.c
+++ b/kernel/dma/swiotlb.c
@@@ -650,3 -665,48 +665,36 @@@ bool swiotlb_map(struct device *dev, ph
 =20
  	return true;
  }
+=20
 -/*
 - * Return whether the given device DMA address mask can be supported
 - * properly.  For example, if your device can only drive the low 24-bits
 - * during bus mastering, then you would pass 0x00ffffff as the mask to
 - * this function.
 - */
 -int
 -swiotlb_dma_supported(struct device *hwdev, u64 mask)
 -{
 -	return __phys_to_dma(hwdev, io_tlb_end - 1) <=3D mask;
 -}
 -
+ #ifdef CONFIG_DEBUG_FS
+=20
+ static int __init swiotlb_create_debugfs(void)
+ {
+ 	struct dentry *d_swiotlb_usage;
+ 	struct dentry *ent;
+=20
+ 	d_swiotlb_usage =3D debugfs_create_dir("swiotlb", NULL);
+=20
+ 	if (!d_swiotlb_usage)
+ 		return -ENOMEM;
+=20
+ 	ent =3D debugfs_create_ulong("io_tlb_nslabs", 0400,
+ 				   d_swiotlb_usage, &io_tlb_nslabs);
+ 	if (!ent)
+ 		goto fail;
+=20
+ 	ent =3D debugfs_create_ulong("io_tlb_used", 0400,
+ 				   d_swiotlb_usage, &io_tlb_used);
+ 	if (!ent)
+ 		goto fail;
+=20
+ 	return 0;
+=20
+ fail:
+ 	debugfs_remove_recursive(d_swiotlb_usage);
+ 	return -ENOMEM;
+ }
+=20
+ late_initcall(swiotlb_create_debugfs);
+=20
+ #endif

--Sig_/D.FtqSliWbppHni_zlh.hJy
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAlxvRAgACgkQAVBC80lX
0GzffggApJO0coXDf/duNk+3uQ07oCeG2X713C7Y+UjuoHMY+lbNAjKG0A7O6jF/
r1PuAyn5j1gN5eoh7t44iJQuUsG9MbKdhKbpPW5dJXCoELXcReBVOuZMOzcuHXSy
tm3ExhUBNLxZNh1bshE3aPJdkSQc68OLMn8TWVCyT060farTQZt5TVqz57sa9KSf
I8gXKNHmdUIRvlaSPUNURbCNdyUa0nUJykCSYAOb2DnYVn7V4FEFawNNc+SMzESI
ixb/42IOBbVXw+ELEIY+x8Zx7GrRbCJcb50WSS5Jwa0qRJOScMVNGMRBb+8DgVHo
DDDLxQJfxXoDo8i+CF9I1HZKH5wqrA==
=KU1q
-----END PGP SIGNATURE-----

--Sig_/D.FtqSliWbppHni_zlh.hJy--
