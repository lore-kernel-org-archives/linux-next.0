From: Tony Breeds <tony@bakeyournoodle.com>
Subject: [PATCH] powerpc: fix compile error with 85xx/p1010rdb.c
Date: Fri, 9 Dec 2011 12:39:55 +1100
Message-ID: <20111209013955.GD20353@thor.bakeyournoodle.com>
References: <7679.1323324654@neuling.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="kA1LkgxZ0NN7Mz3A"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([203.10.76.45]:43954 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1750797Ab1LIBkA (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Thu, 8 Dec 2011 20:40:00 -0500
Content-Disposition: inline
In-Reply-To: <7679.1323324654@neuling.org>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Michael Neuling <mikey@neuling.org>
Cc: Kyle Moffett <Kyle.D.Moffett@boeing.com>, Benjamin Herrenschmidt <benh@kernel.crashing.org>, Paul Mackerras <paulus@samba.org>, linux-next@vger.kernel.org, linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, Michael Ellerman <michaele@au1.ibm.com>, sfr@canb.auug.org.au


--kA1LkgxZ0NN7Mz3A
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Current linux-next compiled with mpc85xx_defconfig causes this:

arch/powerpc/platforms/85xx/p1010rdb.c:41:14: error: 'np' undeclared (first=
 use in this function)
arch/powerpc/platforms/85xx/p1023_rds.c:102:14: error: 'np' undeclared (fir=
st use in this function)

Introduced in:=20
  commit 996983b75cebb1bc1c2c545f20336f24ebfa17af
  Author: Kyle Moffett <Kyle.D.Moffett@boeing.com>
  Date:   Fri Dec 2 06:28:02 2011 +0000
  powerpc/mpic: Search for open-pic device-tree node if NULL
=20
Signed-off-by: Tony Breeds <tony@bakeyournoodle.com>
---
Mikey already posted a fix for p1023_rds.c.  I think this is the last
one.

 arch/powerpc/platforms/85xx/p1010rdb.c |    2 --
 1 files changed, 0 insertions(+), 2 deletions(-)

diff --git a/arch/powerpc/platforms/85xx/p1010rdb.c b/arch/powerpc/platform=
s/85x
index 894f1e8..538bc3f 100644
--- a/arch/powerpc/platforms/85xx/p1010rdb.c
+++ b/arch/powerpc/platforms/85xx/p1010rdb.c
@@ -38,10 +38,8 @@ void __init p1010_rdb_pic_init(void)
          0, 256, " OpenPIC  ");
=20
        BUG_ON(mpic =3D=3D NULL);
-       of_node_put(np);
=20
        mpic_init(mpic);
-
 }

Yours Tony

--kA1LkgxZ0NN7Mz3A
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iQIcBAEBCAAGBQJO4WbrAAoJEEsCiJRY75GK0fUP+gOimNkgjYYRty1CfgrJZYz6
LRywfBIGpmOTZXeFBTCDN8U0lnBa+2wK05ZVtem4tjo5g1Ateisl7UUWxCaVEvEA
QzsdvtbuihsLcf/Osr0yLSOdssN7cw9YCnruboBSC8MsimWt5PGlfcpHBYWGjomw
aBJdBtpwnR/t6nMWAEaX5FFl/OM9X6qcxYAE+hb6whkI3rIR/7A/vPi/Y/IpKFmn
mTgBLJ+eFhPCynp2JLCllaTRZWJv5lStJN8Z7MrHMGwK8nCdPFyj1NSYS1O5fb/w
VpQrGbTNAvgbiapz2+FI82hoaK3eX0yMpN6KZbv92ZsH/ePCH2/P86KNltxovqnk
eUUUKL4WPunup5j6J+s+fdawYPN0gKPV/7Srrwirlx5QOoCf+mbHLYFjqAddyohp
EL0vnSowByxCMQjtMLGy9u/KyIQJOxuv4JO5O8wmBlsWdrVyq1/53o2+3x/+AGlL
pkaiwM1ptbfP30ZhLpZ5NNlh1zebyPfmLazYE7OachliVDvK9EciGu4j6RNkaRQQ
uzP1OXV5qANSg5eKNY2bHYrCNu+ev24I0lJj4yo656BNCdifgSfSd+EhZvK6Nhzg
C5/vyOqompPZj5cdcLtRaSSjvyrK10IQuzRoqzK4A0Y0KQ3Ryf5XGpN0Yx9W0TEz
yPAyL+AL6JrBh67OoyWS
=DmxB
-----END PGP SIGNATURE-----

--kA1LkgxZ0NN7Mz3A--
