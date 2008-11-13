From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: security-testing tree build warning
Date: Thu, 13 Nov 2008 15:31:07 +1100
Message-ID: <20081113153107.abf239b9.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Thu__13_Nov_2008_15_31_07_+1100_6SU6oUesG5/B.3VP"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:41842 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751026AbYKMEbV (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Wed, 12 Nov 2008 23:31:21 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: James Morris <jmorris@namei.org>
Cc: linux-next@vger.kernel.org

--Signature=_Thu__13_Nov_2008_15_31_07_+1100_6SU6oUesG5/B.3VP
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi James,

Today's linux-next build (powerpc ppc64_defconfig) produced these
warnings:

security/commoncap.c: In function 'cap_bprm_apply_creds':
security/commoncap.c:381: warning: unused variable 'pE'
security/commoncap.c:380: warning: unused variable 'pP'

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Thu__13_Nov_2008_15_31_07_+1100_6SU6oUesG5/B.3VP
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAkkbrYsACgkQjjKRsyhoI8yjxQCgiTnfuaHv01tSyA4ho2/P3meX
3UsAn0gccSK7X1NrdwJ0lBtEfcxecg2d
=mLw5
-----END PGP SIGNATURE-----

--Signature=_Thu__13_Nov_2008_15_31_07_+1100_6SU6oUesG5/B.3VP--
