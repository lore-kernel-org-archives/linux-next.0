From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next:  sound tree build failure
Date: Wed, 10 Dec 2008 16:23:09 +1100
Message-ID: <20081210162309.add4393f.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Wed__10_Dec_2008_16_23_09_+1100_WUlzHqCBREfnCFkz"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:59613 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1750750AbYLJFXV (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Wed, 10 Dec 2008 00:23:21 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Takashi Iwai <tiwai@suse.de>
Cc: linux-next@vger.kernel.org, Mark Brown <broonie@opensource.wolfsonmicro.com>

--Signature=_Wed__10_Dec_2008_16_23_09_+1100_WUlzHqCBREfnCFkz
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Takashi,

Today's linux-next build (powerpc allyesconfig) failed like this:

sound/soc/codecs/twl4030.c:1278: error: conflicting types for 'twl4030_init'
sound/soc/codecs/twl4030.c:1187: error: previous definition of 'twl4030_ini=
t' was here

Caused by commit 64089b84abfe2f26a864ebd968429302dcb071de ("ASoC:
Register non-AC97 codec DAIs").

I have reverted the sound tree for today.
--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Wed__10_Dec_2008_16_23_09_+1100_WUlzHqCBREfnCFkz
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAkk/Uj4ACgkQjjKRsyhoI8z8tgCbBZdHa2q+cCx54yzzWAvsazAC
AMoAoLkoqLZ+UdrJDfuclwrBmf1MWs6Z
=jgZv
-----END PGP SIGNATURE-----

--Signature=_Wed__10_Dec_2008_16_23_09_+1100_WUlzHqCBREfnCFkz--
