From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the powerpc tree with the dma-mapping
 tree
Date: Fri, 22 Feb 2019 09:25:13 +1100
Message-ID: <20190222092513.6fc2a708@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/zNp4Tra4Z_ikkK3FNtEyRzz"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Michael Ellerman <mpe@ellerman.id.au>, Benjamin Herrenschmidt <benh@kernel.crashing.org>, PowerPC <linuxppc-dev@lists.ozlabs.org>, Christoph Hellwig <hch@lst.de>
Cc: Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
List-Id: linux-next.vger.kernel.org

--Sig_/zNp4Tra4Z_ikkK3FNtEyRzz
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the powerpc tree got a conflict in:

  kernel/dma/Kconfig

between commits:

  ff4c25f26a71 ("dma-mapping: improve selection of dma_declare_coherent ava=
ilability")

from the dma-mapping tree and commit:

  11ddce15451e ("dma-mapping, powerpc: simplify the arch dma_set_mask overr=
ide")

from the powerpc tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

--=20
Cheers,
Stephen Rothwell

diff --cc kernel/dma/Kconfig
index 212aac7c675f,0711d18645de..000000000000
--- a/kernel/dma/Kconfig
+++ b/kernel/dma/Kconfig
@@@ -16,13 -16,10 +16,16 @@@ config ARCH_DMA_ADDR_T_64BI
  config ARCH_HAS_DMA_COHERENCE_H
  	bool
 =20
+ config ARCH_HAS_DMA_SET_MASK
+ 	bool
+=20
 -config HAVE_GENERIC_DMA_COHERENT
 +config DMA_DECLARE_COHERENT
 +	bool
 +
 +config ARCH_HAS_SETUP_DMA_OPS
 +	bool
 +
 +config ARCH_HAS_TEARDOWN_DMA_OPS
  	bool
 =20
  config ARCH_HAS_SYNC_DMA_FOR_DEVICE

--Sig_/zNp4Tra4Z_ikkK3FNtEyRzz
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAlxvJUkACgkQAVBC80lX
0GxiSwf/QpkrhZ2Ci6hLUg8KmKSjZGbd/tA2zE9R7AFWwQhExWsOJ0iHhdHxF2lG
KzY5YGEURbnEca9Q3pIUg4IUn14Fk97/ZK2S/EClyMku95wszM2eZL3gZOFBM5ZZ
ByaXE3Z+AUrJhov73SDJrC6Am9akrCR4WERVle66mNZ4GsoGVqOvRmS8R/yxZgC9
1pVkcru/IMaLW3uq2SlPwadUNcl4nv0rYZKGPUThraKz4zjWgpuEScbvCzvaIeLC
+IrLVQU+RIqOzWleqUaO0PrV5jevcsvsUl2AoxDEZWN/W/evx7P6+oDy2/J5sRCH
iyGDSsdCrp4K5fYtdmULWLi59xrBxg==
=bKYM
-----END PGP SIGNATURE-----

--Sig_/zNp4Tra4Z_ikkK3FNtEyRzz--
