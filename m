From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: linux-next: sound tree build failure
Date: Tue, 17 Mar 2009 10:03:27 +1100
Message-ID: <20090317100327.5d7ed38c.sfr@canb.auug.org.au>
References: <20090316213932.70ed9550.sfr@canb.auug.org.au>
	<20090316105902.GA20990@rakim.wolfsonmicro.main>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Tue__17_Mar_2009_10_03_27_+1100_Y1kfk.VV4_38Fp/_"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:50918 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1753045AbZCPXDe (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Mon, 16 Mar 2009 19:03:34 -0400
In-Reply-To: <20090316105902.GA20990@rakim.wolfsonmicro.main>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Mark Brown <broonie@opensource.wolfsonmicro.com>
Cc: Takashi Iwai <tiwai@suse.de>, linux-next@vger.kernel.org, Eric Miao <eric.y.miao@gmail.com>

--Signature=_Tue__17_Mar_2009_10_03_27_+1100_Y1kfk.VV4_38Fp/_
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Mark,

On Mon, 16 Mar 2009 10:59:02 +0000 Mark Brown <broonie@opensource.wolfsonmi=
cro.com> wrote:
>
> On Mon, Mar 16, 2009 at 09:39:32PM +1100, Stephen Rothwell wrote:
>=20
> > Today's linux-next build (powerpc allyesconfig) failed like this:
>=20
> > sound/soc/codecs/twl4030.c:1400: warning: braces around scalar initiali=
zer
> > sound/soc/codecs/twl4030.c:1400: warning: (near initialization for 'twl=
4030_dai.ops')
>=20
> I'll push a fix for this later today.

Thanks.

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Tue__17_Mar_2009_10_03_27_+1100_Y1kfk.VV4_38Fp/_
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAkm+2r8ACgkQjjKRsyhoI8xC+QCfeMDYQIEeP3PMoRs39yFPdz1Q
+swAnAtD62su9g2wnIzcc3ZxTtl1BGAa
=11Jk
-----END PGP SIGNATURE-----

--Signature=_Tue__17_Mar_2009_10_03_27_+1100_Y1kfk.VV4_38Fp/_--
