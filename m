From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the v4l-dvb tree
Date: Fri, 4 Jul 2008 14:45:04 +1000
Message-ID: <20080704144504.cdbb1df3.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Fri__4_Jul_2008_14_45_04_+1000_Q5U4pFueEpsg02Ge"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:42855 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751134AbYGDEpP (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Fri, 4 Jul 2008 00:45:15 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Mauro Carvalho Chehab <mchehab@infradead.org>
Cc: linux-next@vger.kernel.org, Jean-Francois Moine <moinejf@free.fr>, Laurent Pinchart <laurent.pinchart@skynet.be>

--Signature=_Fri__4_Jul_2008_14_45_04_+1000_Q5U4pFueEpsg02Ge
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Mauro,

Today's linux-next merge of the v4l-dvb tree got a conflict in
drivers/media/video/Kconfig between commit
c0efd232929c2cd87238de2cccdaf4e845be5b0c ("V4L/DVB (8145a): USB Video
Class driver") from Linus' tree (which is also in the v4l-dvb tree) and
commit 2f70db892654f1e3c65c527e00a8982166142020 ("V4L/DVB (8152): Initial
release of gspca with only one driver") from the v4l-dvb tree.

Just a case of overlapping additions.

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Fri__4_Jul_2008_14_45_04_+1000_Q5U4pFueEpsg02Ge
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAkhtqtAACgkQjjKRsyhoI8zBFgCgj8eul0plqmZ01V1/qf+otJdH
nuQAn2x6K1O9HQgfrF7I1omTfN9hDhRa
=/TU2
-----END PGP SIGNATURE-----

--Signature=_Fri__4_Jul_2008_14_45_04_+1000_Q5U4pFueEpsg02Ge--
