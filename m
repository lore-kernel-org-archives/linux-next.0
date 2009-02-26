From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: sound tree build failure
Date: Thu, 26 Feb 2009 14:07:46 +1100
Message-ID: <20090226140746.234c1357.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Thu__26_Feb_2009_14_07_46_+1100_jq.njYKSz4DoTfkc"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:33457 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1754394AbZBZDH4 (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Wed, 25 Feb 2009 22:07:56 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Takashi Iwai <tiwai@suse.de>
Cc: linux-next@vger.kernel.org, Mark Brown <broonie@opensource.wolfsonmicro.com>

--Signature=_Thu__26_Feb_2009_14_07_46_+1100_jq.njYKSz4DoTfkc
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Takashi,

Today's linux-next build (x86_64 allmodconfig) failed like this:

sound/soc/codecs/wm8753.c: In function 'wm8753_probe':
sound/soc/codecs/wm8753.c:1577: error: implicit declaration of function 'wm=
8753_add_controls'

Probably introduced by commit c2bac1606a937d4700f8fdd8e051a4c49593c41b
("ASoC: Convert WM8753 to register via normal device probe").

I have dropped the sound tree for today.
--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Thu__26_Feb_2009_14_07_46_+1100_jq.njYKSz4DoTfkc
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAkmmB4IACgkQjjKRsyhoI8wNvACcDL6OBC4r8gMD9hrXgYQz4TYR
8gUAn0sI9FBfa+zGqiyMztmGlheqn35y
=+HcE
-----END PGP SIGNATURE-----

--Signature=_Thu__26_Feb_2009_14_07_46_+1100_jq.njYKSz4DoTfkc--
