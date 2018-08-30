From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: disabling -Wstringop-truncation
Date: Fri, 31 Aug 2018 08:07:14 +1000
Message-ID: <20180831080714.4f94fba9@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_//=6y5f=6kt6eD++85cbr2_u"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Linus <torvalds@linux-foundation.org>
Cc: Linux-kernel Mailing List <linux-kernel@vger.kernel.org>, Linux-Next Mailing List <linux-next@vger.kernel.org>
List-Id: linux-next.vger.kernel.org

--Sig_//=6y5f=6kt6eD++85cbr2_u
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Linus,

I am now mainly using gcc v8.2 for my builds and -Wstringop-truncation
causes so many warnings that I am sure to miss others, so I have
applied the below to my fixes tree until the noise reduces.

From: Stephen Rothwell <sfr@canb.auug.org.au>
Date: Fri, 31 Aug 2018 07:47:28 +1000
Subject: [PATCH] disable stringop truncation warnings for now

They are too noisy
Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
---
 Makefile | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Makefile b/Makefile
index 2b458801ba74..a34a9283ee90 100644
--- a/Makefile
+++ b/Makefile
@@ -807,6 +807,9 @@ KBUILD_CFLAGS +=3D $(call cc-option,-Wdeclaration-after=
-statement,)
 # disable pointer signed / unsigned warnings in gcc 4.0
 KBUILD_CFLAGS +=3D $(call cc-disable-warning, pointer-sign)
=20
+# disable stringop warnings in gcc 8+
+KBUILD_CFLAGS +=3D $(call cc-disable-warning, stringop-truncation)
+
 # disable invalid "can't wrap" optimizations for signed / pointers
 KBUILD_CFLAGS	+=3D $(call cc-option,-fno-strict-overflow)
=20
--=20
2.19.0.rc1

--=20
Cheers,
Stephen Rothwell

--Sig_//=6y5f=6kt6eD++85cbr2_u
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAluIapIACgkQAVBC80lX
0Gw02wf7B7iA9KVuFSStUCH1Id8PyDxA2+P2NZIzdDajaE/2rYvhMY7P9Y9wxzfx
OLg4HypjuK2jexPkW+x+2TnE9WpTrtslPbl4dgTe7ARSzjHxdVGv+xJa+F/NyOZ0
twg2i2DLANpnOR1OVsQk2r1YEAuDwJLYytJUihA/0BwrQiDljktNhkrDDL139dLp
aQlD+ygH7aSOKJgrPIfRG5fUwrHbarwtHKAWOYapPAd0k25jep83eOT9Sc7ZsR0F
x8q2/qViHG8zHKv+fnYv59mo9pJzOPdHRnOI9USvkTcqG4WCKPpkYulDKCpbk6ck
tgmlUaXGbME0sf6eDxdsCTQYCALGDg==
=G3Mj
-----END PGP SIGNATURE-----

--Sig_//=6y5f=6kt6eD++85cbr2_u--
