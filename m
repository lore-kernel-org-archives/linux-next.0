From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: linux-next: v4l-dvb tree build failure
Date: Wed, 3 Dec 2008 11:08:43 +1100
Message-ID: <20081203110843.cd9cbb20.sfr@canb.auug.org.au>
References: <20081202103741.9b234e49.sfr@canb.auug.org.au>
	<20081202080302.2f1180e8@pedra.chehab.org>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Wed__3_Dec_2008_11_08_43_+1100_ZG_Ld/Tkh/LDfeNw"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:53267 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752872AbYLCAIx (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Tue, 2 Dec 2008 19:08:53 -0500
In-Reply-To: <20081202080302.2f1180e8@pedra.chehab.org>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Mauro Carvalho Chehab <mchehab@infradead.org>
Cc: linux-next@vger.kernel.org

--Signature=_Wed__3_Dec_2008_11_08_43_+1100_ZG_Ld/Tkh/LDfeNw
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Mauro,

On Tue, 2 Dec 2008 08:03:02 -0200 Mauro Carvalho Chehab <mchehab@infradead.=
org> wrote:
>
> On Tue, 2 Dec 2008 10:37:41 +1100
> Stephen Rothwell <sfr@canb.auug.org.au> wrote:
>=20
> > Today's linux-next build (x86_64 allmodconfig) failed like this:
> >=20
> > drivers/media/video/em28xx/em28xx-video.c: In function 'em28xx_supports=
_audio_extension':
> > drivers/media/video/em28xx/em28xx-video.c:1966: error: 'EM28XX_NO_AUDIO=
' undeclared (first use in this function)
> > drivers/media/video/em28xx/em28xx-video.c:1966: error: (Each undeclared=
 identifier is reported only once
> > drivers/media/video/em28xx/em28xx-video.c:1966: error: for each functio=
n it appears in.)
> > drivers/media/video/em28xx/em28xx-video.c:1977: error: 'EM28XX_AC97' un=
declared (first use in this function)
> > drivers/media/video/em28xx/em28xx-video.c:1981: error: 'EM28XX_I2S_3_SA=
MPLE_RATES' undeclared (first use in this function)
> > drivers/media/video/em28xx/em28xx-video.c:1985: error: 'EM28XX_I2S_5_SA=
MPLE_RATES' undeclared (first use in this function)
> >=20
> > I have dropped the v4l-dvb tree again today.
>=20
> I suspect you've pulled from my tree while I was testing it, or before my=
 last
> update yesterday night. Anyway, I've re-merged my patches at my linux-nex=
t and
> tested. Everything seems to be ok now.

I got the same error as yesterday, so the tree remains dropped.

Just to be clear, I am fetching the master branch of
git://git.kernel.org/pub/scm/linux/kernel/git/mchehab/linux-next.git and
it doesn't appear to have changed since yesterday's fetch.

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Wed__3_Dec_2008_11_08_43_+1100_ZG_Ld/Tkh/LDfeNw
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAkk1zgsACgkQjjKRsyhoI8zOyQCgihd+saFh7Ldioe/hvHUR0sxs
+pkAn1vtM2unTPwDXxJjlCiL0oST1nU3
=Qpss
-----END PGP SIGNATURE-----

--Signature=_Wed__3_Dec_2008_11_08_43_+1100_ZG_Ld/Tkh/LDfeNw--
