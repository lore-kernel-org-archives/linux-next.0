From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the akpm-current tree with the pidfd
 tree
Date: Wed, 15 May 2019 13:16:29 +1000
Message-ID: <20190515131629.405837b0@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/pJ_20YllzkTvP8BoZaX1AE/"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Andrew Morton <akpm@linux-foundation.org>, Christian Brauner <christian@brauner.io>
Cc: Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, "Joel Fernandes (Google)" <joel@joelfernandes.org>
List-Id: linux-next.vger.kernel.org

--Sig_/pJ_20YllzkTvP8BoZaX1AE/
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the akpm-current tree got a conflict in:

  include/linux/pid.h

between commit:

  51f1b521a515 ("pidfd: add polling support")

from the pidfd tree and commit:

  c02e28a1bb18 ("kernel/pid.c: convert struct pid:count to refcount_t")

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

diff --cc include/linux/pid.h
index 1484db6ca8d1,0be5829ddd80..000000000000
--- a/include/linux/pid.h
+++ b/include/linux/pid.h
@@@ -3,7 -3,7 +3,8 @@@
  #define _LINUX_PID_H
 =20
  #include <linux/rculist.h>
 +#include <linux/wait.h>
+ #include <linux/refcount.h>
 =20
  enum pid_type
  {

--Sig_/pJ_20YllzkTvP8BoZaX1AE/
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAlzbhI0ACgkQAVBC80lX
0GzTiggAlOOvTzElTR5o4UckTt3ds7Iko11bpza1zqLRhR5XN2Wgo0CTP9FDHvaN
MtXdFlHIRF2NKE8bbQc6ndHOorS2afTq8T4k2TU9vF32ZvviRa10jsjb7F+RzFpi
S3VDA+er2ZvzOw4237yMiIB4MxptyDLjGn5IBaCkWW2KybCn7pqkTpAXLASg7Lhb
bZ0ajPxX3Xtk/TSSSPtJ6XMZMuPvIHYYybluZ0GQi98WwXu8bVRP5baeu0kDbEda
oOoXcEn2MELXeb9P05OdZJf54Z/sQDmOvOcOQ/E0lK9t6vFFXMhBneKcit+AJFTq
27HgHGUiuUse+9BOoBd2ntHNh8XPoQ==
=DZqo
-----END PGP SIGNATURE-----

--Sig_/pJ_20YllzkTvP8BoZaX1AE/--
