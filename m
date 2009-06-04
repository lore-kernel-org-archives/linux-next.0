From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: sound tree build failure
Date: Thu, 4 Jun 2009 17:33:42 +1000
Message-ID: <20090604173342.b7dbca6d.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Thu__4_Jun_2009_17_33_42_+1000_nM/hM6YCfPUb8B8e"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:59565 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751945AbZFDHdr (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Thu, 4 Jun 2009 03:33:47 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Takashi Iwai <tiwai@suse.de>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Peter Ujfalusi <peter.ujfalusi@nokia.com>, Mark Brown <broonie@opensource.wolfsonmicro.com>

--Signature=_Thu__4_Jun_2009_17_33_42_+1000_nM/hM6YCfPUb8B8e
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Takashi,

Today's linux-next build (powerpc allyesconfig) failed like this:

sound/soc/codecs/twl4030.c: In function 'twl4030_read_reg_cache':
sound/soc/codecs/twl4030.c:152: error: 'cache' undeclared (first use in thi=
s function)

Caused by commit 16a30fbb0d3aa4ee829a2dd3d0e314e2b5ae96a9 ("ASoC:
TWL4030: Use reg_cache in twl4030_init_chip").

I reverted that commit for today.
--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Thu__4_Jun_2009_17_33_42_+1000_nM/hM6YCfPUb8B8e
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAkoneNYACgkQjjKRsyhoI8z1pwCeJxEsaK+UqQutm6TUd3tnglse
hhEAnjF2h1YsUQwPkRNQ7ZUJur+G1M/3
=2QKO
-----END PGP SIGNATURE-----

--Signature=_Thu__4_Jun_2009_17_33_42_+1000_nM/hM6YCfPUb8B8e--
