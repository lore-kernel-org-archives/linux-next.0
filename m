From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build failure after merge of the akpm tree
Date: Tue, 2 Oct 2018 18:53:42 +1000
Message-ID: <20181002185342.133d1680@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/XOzwBmrLsNAlV/2oQwUR6RP"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Andrew Morton <akpm@linux-foundation.org>, Christoph Hellwig <hch@lst.de>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Mike Rapoport <rppt@linux.vnet.ibm.com>
List-Id: linux-next.vger.kernel.org

--Sig_/XOzwBmrLsNAlV/2oQwUR6RP
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the akpm tree, today's linux-next build (x86_64 allnoconfig)
failed like this:


Caused by commit

  a20bb0583751 ("dma-direct: add an explicit dma_direct_get_required_mask")

from the dma-mappgin tree conflicting with patch

  "mm: remove include/linux/bootmem.h"

I have applied the following merge fix patch for today.

From: Stephen Rothwell <sfr@canb.auug.org.au>
Date: Tue, 2 Oct 2018 18:49:02 +1000
Subject: [PATCH] dma-direct: fix up for the removal of linux/bootmem.h

Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
---
 kernel/dma/direct.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/kernel/dma/direct.c b/kernel/dma/direct.c
index 170bd322a94a..5a0806b5351b 100644
--- a/kernel/dma/direct.c
+++ b/kernel/dma/direct.c
@@ -4,7 +4,7 @@
  *
  * DMA operations that map physical memory directly without using an IOMMU.
  */
-#include <linux/bootmem.h> /* for max_pfn */
+#include <linux/memblock.h> /* for max_pfn */
 #include <linux/export.h>
 #include <linux/mm.h>
 #include <linux/dma-direct.h>
--=20
2.18.0

--=20
Cheers,
Stephen Rothwell

--Sig_/XOzwBmrLsNAlV/2oQwUR6RP
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAluzMhYACgkQAVBC80lX
0GwaQggAoSKJfRTylU9H21au6O8T4j6ONyJpznVhZRteE3Gg7UOFI5EzfuGFt5kt
ZDOIAzP3OGWMAO7IZX9qHT/9XCltqNj8Xw2cwGIQQOuR04PfH2qUVHZXRgPmyZBC
G1unOGMYEE393Gp09ZbSgJbp5wE7DIkIcnvq79oBCiUVCdEJUOaWn5K+Jfx2EuKx
lGmuw5i9Yil3tZzA5g6AlqnHqejKX8L8gg5pBDUAzBkmqqhWjy0rH8qrR03J1YFb
QxjrWIQPELldt53gXmu3Rw34xe950Rr+gmmqED8+1t1MHOgQ1FtAz7HlBGMon59d
IRApuehGc1ddzC8RQxO+nZX8PgD4MA==
=xWa1
-----END PGP SIGNATURE-----

--Sig_/XOzwBmrLsNAlV/2oQwUR6RP--
