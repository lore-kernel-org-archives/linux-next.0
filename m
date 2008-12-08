From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: v4l-dvb tree build failure
Date: Mon, 8 Dec 2008 13:07:22 +1100
Message-ID: <20081208130722.8c2479e4.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Mon__8_Dec_2008_13_07_22_+1100_O0OX4i46EbryH/cc"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:52922 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1753847AbYLHCHd (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Sun, 7 Dec 2008 21:07:33 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Mauro Carvalho Chehab <mchehab@infradead.org>
Cc: linux-next@vger.kernel.org

--Signature=_Mon__8_Dec_2008_13_07_22_+1100_O0OX4i46EbryH/cc
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Mauro,

Today's linux-next build (x86_64 allmodconfig) failed like this:

drivers/media/video/em28xx/em28xx-video.c: In function 'em28xx_supports_aud=
io_extension':
drivers/media/video/em28xx/em28xx-video.c:1966: error: 'EM28XX_NO_AUDIO' un=
declared (first use in this function)
drivers/media/video/em28xx/em28xx-video.c:1977: error: 'EM28XX_AC97' undecl=
ared (first use in this function)
drivers/media/video/em28xx/em28xx-video.c:1981: error: 'EM28XX_I2S_3_SAMPLE=
_RATES' undeclared (first use in this function)
drivers/media/video/em28xx/em28xx-video.c:1985: error: 'EM28XX_I2S_5_SAMPLE=
_RATES' undeclared (first use in this function)
drivers/media/video/em28xx/em28xx-core.c: In function 'em28xx_set_audio_sou=
rce':
drivers/media/video/em28xx/em28xx-core.c:394: warning: ISO C90 forbids mixe=
d declarations and code
drivers/media/video/em28xx/em28xx-core.c:459: error: non-static declaration=
 of 'em28xx_audio_analog_set' follows static declaration
drivers/media/video/em28xx/em28xx-core.c:403: error: previous definition of=
 'em28xx_audio_analog_set' was here
drivers/media/video/em28xx/em28xx-core.c:556: error: non-static declaration=
 of 'em28xx_audio_setup' follows static declaration
drivers/media/video/em28xx/em28xx-core.c:462: error: previous definition of=
 'em28xx_audio_setup' was here
drivers/media/video/em28xx/em28xx-core.c:632: error: invalid storage class =
for function 'em28xx_accumulator_set'
drivers/media/video/em28xx/em28xx-core.c:644: error: invalid storage class =
for function 'em28xx_capture_area_set'
drivers/media/video/em28xx/em28xx-core.c:661: error: invalid storage class =
for function 'em28xx_scaler_set'
drivers/media/video/em28xx/em28xx-core.c:790: error: non-static declaration=
 of 'em28xx_set_mode' follows static declaration
drivers/media/video/em28xx/em28xx-core.c:771: error: previous definition of=
 'em28xx_set_mode' was here
drivers/media/video/em28xx/em28xx-core.c:800: error: invalid storage class =
for function 'em28xx_irq_callback'
drivers/media/video/em28xx/em28xx-core.c:861: error: non-static declaration=
 of 'em28xx_uninit_isoc' follows static declaration
drivers/media/video/em28xx/em28xx-core.c:828: error: previous definition of=
 'em28xx_uninit_isoc' was here
drivers/media/video/em28xx/em28xx-core.c:966: error: non-static declaration=
 of 'em28xx_init_isoc' follows static declaration
drivers/media/video/em28xx/em28xx-core.c:869: error: previous definition of=
 'em28xx_init_isoc' was here
drivers/media/video/em28xx/em28xx-core.c:966: error: expected declaration o=
r statement at end of input

So I have dropped the tree for today.
--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Mon__8_Dec_2008_13_07_22_+1100_O0OX4i46EbryH/cc
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAkk8gVoACgkQjjKRsyhoI8yNlQCfdsShd+OFiAOTtuMEuaCrXIHO
BjcAmwensCFtiE2PWZAJOcT6nVqrJx8U
=4FN1
-----END PGP SIGNATURE-----

--Signature=_Mon__8_Dec_2008_13_07_22_+1100_O0OX4i46EbryH/cc--
