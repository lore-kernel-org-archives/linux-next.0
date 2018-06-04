From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the akpm-current tree with the nvdimm
 tree
Date: Mon, 4 Jun 2018 20:24:53 +1000
Message-ID: <20180604202453.77342f89@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/TZk9mjDh4uUYDCplwBFdHU_"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Andrew Morton <akpm@linux-foundation.org>, Dan Williams <dan.j.williams@intel.com>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Souptick Joarder <jrdr.linux@gmail.com>, Matthew Wilcox <mawilcox@microsoft.com>
List-Id: linux-next.vger.kernel.org

--Sig_/TZk9mjDh4uUYDCplwBFdHU_
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the akpm-current tree got a conflict in:

  fs/dax.c

between commit:

  cc4a90ac816e ("dax: dax_insert_mapping_entry always succeeds")

from the nvdimm tree and commit:

  aa726309bde7 ("fs/dax.c: add new return type vm_fault_t")

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

diff --cc fs/dax.c
index d6b01de7f881,821986c61f7e..000000000000
--- a/fs/dax.c
+++ b/fs/dax.c
@@@ -1017,8 -910,9 +1017,8 @@@ static vm_fault_t dax_load_hole(struct=20
  {
  	struct inode *inode =3D mapping->host;
  	unsigned long vaddr =3D vmf->address;
- 	int ret =3D VM_FAULT_NOPAGE;
+ 	vm_fault_t ret =3D VM_FAULT_NOPAGE;
  	struct page *zero_page;
 -	void *entry2;
  	pfn_t pfn;
 =20
  	zero_page =3D ZERO_PAGE(0);
@@@ -1028,9 -922,14 +1028,9 @@@
  	}
 =20
  	pfn =3D page_to_pfn_t(zero_page);
 -	entry2 =3D dax_insert_mapping_entry(mapping, vmf, entry, pfn,
 -			RADIX_DAX_ZERO_PAGE, false);
 -	if (IS_ERR(entry2)) {
 -		ret =3D VM_FAULT_SIGBUS;
 -		goto out;
 -	}
 -
 +	dax_insert_mapping_entry(mapping, vmf, entry, pfn, RADIX_DAX_ZERO_PAGE,
 +			false);
- 	vm_insert_mixed(vmf->vma, vaddr, pfn);
+ 	ret =3D vmf_insert_mixed(vmf->vma, vaddr, pfn);
  out:
  	trace_dax_load_hole(inode, vmf, ret);
  	return ret;

--Sig_/TZk9mjDh4uUYDCplwBFdHU_
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAlsVE3UACgkQAVBC80lX
0Gyafgf8CcqimsaErJyvfatf91bE+Nzma8jdtaTr6F3tghRyL5hnCr7i3tGJXrX4
1P2tAVgehWg5txNVsfYjggfXexnfemZnWk3lYawCiC7DQVKfC7+Y5Xh/sUA4LGeZ
QsydgOLJF8Vu726XC6+3qkO3baMllNI798x5+p2Em+nu4daQEuVbLFe53wWOEJGA
H/qcPgq+jxvespKLtG732/1jw6Pn3oRQg3Kf49jFq6eKVOLO93LUQFPGq8BmY/Ds
Mby1WH3PBQ672GGGbjUhQEBUvs+DCB4pp+sdFJFcXnVYZ73BuRqZRpGJOmFCo6Ld
K/zTV3QGnt+AIOmX9sntQ527ctRZew==
=YFF2
-----END PGP SIGNATURE-----

--Sig_/TZk9mjDh4uUYDCplwBFdHU_--
