From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: Fixes tags need some work in the dma-mapping-fixes tree
Date: Wed, 23 Jan 2019 07:47:47 +1100
Message-ID: <20190123074747.7cd44f12@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/CK4k=jgeOHMH5thyPPH/3Aq"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Christoph Hellwig <hch@lst.de>
Cc: Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Ming Lei <ming.lei@redhat.com>
List-Id: linux-next.vger.kernel.org

--Sig_/CK4k=jgeOHMH5thyPPH/3Aq
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Christoph,

In commit

  702e8ed37bed ("arm64/xen: fix xen-swiotlb cache flushing")

Fixes tag

  Fixes: 356da6d0cd ("dma-mapping: bypass indirect calls for dma-direct")

has these problem(s):

  - SHA1 should be at least 12 digits long

In commit

  8218a55b6b91 ("sbitmap: Protect swap_lock from hardirq")

Fixes tag

  Fixes: ab53dcfb3e7b ("sbitmap: Protect swap_lock from hardirq")

has these problem(s):

  - Target SHA1 does not exist

This later patch appears to already be in Linus' tree as commit
fe76fc6aaf53 (also with an incorrect Fixes tag :-()
--=20
Cheers,
Stephen Rothwell

--Sig_/CK4k=jgeOHMH5thyPPH/3Aq
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEyBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAlxHgXMACgkQAVBC80lX
0GzdVwfzBSAaOs6h6+x8kDJOJjNyrNr+XbSoYpBDSfn+MsNXg05eHk98BCL+J2Nc
EsQb9IatERBPuFXzwFDMbkUjLAGVHJlEDswJoKChkVhAyox+2lvQBavnxio4w7VB
P+LNW/Top5txr82Xgutm0uLB5OfElEi8gUM4E5HL0Til6VqkCUOExQmGB975ZRpA
xyD4WEfVf5K+2MEPe7g3IsZ88ds0U2xVwxfAWur5r8x34cqQ74+dWd78t/d5xtll
SMJ+qyggDCDcWkS72vZhs37D4VM9Dyo1/Zu7Y1eYd8pXPA0unU6E6JIt1cD/hNpW
ZdAWpFg+lN/Vn6RmQPwsfactkl8Y
=90Ai
-----END PGP SIGNATURE-----

--Sig_/CK4k=jgeOHMH5thyPPH/3Aq--
