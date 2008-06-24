From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: linux-next build poblems
Date: Tue, 24 Jun 2008 23:29:51 +1000
Message-ID: <20080624232951.a10c1a11.sfr@canb.auug.org.au>
References: <20080624022232.5c81519c.sfr@canb.auug.org.au>
	<20080623171023.GA16238@flint.arm.linux.org.uk>
	<20080623200702.GC8573@uranus.ravnborg.org>
	<20080623202156.GA12027@uranus.ravnborg.org>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Tue__24_Jun_2008_23_29_51_+1000_xVzT/4AJYVHkazD8"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:57717 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751516AbYFXNaK (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Tue, 24 Jun 2008 09:30:10 -0400
In-Reply-To: <20080623202156.GA12027@uranus.ravnborg.org>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Sam Ravnborg <sam@ravnborg.org>
Cc: Russell King <rmk@arm.linux.org.uk>, Haavard Skinnemoen <hskinnemoen@atmel.com>, Paul Mundt <lethal@linux-sh.org>, linux-next@vger.kernel.org

--Signature=_Tue__24_Jun_2008_23_29_51_+1000_xVzT/4AJYVHkazD8
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Sam,

On Mon, 23 Jun 2008 22:21:56 +0200 Sam Ravnborg <sam@ravnborg.org> wrote:
>
> >=20
> > I need to work out something.
> > But my first attemps failed miserably and I will stop for now
> > as I have some day-time job stuff to be done.
> > Travelling for a few days from now one so I cannot do anything
> > until the weekend.
> I came up with the following fix.
> And I fixed an arm tool chain for my box so I could check it.
>=20
> We can now build an arm kernel (or at least the first steps).
>=20
> I have pushed it out to kbuild-next.git.
> And I will redo the patch series later so we do not bisect break arm etc.

Nearly,  but not quite:  versatile_defconfig build for arm with today's
linux-next fails with:

make[3]: *** No rule to make target `include/asm/arch/uncompress.h', needed=
 by `arch/arm/boot/compressed/misc.o'.  Stop.

It does get much further, though.
--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Tue__24_Jun_2008_23_29_51_+1000_xVzT/4AJYVHkazD8
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAkhg9s8ACgkQTgG2atn1QN9rugCdGvbYEEcs0cl0lDBUZFxYBa59
zYYAnj5m3fhywECg0BqpxJrlQoA950AX
=HQSN
-----END PGP SIGNATURE-----

--Signature=_Tue__24_Jun_2008_23_29_51_+1000_xVzT/4AJYVHkazD8--
