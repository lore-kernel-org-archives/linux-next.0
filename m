From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the akpm-current tree with the
 parisc-hd tree
Date: Thu, 9 May 2019 15:33:56 +1000
Message-ID: <20190509153356.2b70fd73@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/QjPicI=x3mHS9imXhZXvRJN"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Andrew Morton <akpm@linux-foundation.org>, Helge Deller <deller@gmx.de>, Parisc List <linux-parisc@vger.kernel.org>
Cc: Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Christoph Hellwig <hch@lst.de>
List-Id: linux-next.vger.kernel.org

--Sig_/QjPicI=x3mHS9imXhZXvRJN
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the akpm-current tree got a conflict in:

  arch/parisc/mm/init.c

between commit:

  98429dded340 ("parisc: Enable SPARSEMEM_VMEMMAP")

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
index 6fa6d3b1d3f4,437d4c35c562..000000000000
--- a/arch/parisc/mm/init.c
+++ b/arch/parisc/mm/init.c
@@@ -928,18 -921,3 +928,11 @@@ void flush_tlb_all(void
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
 +#if defined(CONFIG_SPARSEMEM) && defined(CONFIG_SPARSEMEM_VMEMMAP)
 +int __meminit vmemmap_populate(unsigned long vstart, unsigned long vend,
 +			       int node, struct vmem_altmap *altmap)
 +{
 +	return vmemmap_populate_basepages(vstart, vend, node);
 +}
 +#endif

--Sig_/QjPicI=x3mHS9imXhZXvRJN
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAlzTu8QACgkQAVBC80lX
0GwSLwf+NA/WKMZENE+LkwTWsh+yMyZ4yH/WElavw9yW1CNQBR4+n2UPoCV3VWb+
VGw37VOcUtK3R8ho7mvnq8UY7qXLU8J9UQrui6B4VpG2+na9LgPK/Bva4xvJVUm5
u0CKTuwxG4VyOrWH2zJR8YmocnIn4yu+1MXKQ+SSBOdNoGihDLb6hUF5OVVj5Sna
3P7uP3lDEZVbs1I68414MzMfZkFeTjsdDmRMWnD4fzwZeNXT5hIjOg3ZktqcIXgO
Y+ZkBNH5SLY5mJmTdrvitZnAE9v0Xbg04D51dCNBenAD4by7z4pUUSRFod3C1mcs
wLawNhPu7QU3Q6oDj+JNHdULuGGneQ==
=rE2q
-----END PGP SIGNATURE-----

--Sig_/QjPicI=x3mHS9imXhZXvRJN--
