From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build failure after merge of the akpm-current tree
Date: Fri, 1 May 2015 14:25:33 +1000
Message-ID: <20150501142533.7c58d978@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/1whU6iLEJIGACMoNqAAh/qx"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Andrew Morton <akpm@linux-foundation.org>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Mel Gorman <mgorman@suse.de>, Nate Zimmer <nzimmer@sgi.com>, Waiman Long <waiman.long@hp.com>, Pekka Enberg <penberg@kernel.org>
List-Id: linux-next.vger.kernel.org

--Sig_/1whU6iLEJIGACMoNqAAh/qx
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Andrew,

After merging the akpm tree, today's linux-next build (sparc defconfig)
failed like this:

mm/bootmem.c: In function 'free_all_bootmem_core':
mm/bootmem.c:237:32: error: 'cur' undeclared (first use in this function)
   __free_pages_bootmem(page++, cur++, 0);
                                ^

Caused by commit "mm: page_alloc: pass PFN to __free_pages_bootmem".
This only happens because CONFIG_NO_BOOTMEM is *not* set (it is set on
powerpc, x86, arm and sparc64).  Clearly it was never built for this
config.  :-(

Reverting would be a real pain, so I added this (probably incorrect)
patch to make it build:

From: Stephen Rothwell <sfr@canb.auug.org.au>
Date: Fri, 1 May 2015 14:21:08 +1000
Subject: [PATCH] mm: page_alloc: pass PFN to __free_pages_bootmem fix

Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
---
 mm/bootmem.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/mm/bootmem.c b/mm/bootmem.c
index daf956bb4782..0a0eb62b1c92 100644
--- a/mm/bootmem.c
+++ b/mm/bootmem.c
@@ -173,6 +173,7 @@ static unsigned long __init free_all_bootmem_core(bootm=
em_data_t *bdata)
 {
 	struct page *page;
 	unsigned long *map, start, end, pages, count =3D 0;
+	unsigned long cur;
=20
 	if (!bdata->node_bootmem_map)
 		return 0;
@@ -214,7 +215,7 @@ static unsigned long __init free_all_bootmem_core(bootm=
em_data_t *bdata)
 			count +=3D BITS_PER_LONG;
 			start +=3D BITS_PER_LONG;
 		} else {
-			unsigned long cur =3D start;
+			cur =3D start;
=20
 			start =3D ALIGN(start + 1, BITS_PER_LONG);
 			while (vec && cur !=3D start) {
@@ -233,6 +234,7 @@ static unsigned long __init free_all_bootmem_core(bootm=
em_data_t *bdata)
 	pages =3D bdata->node_low_pfn - bdata->node_min_pfn;
 	pages =3D bootmem_bootmap_pages(pages);
 	count +=3D pages;
+	cur =3D bdata->node_min_pfn;
 	while (pages--)
 		__free_pages_bootmem(page++, cur++, 0);
=20
--=20
2.1.4

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au

--Sig_/1whU6iLEJIGACMoNqAAh/qx
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJVQwBCAAoJEMDTa8Ir7ZwVgDoP/RdiEUNKj2nrwUlTNMstUjZJ
izaI1VmMkOC+QYMHOTUHllDX1wfx9rfBqM1i+KhjDxBQt8X8oCOaVCXNbGyeEXA9
5rCv+X5N6H6qHczmIDR4subEgDAnd6pMMEgA7+INraeRyq+r/fXnJwSqIQa9YB1+
LaGX9c61X4X2wV8zPCIQOSyX+aNitBkvferXxHgTVj+7SZhf65tl0szPwf7EJkJL
/ZHoNgs1tC1KUT5HL/vnMN953GEvta8vr0pUfUMEVlfMe/yMhm/xdx6xJgWJZzRo
Cx+9QNUMleAL8kyhIjr51N9X1IQNwgAFnQkrRstKS4TCQ3ZYCjbM2vv3Ov+iLbQ4
ssyM7hQiOkQEJ2/OPopTYXj6rO62AwVn8TupIwF7mDawLYaznU8aoljiZNry9yjG
EZJCVVd2lXrA3SQdMGH2Cq2iSZlF3vLImL9ZeuvoeZZRlOdCVuFc/zKvX5wIbK9i
7sBOHWBkKFj3/zqdG+nyK0Ilw0oceE8iKzHh3HkfSAYToz87EieEKTF1gb2T0Dah
RT+OJXxFbyLLaVOGzlOSi1KV+ylRl5JKGbMgeL8WmRLMh67Vgg5u6xrTY5RSthdS
V/vibakK5svkqUy6ZsftvZ71y/B4SV4M1Re9ZoMiU6BS9OSXljxOAUkHnGh+UJyE
PPMqEKECUTc2pBomA1I3
=8Hrn
-----END PGP SIGNATURE-----

--Sig_/1whU6iLEJIGACMoNqAAh/qx--
