From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: linux-next: kbuild tree build failure
Date: Wed, 3 Dec 2008 11:36:50 +1100
Message-ID: <20081203113650.d4245a05.sfr@canb.auug.org.au>
References: <20081126154206.31958aed.sfr@canb.auug.org.au>
	<20081126210657.GA11963@uranus.ravnborg.org>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Wed__3_Dec_2008_11_36_50_+1100_XIhLuSYjob2DjQzT"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:34246 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1753234AbYLCAhA (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Tue, 2 Dec 2008 19:37:00 -0500
In-Reply-To: <20081126210657.GA11963@uranus.ravnborg.org>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Sam Ravnborg <sam@ravnborg.org>
Cc: linux-next@vger.kernel.org

--Signature=_Wed__3_Dec_2008_11_36_50_+1100_XIhLuSYjob2DjQzT
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Sam,

On Wed, 26 Nov 2008 22:06:57 +0100 Sam Ravnborg <sam@ravnborg.org> wrote:
>
> On Wed, Nov 26, 2008 at 03:42:06PM +1100, Stephen Rothwell wrote:
> > Hi Sam,
> >=20
> > Today's linux-next build (x86_64 allmodconfig) failed like this:
> >=20
> > In file included from arch/x86/include/asm/processor.h:15,
> >                  from include/linux/prefetch.h:14,
> >                  from include/linux/list.h:6,
> >                  from include/linux/module.h:9,
> >                  from kernel/configs.mod.c:1:
> > arch/x86/include/asm/current.h:23: error: expected '=3D', ',', ';', 'as=
m' or '__attribute__' before 'struct'
> >=20
> > and went rapidly down hill from there.
>=20
> I will cook up a fix tomorrow if day-time job does not become night-time.

I am still getting the same errors ...

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Wed__3_Dec_2008_11_36_50_+1100_XIhLuSYjob2DjQzT
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAkk11KIACgkQjjKRsyhoI8ysnQCgmc88gxFfot2T/zKqFeuXHDR9
3IMAoJVH+sbKeRuUNqIOn1T1cjVrDTF9
=BIHu
-----END PGP SIGNATURE-----

--Signature=_Wed__3_Dec_2008_11_36_50_+1100_XIhLuSYjob2DjQzT--
