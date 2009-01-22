From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: v4l-dvb tree build warning
Date: Thu, 22 Jan 2009 17:50:26 +1100
Message-ID: <20090122175026.6f14aa70.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Thu__22_Jan_2009_17_50_26_+1100_K4tzRiJo_QHZZhi_"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:46173 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1753548AbZAVGuc (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Thu, 22 Jan 2009 01:50:32 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Mauro Carvalho Chehab <mchehab@infradead.org>
Cc: linux-next@vger.kernel.org

--Signature=_Thu__22_Jan_2009_17_50_26_+1100_K4tzRiJo_QHZZhi_
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Mauro,

Today's linux-next build (powerpc allyesconfig) produced these warnings:

drivers/media/video/em28xx/em28xx.h:325: warning: 'ac97_return_record_selec=
t' defined but not used
drivers/media/video/em28xx/em28xx.h:325: warning: 'ac97_return_record_selec=
t' defined but not used
drivers/media/video/em28xx/em28xx.h:325: warning: 'ac97_return_record_selec=
t' defined but not used
drivers/media/video/em28xx/em28xx.h:325: warning: 'ac97_return_record_selec=
t' defined but not used
drivers/media/video/em28xx/em28xx.h:325: warning: 'ac97_return_record_selec=
t' defined but not used
drivers/media/video/em28xx/em28xx.h:325: warning: 'ac97_return_record_selec=
t' defined but not used

Caused by commit 7b388cb489bb551ad7c3b14350a3fb7a8e10e778 ("V4L/DVB (10228)=
: em28xx: fix audio output PCM IN selection").

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Thu__22_Jan_2009_17_50_26_+1100_K4tzRiJo_QHZZhi_
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAkl4FzIACgkQjjKRsyhoI8xtlwCbB327uYY6U8nIzZqJsvG+w1dB
cxkAmwSJMs+e8D8yCG38DJEzTVlSp8II
=fYw8
-----END PGP SIGNATURE-----

--Signature=_Thu__22_Jan_2009_17_50_26_+1100_K4tzRiJo_QHZZhi_--
