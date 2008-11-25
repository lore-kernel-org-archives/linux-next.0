From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: v4l-dvb tree build failure
Date: Tue, 25 Nov 2008 15:41:55 +1100
Message-ID: <20081125154155.4e547cd0.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Tue__25_Nov_2008_15_41_55_+1100_nWwlFIN4jONlhxWy"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:56494 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752812AbYKYEmN (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Mon, 24 Nov 2008 23:42:13 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Mauro Carvalho Chehab <mchehab@infradead.org>
Cc: linux-next@vger.kernel.org, Devin Heitmueller <devin.heitmueller@gmail.com>

--Signature=_Tue__25_Nov_2008_15_41_55_+1100_nWwlFIN4jONlhxWy
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Mauro,

Today's linux-next build (x86_64 allmodconfig) failed like this:

drivers/media/video/em28xx/em28xx-core.c: In function 'em28xx_set_audio_sou=
rce':
drivers/media/video/em28xx/em28xx-core.c:372: error: 'video' undeclared (fi=
rst use in this function)
drivers/media/video/em28xx/em28xx-core.c:372: error: 'disable' undeclared (=
first use in this function)
drivers/media/video/em28xx/em28xx-core.c:373: error: 'line' undeclared (fir=
st use in this function)
drivers/media/video/em28xx/em28xx-core.c:373: error: 'enable' undeclared (f=
irst use in this function)

Caused by a bad merge of commits
3f9b46c154da5ec4facca88f82d1820eb329fd3e ("V4L/DVB (9632): make em28xx
aux audio input work") and 2173b4ae6f8262d15fc933a13191cd6d5e789e8d
("V4L/DVB (9651): em28xx: Improve audio handling").

I have dropped the v4l-dvb tree for today.
--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Tue__25_Nov_2008_15_41_55_+1100_nWwlFIN4jONlhxWy
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAkkrghMACgkQjjKRsyhoI8xEqACfY0BFSp5Q9AvylfNTKXr2bS7Z
UJwAnRd0ZjDjp5GFmequURpxhWaRe/9g
=yfYr
-----END PGP SIGNATURE-----

--Signature=_Tue__25_Nov_2008_15_41_55_+1100_nWwlFIN4jONlhxWy--
