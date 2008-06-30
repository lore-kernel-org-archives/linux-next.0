From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the v4l-dvb tree
Date: Mon, 30 Jun 2008 14:56:45 +1000
Message-ID: <20080630145645.b671b13d.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Mon__30_Jun_2008_14_56_45_+1000_0_GZdXf211wP3Zxi"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:37502 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1756559AbYF3E4w (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Mon, 30 Jun 2008 00:56:52 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Mauro Carvalho Chehab <mchehab@infradead.org>
Cc: linux-next@vger.kernel.org

--Signature=_Mon__30_Jun_2008_14_56_45_+1000_0_GZdXf211wP3Zxi
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Mauro,

Today's linux-next merge of the v4l-dvb tree got a trivial conflict in
drivers/media/video/videodev.c between commit
7fa8e6fa1519194fc0c931f40d530fb55137bad9 ("V4L/DVB (8092): videodev:
simplify and fix standard enumeration") from Linus' tree (which is also
in the v4l-dvb tree) and commit 561216cf5e422669b4f9e54a6157d731245feecc
("V4L/DVB (8103): videodev: fix/improve ioctl debugging") from the
v4l-dvb tree.

Again, I fixed it up and will carry it.  But also my comments about a bug
fix branch/tree apply here also.

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Mon__30_Jun_2008_14_56_45_+1000_0_GZdXf211wP3Zxi
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAkhoZ40ACgkQjjKRsyhoI8yiaACfZu4WTwJeds0wrfxGEdwcQJ8I
zn0AniWqCUgyMKHwyF4ICwnFVittjTd6
=oEP2
-----END PGP SIGNATURE-----

--Signature=_Mon__30_Jun_2008_14_56_45_+1000_0_GZdXf211wP3Zxi--
