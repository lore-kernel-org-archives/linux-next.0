From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the devicetree tree with the c6x tree
Date: Wed, 3 Oct 2018 15:37:33 +1000
Message-ID: <20181003153733.6c332851@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/FWM3=nW36cr3FNcbzwyBFcC"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robherring2@gmail.com>, Mark Salter <msalter@redhat.com>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Mike Rapoport <rppt@linux.vnet.ibm.com>
List-Id: linux-next.vger.kernel.org

--Sig_/FWM3=nW36cr3FNcbzwyBFcC
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the devicetree tree got a conflict in:

  arch/c6x/kernel/setup.c

between commit:

  31b02fe54206 ("c6x: switch to NO_BOOTMEM")

from the c6x tree and commit:

  be7cd2df1d22 ("c6x: use common built-in dtb support")

from the devicetree tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

--=20
Cheers,
Stephen Rothwell

diff --cc arch/c6x/kernel/setup.c
index cc74cb9d349b,05d96a9541b5..000000000000
--- a/arch/c6x/kernel/setup.c
+++ b/arch/c6x/kernel/setup.c
@@@ -352,7 -348,17 +347,7 @@@ void __init setup_arch(char **cmdline_p
  	init_mm.end_data   =3D memory_start;
  	init_mm.brk        =3D memory_start;
 =20
- 	unflatten_device_tree();
 -	/*
 -	 * Give all the memory to the bootmap allocator,  tell it to put the
 -	 * boot mem_map at the start of memory
 -	 */
 -	bootmap_size =3D init_bootmem_node(NODE_DATA(0),
 -					 memory_start >> PAGE_SHIFT,
 -					 PAGE_OFFSET >> PAGE_SHIFT,
 -					 memory_end >> PAGE_SHIFT);
 -	memblock_reserve(memory_start, bootmap_size);
 -
+ 	unflatten_and_copy_device_tree();
 =20
  	c6x_cache_init();
 =20

--Sig_/FWM3=nW36cr3FNcbzwyBFcC
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAlu0VZ4ACgkQAVBC80lX
0GyucwgAhj1e6eMoCNKwjYlfDGE/XJtjG9HYCaj0xxAFvBEmuFHBVS+vE4H6TiTs
co6dzZJAWva/ZEnhMYz5KNNEfPWWWVhGgZoBDmHxZYH594MW3fpV3wVmlCMRmdCs
Z95tP0mQnYDvvN06ZsTQnbjW1sS9NMpbw+c7YW3U/ZNPmVjXAT+SX0TFcVAl9ycl
p44y0Titjsjp8eGakc3/OC4IX7fcUfA4XqmMocCsYMZf+7i3A4uhQeitBXmB74dJ
BXrqxBkDAO/DwOLSOYCkmC9xShh5/zOsz7Mgy6r9o+iiNUCvOvVQ+M7MPJ1zXCWn
1W42JOKUK/HYBPiOzAcXfUFcFBZtBA==
=9pEw
-----END PGP SIGNATURE-----

--Sig_/FWM3=nW36cr3FNcbzwyBFcC--
