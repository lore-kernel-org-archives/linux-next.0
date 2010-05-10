From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the v4l-dvb tree with Linus' tree
Date: Mon, 10 May 2010 10:36:21 +1000
Message-ID: <20100510103621.4ffbc8c3.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Mon__10_May_2010_10_36_21_+1000_M3LMii=QyO1zo.PF"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:42505 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1753411Ab0EJAgb (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Sun, 9 May 2010 20:36:31 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Mauro Carvalho Chehab <mchehab@infradead.org>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Brian Johnson <brijohn@gmail.com>, Yong Zhang <yong.zhang0@gmail.com>

--Signature=_Mon__10_May_2010_10_36_21_+1000_M3LMii=QyO1zo.PF
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Mauro,

Today's linux-next merge of the v4l-dvb tree got a conflict in
drivers/media/video/gspca/sn9c20x.c between commit
a76b9f49ba58d081e373080ff75130673140d3f1 ("V4L/DVB: gspca - sn9c20x:
Correct onstack wait_queue_head declaration") from Linus' tree and commit
a0965d58c1aa34ab66f3e2b5abd770f18f393905 ("V4L/DVB: gspca - sn9c20x: use
gspca's input device handling") from the v4l-dvb tree.

The latter just removed the code modified by the former.
--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Mon__10_May_2010_10_36_21_+1000_M3LMii=QyO1zo.PF
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)

iEYEARECAAYFAkvnVQUACgkQjjKRsyhoI8xAWwCbB3is0Iea3xl0NSTzPv1FwLuv
cOkAnjY738p6v+iz39WJsy1gFtuNDMT8
=ICIK
-----END PGP SIGNATURE-----

--Signature=_Mon__10_May_2010_10_36_21_+1000_M3LMii=QyO1zo.PF--
