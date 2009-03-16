From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: sound tree build failure
Date: Mon, 16 Mar 2009 21:39:32 +1100
Message-ID: <20090316213932.70ed9550.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Mon__16_Mar_2009_21_39_32_+1100_pDh6DLdgAsrr2yXE"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:55261 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752465AbZCPKjl (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Mon, 16 Mar 2009 06:39:41 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Takashi Iwai <tiwai@suse.de>
Cc: linux-next@vger.kernel.org, Eric Miao <eric.y.miao@gmail.com>, Mark Brown <broonie@opensource.wolfsonmicro.com>

--Signature=_Mon__16_Mar_2009_21_39_32_+1100_pDh6DLdgAsrr2yXE
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Takashi,

Today's linux-next build (powerpc allyesconfig) failed like this:

sound/soc/codecs/twl4030.c:1400: warning: braces around scalar initializer
sound/soc/codecs/twl4030.c:1400: warning: (near initialization for 'twl4030=
_dai.ops')
sound/soc/codecs/twl4030.c:1401: error: field name not in record or union i=
nitializer
sound/soc/codecs/twl4030.c:1401: error: (near initialization for 'twl4030_d=
ai.ops')
sound/soc/codecs/twl4030.c:1401: warning: initialization from incompatible =
pointer type
sound/soc/codecs/twl4030.c:1402: error: field name not in record or union i=
nitializer
sound/soc/codecs/twl4030.c:1402: error: (near initialization for 'twl4030_d=
ai.ops')
sound/soc/codecs/twl4030.c:1402: warning: excess elements in scalar initial=
izer
sound/soc/codecs/twl4030.c:1402: warning: (near initialization for 'twl4030=
_dai.ops')
sound/soc/codecs/twl4030.c:1403: error: field name not in record or union i=
nitializer
sound/soc/codecs/twl4030.c:1403: error: (near initialization for 'twl4030_d=
ai.ops')
sound/soc/codecs/twl4030.c:1403: warning: excess elements in scalar initial=
izer
sound/soc/codecs/twl4030.c:1403: warning: (near initialization for 'twl4030=
_dai.ops')

Caused by commit 6335d05548eece40092000aa91b64a50310d69d5 ("ASoC: make
ops a pointer in 'struct snd_soc_dai'") which missed a conversion (or a
later merge missed the fixup) ...

I have reverted commit 65ec1cd1e2c6228752d2f167b01e6d291014d249 ("ASoC:
Merge dai_ops factor out") (which merged in the above commit) for today.

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Mon__16_Mar_2009_21_39_32_+1100_pDh6DLdgAsrr2yXE
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAkm+LGQACgkQjjKRsyhoI8wW/ACeNWKnRfUK+CH3ab1LZRgzWlma
2lcAoKhxuZ3xWLgBQS0lAjcg9yf3Kxbq
=KYK9
-----END PGP SIGNATURE-----

--Signature=_Mon__16_Mar_2009_21_39_32_+1100_pDh6DLdgAsrr2yXE--
