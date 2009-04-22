From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: crypto tree build failure
Date: Wed, 22 Apr 2009 14:47:06 +1000
Message-ID: <20090422144706.2d540852.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Wed__22_Apr_2009_14_47_06_+1000_7FzF64Gid05fX1a7"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:43406 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751291AbZDVErQ (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Wed, 22 Apr 2009 00:47:16 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Herbert Xu <herbert@gondor.apana.org.au>
Cc: linux-next@vger.kernel.org, Sebastian Andrzej Siewior <sebastian@breakpoint.cc>

--Signature=_Wed__22_Apr_2009_14_47_06_+1000_7FzF64Gid05fX1a7
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Herbert,

Today's linux-next build (powerpc allyesconfig) failed like this:

drivers/crypto/padlock-aes.c:21:22: error: asm/i387.h: No such file or dire=
ctory
drivers/crypto/padlock-aes.c: In function 'aes_encrypt':
drivers/crypto/padlock-aes.c:251: error: implicit declaration of function '=
irq_ts_save'
drivers/crypto/padlock-aes.c:253: error: implicit declaration of function '=
irq_ts_restore'
drivers/crypto/padlock-aes.c: In function 'padlock_init':
drivers/crypto/padlock-aes.c:458: error: 'cpu_has_xcrypt' undeclared (first=
 use in this function)
drivers/crypto/padlock-aes.c:463: error: 'cpu_has_xcrypt_enabled' undeclare=
d (first use in this function)
drivers/crypto/padlock-sha.c:25:22: error: asm/i387.h: No such file or dire=
ctory
drivers/crypto/padlock-sha.c: In function 'padlock_do_sha1':
drivers/crypto/padlock-sha.c:115: error: implicit declaration of function '=
irq_ts_save'
drivers/crypto/padlock-sha.c:119: error: implicit declaration of function '=
irq_ts_restore'
drivers/crypto/padlock-sha.c: In function 'padlock_init':
drivers/crypto/padlock-sha.c:265: error: 'cpu_has_phe' undeclared (first us=
e in this function)
drivers/crypto/padlock-sha.c:270: error: 'cpu_has_phe_enabled' undeclared (=
first use in this function)

Caused by commit 93628c83b00492fc592a29d0dc91efb1d55c6e24 ("crypto:
padlock - Enable on x86_64") which actually enabled it for everything
(except UML)!

I have reverted that commit for today.
--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Wed__22_Apr_2009_14_47_06_+1000_7FzF64Gid05fX1a7
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAknuoUoACgkQjjKRsyhoI8wlFACdGNSKbYcoJ1Q2rNs+A8/6GsN5
TjQAoKuF15w9amcTpo+gWVgnDBbbvODt
=gvoN
-----END PGP SIGNATURE-----

--Signature=_Wed__22_Apr_2009_14_47_06_+1000_7FzF64Gid05fX1a7--
