From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: bad xtensa tree update
Date: Wed, 15 Oct 2008 10:09:06 +1100
Message-ID: <20081015100906.877efcf0.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Wed__15_Oct_2008_10_09_06_+1100_Fl+CGiEV/fHwnWts"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:48697 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752119AbYJNXJT (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Tue, 14 Oct 2008 19:09:19 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Chris Zankel <chris@zankel.net>
Cc: linux-next@vger.kernel.org

--Signature=_Wed__15_Oct_2008_10_09_06_+1100_Fl+CGiEV/fHwnWts
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Chris,

I fetched the xtensa tree this morning and it now points to
next-20080919.  The trees merged into linux-next should never depend on
linux-next itself.  I have reverted the xtensa tree to what is was
yesterday (commit dbd3dca "xtensa: use newer __SPIN_LOCK_UNLOCKED
macro").  Pleas fix up your tree.

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Wed__15_Oct_2008_10_09_06_+1100_Fl+CGiEV/fHwnWts
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAkj1JpMACgkQjjKRsyhoI8yVMgCePVRgM1asE+vRW4FkeR0W9zWt
2ggAoKAx/r/cm6X8O0URrrqHWMo+SF6l
=omki
-----END PGP SIGNATURE-----

--Signature=_Wed__15_Oct_2008_10_09_06_+1100_Fl+CGiEV/fHwnWts--
