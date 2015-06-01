From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the edac-amd tree with the tile tree
Date: Mon, 1 Jun 2015 17:02:43 +1000
Message-ID: <20150601170243.266e4727@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/Z2gUI3Yp/ewMps7aB55CmlW"; protocol="application/pgp-signature"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:60173 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1750959AbbFAHCu (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Mon, 1 Jun 2015 03:02:50 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Borislav Petkov <borislav.petkov@amd.com>, Chris Metcalf <cmetcalf@ezchip.com>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org

--Sig_/Z2gUI3Yp/ewMps7aB55CmlW
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Borislav,

Today's linux-next merge of the edac-amd tree got a conflict in
arch/tile/Kconfig between commit 5bf6c07a1843 ("tile: add
<asm/word-at-a-time.h> and enable support functions") from the tile
tree and commit b01aec9b2c7d ("EDAC: Cleanup atomic_scrub mess") from
the edac-amd tree.

I fixed it up (see below) and can carry the fix as necessary (no action
is required).

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au

diff --cc arch/tile/Kconfig
index bcc7d66976f1,59cf0b911898..000000000000
--- a/arch/tile/Kconfig
+++ b/arch/tile/Kconfig
@@@ -29,8 -28,7 +29,9 @@@ config TIL
  	select HAVE_DEBUG_STACKOVERFLOW
  	select ARCH_WANT_FRAME_POINTERS
  	select HAVE_CONTEXT_TRACKING
 +	select GENERIC_STRNCPY_FROM_USER
 +	select GENERIC_STRNLEN_USER
+ 	select EDAC_SUPPORT
 =20
  # FIXME: investigate whether we need/want these options.
  #	select HAVE_IOREMAP_PROT

--Sig_/Z2gUI3Yp/ewMps7aB55CmlW
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJVbAOXAAoJEMDTa8Ir7ZwVOakP/0eD9RZElyzxHA2cfHfLtrCM
/8yRmf0bQyaXTR0MMMX56zdGSTcp7f5oTILk79c5de+ts9YyD9E/amMnfxb3epKf
u+P18dzN056stJZHzTM2Qrn23NfUT2VqyFzH99cX2kWUJQmtlsnp3XIw3gAlORGX
/g3aszJrkmJAV03UxtsqBhaFDMUtfNTNUAwYfzONGoaxd1UMAINQ9b73PzZec7e1
hI8c8Z11HficUBRLXNUjcjOhSehr1pP0HBJDm6Bd1o5NEusUTktznmHIkIX5n2J4
eKpoolizsHqbSjWGRJ1pBMq7WDePahvbiHNboOqiz6sGAvgAB6i2ii2W9t2zxhyN
3M/oGYPTf9pEg1zx7gf8jx4S3qRWTCSxWqfHjDuA8lsKyUuVrp4/6PaNBrQSJczd
QPyQ7CSVruSj/Q0jczdd5EVnL7Eu6t8701n2ZUcENNwsKhfYEammqYD+gki7NSs/
4O0Bh33lr6PsXy+vtyYfCwDA04REZeZUL9Mc5R3BQXtMVslBpF8m8Gr+kcJmzpG/
1BnHqkczDVc0jwFgqf7kNsZ5Xis8mZxTzE+fWmvxNIa6vvBhF5EzAzWIoN5PmWU8
4l9FR+7of3FjkOnwFOqGYXTU2zjmK0U5Xk3es+li4HN7eYURnqsie7hGKwaahNow
5Gr9Cd+5wcat5JSfl0gf
=0dZP
-----END PGP SIGNATURE-----

--Sig_/Z2gUI3Yp/ewMps7aB55CmlW--
