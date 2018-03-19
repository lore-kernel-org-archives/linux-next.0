From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the tip tree with the arm-soc tree
Date: Mon, 19 Mar 2018 14:06:57 +1100
Message-ID: <20180319140657.223852a1@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/ycXnFGlPPACtBDhfS29zcpt"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>, "H. Peter Anvin" <hpa@zytor.com>, Peter Zijlstra <peterz@infradead.org>, Olof Johansson <olof@lixom.net>, Arnd Bergmann <arnd@arndb.de>, ARM <linux-arm-kernel@lists.infradead.org>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Robin Murphy <robin.murphy@arm.com>
List-Id: linux-next.vger.kernel.org

--Sig_/ycXnFGlPPACtBDhfS29zcpt
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the tip tree got a conflict in:

  drivers/bus/arm-cci.c

between commit:

  3de6be7a3dd8 ("drivers/bus: Split Arm CCI driver")

from the arm-soc tree and commit:

  edb39592a587 ("perf: Fix sibling iteration")

from the tip tree.

I fixed it up (I added the following merge fix patch) and can carry the
fix as necessary. This is now fixed as far as linux-next is concerned,
but any non trivial conflicts should be mentioned to your upstream
maintainer when your tree is submitted for merging.  You may also want
to consider cooperating with the maintainer of the conflicting tree to
minimise any particularly complex conflicts.

From: Stephen Rothwell <sfr@canb.auug.org.au>
Date: Mon, 19 Mar 2018 14:04:52 +1100
Subject: [PATCH] perf/core: another merge fix for "drivers/bus: Split Arm C=
CI
 driver"

Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
---
 drivers/perf/arm-cci.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/perf/arm-cci.c b/drivers/perf/arm-cci.c
index 192d23b760a0..383b2d3dcbc6 100644
--- a/drivers/perf/arm-cci.c
+++ b/drivers/perf/arm-cci.c
@@ -1265,7 +1265,7 @@ static int validate_group(struct perf_event *event)
 	if (!validate_event(event->pmu, &fake_pmu, leader))
 		return -EINVAL;
=20
-	list_for_each_entry(sibling, &leader->sibling_list, sibling_list) {
+	for_each_sibling_event(sibling, leader) {
 		if (!validate_event(event->pmu, &fake_pmu, sibling))
 			return -EINVAL;
 	}
--=20
2.16.1

--=20
Cheers,
Stephen Rothwell

--Sig_/ycXnFGlPPACtBDhfS29zcpt
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAlqvKVEACgkQAVBC80lX
0GzY5wgAmU1uu/AwBVMODMupzQk9pM8iOIq+YWhs/nUAgETQVnMyfcVLD9UhUtwa
7xQOzeEF3MYv8gDH4of/DSclUlkzLUnzGFQDmOPXHFDQHRYDwT1g8PxZWspQSvde
QJPJgaQiniUn1RWX1APs8XXnMrCDKna8ktIjgD2/qVvonX0yX32IZ4hqtsLLG403
4Njpu4Iht+eTeRrZhL2172dK/9SS4JRT+fOVjYcqmS+TJGufGGKgMxRbDqqjoNdF
9aQypedUklcoqGsbeo/pQAi5LN0/7BkYY48GAImAn5Dz3KvXu8BZsk3SdxSuuZKW
+fTYbIgNmaeNOrSBC6AWfN7UcOzdvg==
=YC53
-----END PGP SIGNATURE-----

--Sig_/ycXnFGlPPACtBDhfS29zcpt--
