From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build failure after merge of the akpm-current tree
Date: Fri, 13 Mar 2015 17:07:10 +1100
Message-ID: <20150313170710.0de23cfb@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/_VfohrJ9vEbl629hcW/Uy9p"; protocol="application/pgp-signature"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:32785 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751330AbbCMGHR (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Fri, 13 Mar 2015 02:07:17 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Alexander Kuleshov <kuleshovmail@gmail.com>

--Sig_/_VfohrJ9vEbl629hcW/Uy9p
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Andrew,

After merging the akpm-current tree, today's linux-next build (powerpc
ppc64_defconfig) failed like this:

fs/fat/inode.c: In function 'fat_direct_IO':
fs/fat/inode.c:252:2: error: implicit declaration of function 'iov_iter_cou=
nt' [-Werror=3Dimplicit-function-declaration]
  size_t count =3D iov_iter_count(iter);
  ^

Caused by commit be33247df543 ("fs/fat: remove unnecessary includes").
Removing include files deemed "unnecessary" is fraught.  Please see
Rule 1 in Documentation/SubmitChecklist.

I have added the following fix patch for today:

From: Stephen Rothwell <sfr@canb.auug.org.au>
Date: Fri, 13 Mar 2015 17:00:15 +1100
Subject: [PATCH] fs/fat: put one actually necessary include file back

Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
---
 fs/fat/inode.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/fs/fat/inode.c b/fs/fat/inode.c
index 2c99d01a7018..c71b00fbca28 100644
--- a/fs/fat/inode.c
+++ b/fs/fat/inode.c
@@ -16,6 +16,7 @@
 #include <linux/vfs.h>
 #include <linux/seq_file.h>
 #include <linux/parser.h>
+#include <linux/uio.h>
 #include <linux/blkdev.h>
 #include <asm/unaligned.h>
 #include "fat.h"
--=20
2.1.4

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au

--Sig_/_VfohrJ9vEbl629hcW/Uy9p
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJVAn6SAAoJEMDTa8Ir7ZwVaeYP+gPRa4bWJlOXzXYWc+PsXbyD
PsSqyuk9IEDsu0PzW5MgS8/6rrW9y9PwUf+9nrijk4Cw/Ht8W4kKAc7FLiWvyrK3
Y0nBYDT37F5GZWeKGCEnLmXTeIGr3CLNczEAw8iES9wWStg/FBz4vhwt9n3l3FxM
wlBfYDY4QU35eWYeOh84k3e+tvXdtRTkbhDeuGSt8MwCG6Mu995ZqY3iLhfqqAtx
ho3FRlYmQqnRoi6yMPaoia8+Gsg4YvF9l7l8fqRmIqfeHrqW37zTqDjquMZJbZmD
65ioSNDs0FPKowZw/vV0Gd2x2A8TUqCz0cxT7iowmAT/0Vz2/gjwfJFWRlnGFJgH
CVJQ5/DZhIuSvWvVfTEiYN6gFFtQmrlgx6xh1BOdncz2X8OQpv3Mz9VfaWSwVMkB
mWkHPqlds0Dwu+2HA/3LEc+yxTAFf0WKUfk70VXnMZg3mY6O8ZjkZ73Cis0LMIuc
crF/VISbdemWu3YR3EFTFPacSTvzyh89c4IUt7zte5Ql3SItIe0QflWNhs3nhYQ4
mnX2DM/LX7ai00ELmJY91jfH/eanvyPXXxuqf3blTFfXrhkIFilvDPIYL9ZwCAp8
BqcD9rVOJmeFA+m3oJt/BdVTbAOVU6rVLBz4vQcF0UEJXMDmexR624R3h4F4bEQc
rR2yFadPBW3URskRQosI
=WYb+
-----END PGP SIGNATURE-----

--Sig_/_VfohrJ9vEbl629hcW/Uy9p--
