From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: linux-next: manual merge of the pxa tree
Date: Thu, 18 Sep 2008 08:14:06 +1000
Message-ID: <20080918081406.3a5e3865.sfr@canb.auug.org.au>
References: <20080918063109.5aee733d.sfr@canb.auug.org.au>
	<20080917214045.GB5475@flint.arm.linux.org.uk>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Thu__18_Sep_2008_08_14_06_+1000_p9tcVmT4s403LiYT"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:55205 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1753450AbYIQWOU (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Wed, 17 Sep 2008 18:14:20 -0400
In-Reply-To: <20080917214045.GB5475@flint.arm.linux.org.uk>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Russell King <rmk@arm.linux.org.uk>
Cc: Eric Miao <eric.y.miao@gmail.com>, linux-next@vger.kernel.org

--Signature=_Thu__18_Sep_2008_08_14_06_+1000_p9tcVmT4s403LiYT
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Russell,

On Wed, 17 Sep 2008 22:40:45 +0100 Russell King <rmk@arm.linux.org.uk> wrot=
e:
>
> On Thu, Sep 18, 2008 at 06:31:09AM +1000, Stephen Rothwell wrote:
> > Today's linux-next merge of the pxa tree got a conflict in
> > arch/arm/mach-pxa/spitz.c between commit
> > fced80c735941fa518ac67c0b61bbe153fb8c050 ("[ARM] Convert asm/io.h to
> > linux/io.h") from the arm tree and commit
> > 546ed5880bf813e1386696c02d288d7ffba517d6 ("[ARM] pxa/spitz: use SPI-bas=
ed
> > driver for ads7846, corgi-lcd and max1111") from the pxa tree.
> >=20
> > Just overlapping additions.  I fixed it up (see below) and can carry the
> > fix.
>=20
> If you wait a bit, kicking my tree out will resolve that (since those
> changes have been merged today.)

Thanks, I will pick that up tomorrow.
--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Thu__18_Sep_2008_08_14_06_+1000_p9tcVmT4s403LiYT
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAkjRgS4ACgkQjjKRsyhoI8xVZwCgnTPtkq4y2A6jEkEUzA9va4HQ
nEMAniEIxJsJSAKz6ozagd2dA8HSTUAO
=0gch
-----END PGP SIGNATURE-----

--Signature=_Thu__18_Sep_2008_08_14_06_+1000_p9tcVmT4s403LiYT--
