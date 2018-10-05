From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the akpm-current tree with the
 btrfs-kdave tree
Date: Fri, 5 Oct 2018 15:47:21 +1000
Message-ID: <20181005154721.4bfde639@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/9MuZ1CGvPDQ=JH1fxbzSw/i"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Andrew Morton <akpm@linux-foundation.org>, David Sterba <dsterba@suse.cz>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Omar Sandoval <osandov@fb.com>, Huang Ying <ying.huang@intel.com>
List-Id: linux-next.vger.kernel.org

--Sig_/9MuZ1CGvPDQ=JH1fxbzSw/i
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the akpm-current tree got a conflict in:

  include/linux/swap.h

between commit:

  0f83d16b8f1f ("mm: split SWP_FILE into SWP_ACTIVATED and SWP_FS")

from the btrfs-kdave tree and commit:

  26833300651e ("mm, swap: fix race between swapoff and some swap operation=
s")

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

diff --cc include/linux/swap.h
index 4fff094dbd53,f32f94639b13..000000000000
--- a/include/linux/swap.h
+++ b/include/linux/swap.h
@@@ -167,14 -167,14 +167,15 @@@ enum=20
  	SWP_SOLIDSTATE	=3D (1 << 4),	/* blkdev seeks are cheap */
  	SWP_CONTINUED	=3D (1 << 5),	/* swap_map has count continuation */
  	SWP_BLKDEV	=3D (1 << 6),	/* its a block device */
 -	SWP_FILE	=3D (1 << 7),	/* set after swap_activate success */
 -	SWP_AREA_DISCARD =3D (1 << 8),	/* single-time swap area discards */
 -	SWP_PAGE_DISCARD =3D (1 << 9),	/* freed swap page-cluster discards */
 -	SWP_STABLE_WRITES =3D (1 << 10),	/* no overwrite PG_writeback pages */
 -	SWP_SYNCHRONOUS_IO =3D (1 << 11),	/* synchronous IO is efficient */
 -	SWP_VALID	=3D (1 << 12),	/* swap is valid to be operated on? */
 +	SWP_ACTIVATED	=3D (1 << 7),	/* set after swap_activate success */
 +	SWP_FS		=3D (1 << 8),	/* swap file goes through fs */
 +	SWP_AREA_DISCARD =3D (1 << 9),	/* single-time swap area discards */
 +	SWP_PAGE_DISCARD =3D (1 << 10),	/* freed swap page-cluster discards */
 +	SWP_STABLE_WRITES =3D (1 << 11),	/* no overwrite PG_writeback pages */
 +	SWP_SYNCHRONOUS_IO =3D (1 << 12),	/* synchronous IO is efficient */
++	SWP_VALID	=3D (1 << 13),	/* swap is valid to be operated on? */
  					/* add others here before... */
--	SWP_SCANNING	=3D (1 << 13),	/* refcount in scan_swap_map */
++	SWP_SCANNING	=3D (1 << 14),	/* refcount in scan_swap_map */
  };
 =20
  #define SWAP_CLUSTER_MAX 32UL
@@@ -297,15 -297,20 +298,15 @@@ struct vma_swap_readahead=20
 =20
  /* linux/mm/workingset.c */
  void *workingset_eviction(struct address_space *mapping, struct page *pag=
e);
- bool workingset_refault(void *shadow);
+ void workingset_refault(struct page *page, void *shadow);
  void workingset_activation(struct page *page);
 =20
 -/* Do not use directly, use workingset_lookup_update */
 -void workingset_update_node(struct radix_tree_node *node);
 -
 -/* Returns workingset_update_node() if the mapping has shadow entries. */
 -#define workingset_lookup_update(mapping)				\
 -({									\
 -	radix_tree_update_node_t __helper =3D workingset_update_node;	\
 -	if (dax_mapping(mapping) || shmem_mapping(mapping))		\
 -		__helper =3D NULL;					\
 -	__helper;							\
 -})
 +/* Only track the nodes of mappings with shadow entries */
 +void workingset_update_node(struct xa_node *node);
 +#define mapping_set_update(xas, mapping) do {				\
 +	if (!dax_mapping(mapping) && !shmem_mapping(mapping))		\
 +		xas_set_update(xas, workingset_update_node);		\
 +} while (0)
 =20
  /* linux/mm/page_alloc.c */
  extern unsigned long totalram_pages;

--Sig_/9MuZ1CGvPDQ=JH1fxbzSw/i
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAlu2+ukACgkQAVBC80lX
0Gy9SAf/TRcZunFAOZ6z1fjHrLXEvd2qhdJuSLN1RNhCIi3TpRRqbRLxpDZoT4X2
Ts1zm85ww2X0Eggz1S4PfsBLIau64FTL74HnHGUxvKU/PHo6PxlqWQmV+klgjdAV
oRzbe5zshUEWLNvOwmPCsjv2cU53GTmF68JA0PG8/4lJvVlU29pIfEoIdb8BHJBo
IY9QPxJHHvAg7rnfMSTMOkigHP8e20QkcQOEoBd2nj5Otp0w7kCtnRf6E4tjkN2k
xLgWhVv9fHx0DrK/FgRTcC6Nlhsa2RPuTPLhVxW3oRufPnZ9FpnSpFt9T96jvjQV
6pSvHktLBZpvojJQLH4AuxCmFVG8uA==
=SEmn
-----END PGP SIGNATURE-----

--Sig_/9MuZ1CGvPDQ=JH1fxbzSw/i--
