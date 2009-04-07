From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next:  tree build failure
Date: Tue, 7 Apr 2009 13:41:35 +1000
Message-ID: <20090407134135.dc4e0e46.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Tue__7_Apr_2009_13_41_35_+1000_9byuDS/zl5lSP3yC"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:44038 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752163AbZDGDlq (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Mon, 6 Apr 2009 23:41:46 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Takashi Iwai <tiwai@suse.de>
Cc: linux-next@vger.kernel.org, Peter Ujfalusi <peter.ujfalusi@nokia.com>, Mark Brown <broonie@opensource.wolfsonmicro.com>, Linus <torvalds@linux-foundation.org>, Andrew Morton <akpm@linux-foundation.org>

--Signature=_Tue__7_Apr_2009_13_41_35_+1000_9byuDS/zl5lSP3yC
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Takashi,

Today's linux-next build (powerpc allyesconfig) failed like this:

sound/soc/codecs/twl4030.c: In function 'twl4030_startup':
sound/soc/codecs/twl4030.c:1227: error: 'struct snd_soc_device' has no memb=
er named 'codec'
sound/soc/codecs/twl4030.c: In function 'twl4030_shutdown':
sound/soc/codecs/twl4030.c:1258: error: 'struct snd_soc_device' has no memb=
er named 'codec'
sound/soc/codecs/twl4030.c: At top level:
sound/soc/codecs/twl4030.c:1442: warning: initialization from incompatible =
pointer type
sound/soc/codecs/twl4030.c:1443: warning: initialization from incompatible =
pointer type

Caused by commit 7220b9f4bd4fad41f6f7299fe74c2c38ec85d793 ("ASoC:
TWL4030: Add constrains for second stream") from the sound-current tree.

Was this even build tested?

I have reverted that commit for today.
--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Tue__7_Apr_2009_13_41_35_+1000_9byuDS/zl5lSP3yC
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAknay28ACgkQjjKRsyhoI8wLvgCghSNB0K6TdAW7LxcKcnkf3KKk
KdUAn0JKS1IgvCDicmZQ8o+sTxKZQvDo
=1i3A
-----END PGP SIGNATURE-----

--Signature=_Tue__7_Apr_2009_13_41_35_+1000_9byuDS/zl5lSP3yC--
