From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the akpm-current tree with the
 parisc-hd tree
Date: Thu, 2 May 2019 19:11:19 +1000
Message-ID: <20190502191119.2707499f@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/BsfIab0PZhRmkZAhb4BTTxp"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Andrew Morton <akpm@linux-foundation.org>, Helge Deller <deller@gmx.de>
Cc: Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Christoph Hellwig <hch@lst.de>
List-Id: linux-next.vger.kernel.org

--Sig_/BsfIab0PZhRmkZAhb4BTTxp
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the akpm-current tree got a conflict in:

  arch/parisc/mm/init.c

between commit:

  1fb55c4cf4e6 ("parisc: Enable SPARSEMEM_VMEMMAP")

from the parisc-hd tree and commit:

  2e5adbd9e97a ("initramfs: provide a generic free_initrd_mem implementatio=
n")

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

diff --cc arch/parisc/mm/init.c
index 6d29eb22d460,437d4c35c562..000000000000
--- a/arch/parisc/mm/init.c
+++ b/arch/parisc/mm/init.c
@@@ -927,18 -921,3 +927,11 @@@ void flush_tlb_all(void
  	spin_unlock(&sid_lock);
  }
  #endif
 +
- #ifdef CONFIG_BLK_DEV_INITRD
- void free_initrd_mem(unsigned long start, unsigned long end)
- {
- 	free_reserved_area((void *)start, (void *)end, -1, "initrd");
- }
- #endif
-=20
 +#if defined(CONFIG_SPARSEMEM_VMEMMAP)
 +int __meminit vmemmap_populate(unsigned long vstart, unsigned long vend,
 +			       int node, struct vmem_altmap *altmap)
 +{
 +	return vmemmap_populate_basepages(vstart, vend, node);
 +}
 +#endif

--Sig_/BsfIab0PZhRmkZAhb4BTTxp
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAlzKtDcACgkQAVBC80lX
0GxBzQf/aVRtbemK5KkZpF1uc7l8rw8TQAKfmSjJAb2MNgsCw61ZhPWpBE2mThNo
BxUOofS2A0ykz34jPLM5RsmctAgYqcKNzx8+ErzQcZYOcB3GmIxNrUiFB+wFhcGa
X1r5FAO/tkqR64pi96LwLA0Ny6vmfFvZjTsW4W8ha/33X9rdMde/4rQu16ASbIuz
+fIM9qjeJkB9WFQ5D+R7L7tlyEwiGCNoD86Pq5FMkMB8LwN2kYmxKs/gfCyWOgdN
KZJFAZ5TLS3/QuhwPOMVx9ktXm6yL2CnrBRtJSOfuEJP7Gi046hZdMWG4AWjbsLm
iN2ZhM//dRFcwxLqENi2JfIuOQ2wVw==
=md76
-----END PGP SIGNATURE-----

--Sig_/BsfIab0PZhRmkZAhb4BTTxp--
