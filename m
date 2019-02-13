From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the vhost tree with the swiotlb tree
Date: Wed, 13 Feb 2019 15:25:22 +1100
Message-ID: <20190213152522.6c67cb50@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/pjW_eHSfVgjH1o=fa1_y4vI"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: "Michael S. Tsirkin" <mst@redhat.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>
Cc: Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Dongli Zhang <dongli.zhang@oracle.com>, Joerg Roedel <jroedel@suse.de>
List-Id: linux-next.vger.kernel.org

--Sig_/pjW_eHSfVgjH1o=fa1_y4vI
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the vhost tree got a conflict in:

  kernel/dma/swiotlb.c

between commit:

  71602fe6d4e9 ("swiotlb: add debugfs to track swiotlb buffer usage")

from the swiotlb tree and commits:

  88eec9b0e80a ("swiotlb: Introduce swiotlb_max_mapping_size()")
  7c1fd56c53d8 ("swiotlb: Add is_swiotlb_active() function")

from the vhost tree.

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
index a01b83e95a2a,c873f9cc2146..000000000000
--- a/kernel/dma/swiotlb.c
+++ b/kernel/dma/swiotlb.c
@@@ -678,35 -663,16 +678,49 @@@ swiotlb_dma_supported(struct device *hw
  	return __phys_to_dma(hwdev, io_tlb_end - 1) <=3D mask;
  }
 =20
 +#ifdef CONFIG_DEBUG_FS
 +
 +static int __init swiotlb_create_debugfs(void)
 +{
 +	static struct dentry *d_swiotlb_usage;
 +	struct dentry *ent;
 +
 +	d_swiotlb_usage =3D debugfs_create_dir("swiotlb", NULL);
 +
 +	if (!d_swiotlb_usage)
 +		return -ENOMEM;
 +
 +	ent =3D debugfs_create_ulong("io_tlb_nslabs", 0400,
 +				   d_swiotlb_usage, &io_tlb_nslabs);
 +	if (!ent)
 +		goto fail;
 +
 +	ent =3D debugfs_create_ulong("io_tlb_used", 0400,
 +				   d_swiotlb_usage, &io_tlb_used);
 +	if (!ent)
 +		goto fail;
 +
 +	return 0;
 +
 +fail:
 +	debugfs_remove_recursive(d_swiotlb_usage);
 +	return -ENOMEM;
 +}
 +
 +late_initcall(swiotlb_create_debugfs);
 +
 +#endif
++
+ size_t swiotlb_max_mapping_size(struct device *dev)
+ {
+ 	return ((size_t)1 << IO_TLB_SHIFT) * IO_TLB_SEGSIZE;
+ }
+=20
+ bool is_swiotlb_active(void)
+ {
+ 	/*
+ 	 * When SWIOTLB is initialized, even if io_tlb_start points to physical
+ 	 * address zero, io_tlb_end surely doesn't.
+ 	 */
+ 	return io_tlb_end !=3D 0;
+ }

--Sig_/pjW_eHSfVgjH1o=fa1_y4vI
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAlxjnDIACgkQAVBC80lX
0GxH6Af/ZJP1ha+yKx6yIb69Ve/OoDgXxgrLy40PLM49eWdmafMWnETZ8XpWEG7q
naF000apBc7XhRLUvN3Ws6F8Q1XVC9Cy+Mb2rtXf8MytoQRvq6N/qBVjw5RYEoNS
ry/FzVxAWHyhLa1zpRq5uiyBu2nvpbS6YxWjHev9ELEK6AaR5PplLwaH2czneqqB
AhoODBjv0lbI3YszltuR475IJY21KRFSmcxvrsgFvMY1CcdqC1deAl8GOtCs49vB
Xcp/MMUN+yj7OPCTqgO6V38K0A5FeE4eb7XaNi6xBYBWW+IXKNqhqoHbECwXXpfF
m8LThsj7GRadqhLIAYQALzCvayABGg==
=W1Nc
-----END PGP SIGNATURE-----

--Sig_/pjW_eHSfVgjH1o=fa1_y4vI--
