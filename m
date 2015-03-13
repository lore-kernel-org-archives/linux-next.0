From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build failure after merge of the vfs tree
Date: Fri, 13 Mar 2015 12:02:50 +1100
Message-ID: <20150313120250.5ce08f77@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/Kf6FmTbLMVK_qqsaDAutqjV"; protocol="application/pgp-signature"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:49082 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752300AbbCMBC5 (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Thu, 12 Mar 2015 21:02:57 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Al Viro <viro@ZenIV.linux.org.uk>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Christoph Hellwig <hch@lst.de>, Theodore Ts'o <tytso@mit.edu>

--Sig_/Kf6FmTbLMVK_qqsaDAutqjV
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Al,

After merging the vfs tree, today's linux-next build (arm
multi_v7_defconfig) failed like this:

fs/ext4/indirect.c: In function 'ext4_ind_direct_IO':
fs/ext4/indirect.c:653:2: error: implicit declaration of function 'iov_iter=
_count' [-Werror=3Dimplicit-function-declaration]
  size_t count =3D iov_iter_count(iter);
  ^

Caused by commit 3737c63e1fb0 ("fs: move struct kiocb to fs.h").  aio.h
used to include uio.h ...

I wonder if there is more fallout from this include file diet.

It would have been nice if the more general changes to aio.h were in a
separate patch.

I added the following patch for today:

From: Stephen Rothwell <sfr@canb.auug.org.au>
Date: Fri, 13 Mar 2015 11:56:46 +1100
Subject: [PATCH] ext4: iov_iter_count needs linux/uio.h

Fixes: 3737c63e1fb0 ("fs: move struct kiocb to fs.h")
Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
---
 fs/ext4/indirect.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/fs/ext4/indirect.c b/fs/ext4/indirect.c
index 33308738a06a..a9369e5d2cc1 100644
--- a/fs/ext4/indirect.c
+++ b/fs/ext4/indirect.c
@@ -20,6 +20,8 @@
  *	(sct@redhat.com), 1993, 1998
  */
=20
+#include <linux/uio.h>
+
 #include "ext4_jbd2.h"
 #include "truncate.h"
=20
--=20
2.1.4

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au

--Sig_/Kf6FmTbLMVK_qqsaDAutqjV
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJVAjc+AAoJEMDTa8Ir7ZwV1w4P/ishiRWYRt8sMBHLJxHnonCv
65Og4yN7Um9MLt2x1bgq9/AIjSrk0zmEJ/E8S2dHyJgTlQ4JvJgvry81ADhgMoA1
Gap6yDM/qn/Y4+xiNFhe+yYoplL4meKiujtYmenwluyEytihnsaVFFB6PKL8H20G
qwG876QusJXyaflp0a/BaOrRquMPadOx6hDh/zO79/R8yqezRRrukhtI18sMJ56E
HpYcvtX8RwXZ4TlluKQDDayOiKwBmgdv+YslldineliHshCPNEIqimLRGk0yjeHF
qtw9GV9aoZcDPrPm6i9s1vDQr5TqCzIy9s7PQVPop8yGT3G6NIxKZVGjmtI2kEa2
l0QShP/BM4++3nyCXuWyMdFt0N+ublj5QDgREV9tHfVPRp+xBANpNCyEZz2XZvK1
Kid8uSicmT2je2q+8akzjooSDu18Kq5YhGSgkRaWcq3D9PFaAmPuhQu4FQACdblk
7byHiB3uKRLr0wR/HeR5/xVvSBBIvyAAlbuOSok6PGWshUjfZvo8raYhERs6hc/D
y49PLA3XbQhJ5dV1XakdiHXxDuVqWmFCGiLLAs24TCeHNI56pDJmHEEKaLSKZyXF
xngyZeE2pTh67qxksjZggA9+xwdEYwANqdeKRaR06BwUk4QCnaphUE3XrV0+BJdV
JwTyx6W0+1jSfHuXjnA4
=sSSN
-----END PGP SIGNATURE-----

--Sig_/Kf6FmTbLMVK_qqsaDAutqjV--
