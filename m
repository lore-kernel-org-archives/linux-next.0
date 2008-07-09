From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: sparc64 build failure
Date: Wed, 9 Jul 2008 21:15:15 +1000
Message-ID: <20080709211515.0d2c5100.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Wed__9_Jul_2008_21_15_15_+1000_/9J6uYoUuMoZep8B"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:41031 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1753708AbYGILP3 (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Wed, 9 Jul 2008 07:15:29 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Sam Ravnborg <sam@ravnborg.org>
Cc: linux-next@vger.kernel.org, David Miller <davem@davemloft.net>

--Signature=_Wed__9_Jul_2008_21_15_15_+1000_/9J6uYoUuMoZep8B
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Sam,

Today's linux-next build (sparc64 allmodconfig) failed like this:

usr/include/asm/auxvec.h:1: included file 'asm-sparc/auxvec.h' is not expor=
ted
usr/include/asm/bpp.h:1: included file 'asm-sparc/bpp.h' is not exported
usr/include/asm/byteorder.h:1: included file 'asm-sparc/byteorder.h' is not=
 exported
usr/include/asm/errno.h:1: included file 'asm-sparc/errno.h' is not exported
usr/include/asm/openpromio.h:1: included file 'asm-sparc/openpromio.h' is n=
ot exported
usr/include/asm/perfctr.h:1: included file 'asm-sparc/perfctr.h' is not exp=
orted

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Wed__9_Jul_2008_21_15_15_+1000_/9J6uYoUuMoZep8B
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAkh0ncMACgkQjjKRsyhoI8xyqACfeEJVgWGpDTIsC5H8bysGis9T
zEEAn0U3CQyzlDFXXAYxNtHdiWZ+G1r+
=DFuj
-----END PGP SIGNATURE-----

--Signature=_Wed__9_Jul_2008_21_15_15_+1000_/9J6uYoUuMoZep8B--
