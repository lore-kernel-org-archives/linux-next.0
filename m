From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build failure after merge of the akpm-current tree
Date: Wed, 17 Apr 2019 16:43:17 +1000
Message-ID: <20190417164317.3b9cd9e2@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/tzk/XQ9FMReknp.btOTZ+sf"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Johannes Weiner <hannes@cmpxchg.org>
List-Id: linux-next.vger.kernel.org

--Sig_/tzk/XQ9FMReknp.btOTZ+sf
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Andrew,

After merging the akpm-current tree, today's linux-next build (arm
multi_v7_defconfig) failed like this:

mm/vmscan.c: In function 'snapshot_refaults':
mm/vmscan.c:2969:14: error: implicit declaration of function 'lruvec_page_s=
tate_local'; did you mean 'lruvec_page_state'? [-Werror=3Dimplicit-function=
-declaration]
   refaults =3D lruvec_page_state_local(lruvec, WORKINGSET_ACTIVATE);
              ^~~~~~~~~~~~~~~~~~~~~~~
              lruvec_page_state

Caused by commit

  3c1fea8fbdf7 ("mm: fix inactive list balancing between NUMA nodes and cgr=
oups")

I applied the following patch for today:

From: Stephen Rothwell <sfr@canb.auug.org.au>
Date: Wed, 17 Apr 2019 16:40:02 +1000
Subject: [PATCH] fix "mm: fix inactive list balancing between NUMA nodes an=
d cgroups"

Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
---
 mm/vmscan.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/mm/vmscan.c b/mm/vmscan.c
index b828aae50d37..d545ace5e177 100644
--- a/mm/vmscan.c
+++ b/mm/vmscan.c
@@ -2966,7 +2966,7 @@ static void snapshot_refaults(struct mem_cgroup *root=
_memcg, pg_data_t *pgdat)
 		struct lruvec *lruvec;
=20
 		lruvec =3D mem_cgroup_lruvec(pgdat, memcg);
-		refaults =3D lruvec_page_state_local(lruvec, WORKINGSET_ACTIVATE);
+		refaults =3D lruvec_page_state(lruvec, WORKINGSET_ACTIVATE);
 		lruvec->refaults =3D refaults;
 	} while ((memcg =3D mem_cgroup_iter(root_memcg, memcg, NULL)));
 }
--=20
2.20.1

--=20
Cheers,
Stephen Rothwell

--Sig_/tzk/XQ9FMReknp.btOTZ+sf
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAly2ywUACgkQAVBC80lX
0GyyHAf8CK1k86+gh7EQuFkSbJeHDMfyyEqt1D8iU0d3HlEIy2ohewAjsFa2vfa7
YwfEwlJDScqggKIRI03wgSNiy+XkUBG8dFg1Gx4PCbKJdTx+oI40JtCCEkgamAh+
AD5kvT/GfDCZRJdOFFOsifwUQcmDOiEKwCCDdtzvQ4v02J1Klh5VgMJA3TE2eBEw
R5FIHimuCBVJ2utJKbC0qLGYcZKql1BUYzbg3LmZe/jeasSQEIZ0eMHWj7N0l7gg
ip41fvNdNvIVLlkfq85ISBkIz720wZH/mRw1daFwdkEjv7iDeZrLyLuKm3dC+0lJ
KqX3uDqjB17J7sGIZzZ/BumLtzrwHw==
=mPmR
-----END PGP SIGNATURE-----

--Sig_/tzk/XQ9FMReknp.btOTZ+sf--
