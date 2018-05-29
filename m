From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the dma-mapping tree with Linus' tree
Date: Wed, 30 May 2018 09:20:27 +1000
Message-ID: <20180530092027.510bd34a@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/6CfB4MlC/ShTASRvm=ezsW="; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Christoph Hellwig <hch@lst.de>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Greentime Hu <greentime@andestech.com>
List-Id: linux-next.vger.kernel.org

--Sig_/6CfB4MlC/ShTASRvm=ezsW=
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Christoph,

Today's linux-next merge of the dma-mapping tree got a conflict in:

  arch/nds32/Kconfig

between commit:

  aeaa7af744fa ("nds32: lib: To use generic lib instead of libgcc to preven=
t the symbol undefined issue.")

from Linus' tree and commit:

  267d2e18a281 ("nds32: use generic dma_noncoherent_ops")

from the dma-mapping tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

--=20
Cheers,
Stephen Rothwell

diff --cc arch/nds32/Kconfig
index b7404f2dcf5b,67d0ac0a989c..000000000000
--- a/arch/nds32/Kconfig
+++ b/arch/nds32/Kconfig
@@@ -9,12 -11,7 +11,13 @@@ config NDS3
  	select CLKSRC_MMIO
  	select CLONE_BACKWARDS
  	select COMMON_CLK
+ 	select DMA_NONCOHERENT_OPS
 +	select GENERIC_ASHLDI3
 +	select GENERIC_ASHRDI3
 +	select GENERIC_LSHRDI3
 +	select GENERIC_CMPDI2
 +	select GENERIC_MULDI3
 +	select GENERIC_UCMPDI2
  	select GENERIC_ATOMIC64
  	select GENERIC_CPU_DEVICES
  	select GENERIC_CLOCKEVENTS

--Sig_/6CfB4MlC/ShTASRvm=ezsW=
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAlsN4DsACgkQAVBC80lX
0GzFAAf+NQxEvchUDErdqIPcuX8NSsb7gnMqqY0bTSv7Gcgb43GZibYUxulYi9/w
fTt4QNhIMzePHeJN1PNnDhPlwXT7pQ98o8i6PNzWbPoBZp6Cq/pXLV90Zf9o/e3h
xGPYkxGEWyFIAY/w6cxLyaTsmO0QKD2iK+rk5fCGQwSjBahAj/JHwBhaXb4eyy+B
QbZJPHGvAtMVFqB01+B5n5Pw/c32wHvbBAOhk5NczbIKWrenQa7PZBH2D0RNbB4Y
YKKrQwScsd/SeKXgNtsKumzlvw6cl2rTTHOIyw4zT7KgF/h4j0Ur+uN7vD1Y06vX
Mjlt73cLMWupSUG6xnCzjyHxBzh6Eg==
=6ZQM
-----END PGP SIGNATURE-----

--Sig_/6CfB4MlC/ShTASRvm=ezsW=--
