From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build failure after merge of the akpm-current tree
Date: Wed, 4 Feb 2015 18:53:28 +1100
Message-ID: <20150204185328.1ee3ce3c@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/X9clB/RX7vb=Mk3zAWnotiF"; protocol="application/pgp-signature"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:60570 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1753786AbbBDHxe (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Wed, 4 Feb 2015 02:53:34 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Andrey Ryabinin <a.ryabinin@samsung.com>

--Sig_/X9clB/RX7vb=Mk3zAWnotiF
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Andrew,

After merging the akpm-current tree, today's linux-next build (x86-64
allmodconfig) failed like this:

scripts/Makefile.kasan:21: CONFIG_KASAN: compiler does not support all opti=
ons. Trying minimal configuration
scripts/Makefile.kasan:21: CONFIG_KASAN: compiler does not support all opti=
ons. Trying minimal configuration
x86_64-linux-gcc: warning: unrecognized argument to -fsanitize=3D option: '=
kernel-address'

lots and lots of this last message ...

Caused by the commits that added the kernel address sanitizer.

gcc version 4.9.0 cross compiling from Powerpc64.

I have added the following patch for today (after which I only got one
of the "compiler does not support all options" messages).

From: Stephen Rothwell <sfr@canb.auug.org.au>
Date: Wed, 4 Feb 2015 18:43:52 +1100
Subject: [PATCH] disable CONFIG_KASAN for now

Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
---
 lib/Kconfig.kasan | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/lib/Kconfig.kasan b/lib/Kconfig.kasan
index 4fecaedc80a2..4301bb56e3ce 100644
--- a/lib/Kconfig.kasan
+++ b/lib/Kconfig.kasan
@@ -1,7 +1,7 @@
 config HAVE_ARCH_KASAN
 	bool
=20
-if HAVE_ARCH_KASAN
+if HAVE_ARCH_KASAN && BROKEN
=20
 config KASAN
 	bool "KASan: runtime memory debugger"
--=20
2.1.4

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au

--Sig_/X9clB/RX7vb=Mk3zAWnotiF
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJU0c/9AAoJEMDTa8Ir7ZwVuR4P/26+KeurZFKACU0RaaKjGxPf
f69jbeWGVBtwmhhhEMv2dADX9Pqj/TKRJg+2ocaClrNgV0HnAPoMVmeH8u/iBw8t
aQaDlU4/wJre8RXYipNdQBxZnIFF/WkhuqCfyd5aCDl+7cXb6V+ynbNH+wHIYzGo
2BSnH+/HE6RmNK9coTMT6IEVYpK2pnZJed5YMJPcWB5fA7n4POzW87r09C4fb/3I
maG6TLqng7RTMSa+W0z+tbFMvK5ICIeVBlwkbGWQTT5cFol88IE4q+4+qd701G4y
PooIJJD9mYEcgfNEsyLQArG24uhN9hfx3QubFnvzxwTjX59OYxGFkr9mDDLPCmqA
d/aE1OQJUQ21rlpoIXaqsMytZppEsGRjLy259kcBTnWtduz74EzRY7Z+bjGuvDRx
u40d6a2bXjClqfpW2BBFt5EQkvqHITSBsSwP+HM4CkVfNRVnROrtsBcPdsyMYRn1
xmBqoniwlzBs/8Gai3pzGaXSjdPQIife2E9x2glaIKKoAITFUvPmjeGwVKq4vYTR
jLHisbtm3YDHUApahw7E73vjIPeZ/of73egsbnms5Ah3RqIs3y8fpfMSXIY/mlf5
grdstbgQaNAw2lJZ7AsvqyzKOv8bI5+ACtCwsmz28obK6MCghGaAViDm2Y9094nO
8ogba9cdE5j97Q0o7qRK
=KrO1
-----END PGP SIGNATURE-----

--Sig_/X9clB/RX7vb=Mk3zAWnotiF--
