From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: crypto tree build failure
Date: Thu, 4 Dec 2008 13:43:31 +1100
Message-ID: <20081204134331.016d38c4.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Thu__4_Dec_2008_13_43_31_+1100_ilWsKB2ASHDGTu7i"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:53432 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751063AbYLDCnl (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Wed, 3 Dec 2008 21:43:41 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Herbert Xu <herbert@gondor.apana.org.au>
Cc: linux-next@vger.kernel.org, Adrian-Ken Rueegsegger <ken@codelabs.ch>

--Signature=_Thu__4_Dec_2008_13_43_31_+1100_ilWsKB2ASHDGTu7i
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Herbert,

Today's linux-next build (x86_64 allmodconfig) failed like this:

crypto/built-in.o: In function `md5_mod_init':
crypto/md5.c:239: undefined reference to `crypto_register_shash'
crypto/built-in.o: In function `md5_mod_fini':
crypto/md5.c:244: undefined reference to `crypto_unregister_shash'

Presumably caused by commit 08cf233c1f29fc1cad8786b3c73647625810665b
("crypto: md5 - Switch to shash").

I have dropped the crypto tree for today.
--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Thu__4_Dec_2008_13_43_31_+1100_ilWsKB2ASHDGTu7i
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAkk3Q9MACgkQjjKRsyhoI8y2wQCgkgGC4oC0MTOvbCGpa1x40C7l
+BkAoKOfnLce6UlsJb7AFGpDTfCU6+Dq
=WO7n
-----END PGP SIGNATURE-----

--Signature=_Thu__4_Dec_2008_13_43_31_+1100_ilWsKB2ASHDGTu7i--
