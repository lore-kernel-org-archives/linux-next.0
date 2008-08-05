From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: crypto tree build failure
Date: Tue, 5 Aug 2008 14:02:57 +1000
Message-ID: <20080805140257.7fad0dc0.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Tue__5_Aug_2008_14_02_57_+1000_CCXfr2q.M5DBVV+u"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:38740 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751510AbYHEEDF (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Tue, 5 Aug 2008 00:03:05 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Herbert Xu <herbert@gondor.apana.org.au>
Cc: linux-next@vger.kernel.org

--Signature=_Tue__5_Aug_2008_14_02_57_+1000_CCXfr2q.M5DBVV+u
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Herbert,

Today's linux-next build (powerpc ppc64_defconfig) failed like this:

crypto/built-in.o: In function `.test_aead':
testmgr.c:(.text+0x8378): undefined reference to `.crypto_aead_setauthsize'
testmgr.c:(.text+0x874c): undefined reference to `.crypto_aead_setauthsize'
crypto/built-in.o: In function `.alg_test_aead':
testmgr.c:(.text+0x8bb4): undefined reference to `.crypto_alloc_aead'

I added the following patch.
--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

>From d72a0cb337ed3a553c502e221efbd8dcf725048d Mon Sep 17 00:00:00 2001
From: Stephen Rothwell <sfr@canb.auug.org.au>
Date: Tue, 5 Aug 2008 14:00:20 +1000
Subject: [PATCH] crypto: tetsmgr linking fix

Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
---
 crypto/Makefile |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/crypto/Makefile b/crypto/Makefile
index 59ab500..ba73c57 100644
--- a/crypto/Makefile
+++ b/crypto/Makefile
@@ -24,7 +24,7 @@ obj-$(CONFIG_CRYPTO_HASH) +=3D crypto_hash.o
=20
 cryptomgr-objs :=3D algboss.o testmgr.o
=20
-obj-$(CONFIG_CRYPTO_MANAGER) +=3D cryptomgr.o
+obj-$(CONFIG_CRYPTO_MANAGER) +=3D cryptomgr.o aead.o
 obj-$(CONFIG_CRYPTO_HMAC) +=3D hmac.o
 obj-$(CONFIG_CRYPTO_XCBC) +=3D xcbc.o
 obj-$(CONFIG_CRYPTO_NULL) +=3D crypto_null.o
--=20
1.5.6.3


--Signature=_Tue__5_Aug_2008_14_02_57_+1000_CCXfr2q.M5DBVV+u
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAkiX0PEACgkQjjKRsyhoI8yuYwCfbO2a1/VcdkivBn9zInZOVTqs
tk0AnifJl+ecONynt7AtgyYrR3N+ixFv
=N1RR
-----END PGP SIGNATURE-----

--Signature=_Tue__5_Aug_2008_14_02_57_+1000_CCXfr2q.M5DBVV+u--
