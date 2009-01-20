From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: crypto tree build failure
Date: Tue, 20 Jan 2009 13:30:43 +1100
Message-ID: <20090120133043.29efee3f.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Tue__20_Jan_2009_13_30_43_+1100_b_xxx8NxZ_5huk4Y"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:51123 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752210AbZATCa4 (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Mon, 19 Jan 2009 21:30:56 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Herbert Xu <herbert@gondor.apana.org.au>
Cc: linux-next@vger.kernel.org, Huang Ying <ying.huang@intel.com>

--Signature=_Tue__20_Jan_2009_13_30_43_+1100_b_xxx8NxZ_5huk4Y
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Herbert,

Today's linux-next build (x86_64 allmodconfig) failed like this:

arch/x86/crypto/aesni-intel_glue.c:22:21: error: asm/aes.h: No such file or=
 directory
arch/x86/crypto/aesni-intel_glue.c: In function 'aes_encrypt':
arch/x86/crypto/aesni-intel_glue.c:98: error: implicit declaration of funct=
ion 'crypto_aes_encrypt_x86'
arch/x86/crypto/aesni-intel_glue.c: In function 'aes_decrypt':
arch/x86/crypto/aesni-intel_glue.c:111: error: implicit declaration of func=
tion 'crypto_aes_decrypt_x86'

Immediate cause is commit 9afc33f2f32204a779ef6c96728a034bcf4df29f
("crypto: aes-ni - Add support to Intel AES-NI instructions for x86_64
platform").

I have dropped the crypto tree for today.
--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Tue__20_Jan_2009_13_30_43_+1100_b_xxx8NxZ_5huk4Y
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAkl1N1MACgkQjjKRsyhoI8wBZACeKssBntxWv5DW+K+xeROSpems
mXkAn0rVi4MpSqIw1o9Lfp0ik+RWcPFO
=s5Wm
-----END PGP SIGNATURE-----

--Signature=_Tue__20_Jan_2009_13_30_43_+1100_b_xxx8NxZ_5huk4Y--
