From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: am build failure
Date: Sun, 19 Apr 2009 17:08:17 +1000
Message-ID: <20090419170817.ba4f30e9.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Sun__19_Apr_2009_17_08_17_+1000_Mj9g6=xMIVobtHtL"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:55215 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1754472AbZDSHI3 (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Sun, 19 Apr 2009 03:08:29 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Russell King <rmk@arm.linux.org.uk>
Cc: linux-next@vger.kernel.org

--Signature=_Sun__19_Apr_2009_17_08_17_+1000_Mj9g6=xMIVobtHtL
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Russell,

next-20090417 arm lart_defconfig had this build failure:

arch/arm/mach-sa1100/lart.c:21:2: warning: #warning "include/asm/arch-sa110=
0/ide.h needs fixing for lart"
arch/arm/mach-sa1100/lart.c:36: error: 'PAGE_SHIFT' undeclared here (not in=
 a function)

http://kisskb.ellerman.id.au/kisskb/buildresult/329018/
--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Sun__19_Apr_2009_17_08_17_+1000_Mj9g6=xMIVobtHtL
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAknqzeEACgkQjjKRsyhoI8xUdACdFUDSgYgb1l4N0TyJ3QY9qL1m
6o8An0txIEY1fyHIgfQll8XGM0EuU5Nc
=rlIO
-----END PGP SIGNATURE-----

--Signature=_Sun__19_Apr_2009_17_08_17_+1000_Mj9g6=xMIVobtHtL--
