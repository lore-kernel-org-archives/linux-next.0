From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: v4l-dvb tree build warnings
Date: Fri, 6 Mar 2009 14:01:15 +1100
Message-ID: <20090306140115.4e605f19.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Fri__6_Mar_2009_14_01_15_+1100_62TfpR_KlsUC+1eJ"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:45904 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752024AbZCFDB3 (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Thu, 5 Mar 2009 22:01:29 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Mauro Carvalho Chehab <mchehab@infradead.org>
Cc: linux-next@vger.kernel.org, "Igor M. Liplianin" <liplianin@netup.ru>

--Signature=_Fri__6_Mar_2009_14_01_15_+1100_62TfpR_KlsUC+1eJ
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Mauro,

Today's linux-next build (x86_64 allmodconfig) produced these warnings:

drivers/media/dvb/frontends/stv0900_core.c: In function 'find_inode':
drivers/media/dvb/frontends/stv0900_core.c:65: warning: cast from pointer t=
o integer of different size
drivers/media/dvb/frontends/stv0900_core.c:67: warning: cast from pointer t=
o integer of different size
drivers/media/dvb/frontends/stv0900_core.c:71: warning: cast from pointer t=
o integer of different size
drivers/media/dvb/frontends/stv0900_core.c:73: warning: cast from pointer t=
o integer of different size
drivers/media/dvb/frontends/stv0900_core.c: In function 'stv0900_search':
drivers/media/dvb/frontends/stv0900_core.c:1495: warning: cast from pointer=
 to integer of different size
drivers/media/dvb/frontends/stv0900_core.c: In function 'stv0900_read_statu=
s':
drivers/media/dvb/frontends/stv0900_core.c:1610: warning: cast from pointer=
 to integer of different size
drivers/media/dvb/frontends/stv0900_core.c: In function 'stv0900_attach':
drivers/media/dvb/frontends/stv0900_core.c:1923: warning: cast from pointer=
 to integer of different size

Introduced by commit 85b3706579bfb73d7691488ed0e84c38773742aa ("V4L/DVB
(10803): Add core code for ST STV0900 dual demodulator").  Why not use %p
to print pointers?
--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Fri__6_Mar_2009_14_01_15_+1100_62TfpR_KlsUC+1eJ
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAkmwkfsACgkQjjKRsyhoI8xYHQCfVW37M/CvsqgMhA/fSUjV7Vtj
Rf8An2BNKguSop64nRFjF7QqJDgFY+Z5
=mfkk
-----END PGP SIGNATURE-----

--Signature=_Fri__6_Mar_2009_14_01_15_+1100_62TfpR_KlsUC+1eJ--
