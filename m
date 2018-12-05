From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build failure after merge of the akpm-current tree
Date: Wed, 5 Dec 2018 16:14:56 +1100
Message-ID: <20181205161456.4c618021@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/doMXrjp=Qr9qoVF6H1H_LKx"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Mel Gorman <mgorman@techsingularity.net>
List-Id: linux-next.vger.kernel.org

--Sig_/doMXrjp=Qr9qoVF6H1H_LKx
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Andrew,

After merging the akpm-current tree, today's linux-next build (arm
multi_v7_defconfig) failed like this:

arm-linux-gnueabi-ld: kernel/sysctl.o: in function `.LANCHOR0':
sysctl.c:(.data+0x7b4): undefined reference to `fragment_stall_order_sysctl=
_handler'

Caused by commit

  a247ff3201c1 ("mm: stall movable allocations until kswapd progresses duri=
ng serious external fragmentation event")

The fragment_stall_order_sysctl_handler() definition is protected by
CONFIG_NUMA, so I added this fix patch for today:

From: Stephen Rothwell <sfr@canb.auug.org.au>
Date: Wed, 5 Dec 2018 16:05:51 +1100
Subject: [PATCH] mm: fix for "stall movable allocations until kswapd
 progresses during serious external fragmentation event"

Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
---
 kernel/sysctl.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/kernel/sysctl.c b/kernel/sysctl.c
index 2f445c82fe38..93352cfb3239 100644
--- a/kernel/sysctl.c
+++ b/kernel/sysctl.c
@@ -1487,6 +1487,7 @@ static struct ctl_table vm_table[] =3D {
 		.extra1		=3D &one,
 		.extra2		=3D &one_thousand,
 	},
+#ifdef CONFIG_NUMA
 	{
 		.procname	=3D "fragment_stall_order",
 		.data		=3D &fragment_stall_order,
@@ -1496,6 +1497,7 @@ static struct ctl_table vm_table[] =3D {
 		.extra1		=3D &zero,
 		.extra2		=3D &max_order,
 	},
+#endif
 	{
 		.procname	=3D "percpu_pagelist_fraction",
 		.data		=3D &percpu_pagelist_fraction,
--=20
2.19.1

--=20
Cheers,
Stephen Rothwell

--Sig_/doMXrjp=Qr9qoVF6H1H_LKx
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAlwHXtAACgkQAVBC80lX
0GxgYAf/SsV09yhOh0VoHt8RGp6TBmhrrVUeIXMY2bMfXlD3/Sz/xTF1Qht9gHZv
mQp/TtX6iFlgv+ycIYeC+B1M4NJQpswO/UK7jRzxYmSN3EXtCyEFiTY4EdS+o5up
+MLPpB/tAS+fT7hW74l5jTw7wsAqmw9bT+GWi7YEBTEIzXG3V6JAIq8NsPNa4NlJ
EPi69Kbs9WFQyN1EC117XSE6geKNgplweND0WWJL5FXaxkxjvl4u3Gax4brOZ+Xd
eW9Y4ADsZXiasDC+cP+mN1R8R+p8vbUuBNM+v03QzP1DG2r2b6wcSHb3DRgO+f3e
do5T6K803sgq5ZFcsODf8FnMxYmZwQ==
=4NCk
-----END PGP SIGNATURE-----

--Sig_/doMXrjp=Qr9qoVF6H1H_LKx--
