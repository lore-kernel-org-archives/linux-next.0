From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build failure after merge of the akpm-current tree
Date: Thu, 30 May 2019 14:45:36 +1000
Message-ID: <20190530144536.7b65be9b@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/65cL.CDXbotvOfjdJoQ/zV/"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Nicholas Piggin <npiggin@gmail.com>
List-Id: linux-next.vger.kernel.org

--Sig_/65cL.CDXbotvOfjdJoQ/zV/
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the akpm-current tree, today's linux-next build (arm
multi_v7_defconfig) failed like this:


Caused by commit

  a826492f28d9 ("mm: move ioremap page table mapping function to mm/")

I have applied the following patch for today (which makes it build at
least):

From: Stephen Rothwell <sfr@canb.auug.org.au>
Date: Thu, 30 May 2019 14:42:20 +1000
Subject: [PATCH] fix "mm: move ioremap page table mapping function to mm/"

Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
---
 mm/vmalloc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/mm/vmalloc.c b/mm/vmalloc.c
index 6370e0876a2c..f3abede9f161 100644
--- a/mm/vmalloc.c
+++ b/mm/vmalloc.c
@@ -322,7 +322,7 @@ int vmap_range(unsigned long addr,
 	int ret;
=20
 	ret =3D vmap_range_noflush(addr, end, phys_addr, prot, max_page_shift);
-	flush_cache_vmap(start, end);
+	flush_cache_vmap(addr, end);
 	return ret;
 }
=20
--=20
2.20.1

--=20
Cheers,
Stephen Rothwell

--Sig_/65cL.CDXbotvOfjdJoQ/zV/
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAlzvX/AACgkQAVBC80lX
0GzAmwf/e9J+Ipx65rX4Ab1JfAhlegR8rrPs2FJpx7BVork0Jo6W92UA6VBMRSUF
IUU/zpNVPDV2KFQ4tLHfvOIWSIBrfYaQGE7oYb3XxAPt3nmtvzB658KANgS20DaG
rIdjKoD2h10K8fnJGyLO0PZxZPdh0d3GWT3L3wSUKqhXRnzJqU0X+WtJrPBK/Hqm
Q1tRKJKF8MYiYGXNmon/ttFO8PjpCgHOGKbsOxk3cjYe2C9+hVObQZ8Ivq3pFmG9
o7CpAXQ3Z7ppd0T6D72Ct8+UZVe0+I2Wqp0Y0uNGfEt0dJeHH27Ds9uHeXucUsOY
khvzKNInhV8Q7C4CP5YSSlKdZ3iaJg==
=BgnB
-----END PGP SIGNATURE-----

--Sig_/65cL.CDXbotvOfjdJoQ/zV/--
