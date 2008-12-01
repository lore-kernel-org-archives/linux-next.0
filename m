From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: v4l-dvb tree build failure
Date: Tue, 2 Dec 2008 10:37:41 +1100
Message-ID: <20081202103741.9b234e49.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Tue__2_Dec_2008_10_37_41_+1100_pvs6xBLEggVujfkD"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:52391 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751388AbYLAXiI (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Mon, 1 Dec 2008 18:38:08 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Mauro Carvalho Chehab <mchehab@infradead.org>
Cc: linux-next@vger.kernel.org

--Signature=_Tue__2_Dec_2008_10_37_41_+1100_pvs6xBLEggVujfkD
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Mauro,

Today's linux-next build (x86_64 allmodconfig) failed like this:

drivers/media/video/em28xx/em28xx-video.c: In function 'em28xx_supports_aud=
io_extension':
drivers/media/video/em28xx/em28xx-video.c:1966: error: 'EM28XX_NO_AUDIO' un=
declared (first use in this function)
drivers/media/video/em28xx/em28xx-video.c:1966: error: (Each undeclared ide=
ntifier is reported only once
drivers/media/video/em28xx/em28xx-video.c:1966: error: for each function it=
 appears in.)
drivers/media/video/em28xx/em28xx-video.c:1977: error: 'EM28XX_AC97' undecl=
ared (first use in this function)
drivers/media/video/em28xx/em28xx-video.c:1981: error: 'EM28XX_I2S_3_SAMPLE=
_RATES' undeclared (first use in this function)
drivers/media/video/em28xx/em28xx-video.c:1985: error: 'EM28XX_I2S_5_SAMPLE=
_RATES' undeclared (first use in this function)

I have dropped the v4l-dvb tree again today.
--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Tue__2_Dec_2008_10_37_41_+1100_pvs6xBLEggVujfkD
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAkk0dUUACgkQjjKRsyhoI8wsygCcC3Oa9qIghN55+wPUSySrY3x+
tVYAoICapzFltQBJ9uq5CPu71CTW00/n
=pqra
-----END PGP SIGNATURE-----

--Signature=_Tue__2_Dec_2008_10_37_41_+1100_pvs6xBLEggVujfkD--
