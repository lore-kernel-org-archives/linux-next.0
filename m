From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: Main things left in linux-next
Date: Wed, 24 Jun 2009 17:46:57 +1000
Message-ID: <20090624174657.c325f500.sfr@canb.auug.org.au>
References: <20090624164617.b7c49974.sfr@canb.auug.org.au>
	<20090624172735.9b500674.sfr@canb.auug.org.au>
	<84144f020906240040ycf40bd6q20af82907315adc2@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Wed__24_Jun_2009_17_46_57_+1000_NPnVhYRY/GFckm9g"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:40608 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751344AbZFXHrB (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Wed, 24 Jun 2009 03:47:01 -0400
In-Reply-To: <84144f020906240040ycf40bd6q20af82907315adc2@mail.gmail.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Pekka Enberg <penberg@cs.helsinki.fi>
Cc: linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, Christoph Lameter <cl@linux-foundation.org>, Andrew Morton <akpm@linux-foundation.org>, Linus <torvalds@linux-foundation.org>, Nick Piggin <npiggin@suse.de>

--Signature=_Wed__24_Jun_2009_17_46_57_+1000_NPnVhYRY/GFckm9g
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Pekka,

On Wed, 24 Jun 2009 10:40:48 +0300 Pekka Enberg <penberg@cs.helsinki.fi> wr=
ote:
>
> 2009/6/24 Stephen Rothwell <sfr@canb.auug.org.au>:
> > The main obvious things left are:
> >
> > SLQB from the slab tree
>=20
> This didn't make it to 2.6.31. Do you want me to drop it until -rc1 is ou=
t?

At this point, it hardly matters as I suspect -rc1 will be in the next
day or so.  Probably better to keep things stable for Andrew, so leave it
in, I guess.

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Wed__24_Jun_2009_17_46_57_+1000_NPnVhYRY/GFckm9g
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAkpB2fEACgkQjjKRsyhoI8zYRwCgtM1Fx0m+JYshCKl1fWkN/VJH
9SkAniWTHqACLp+bJNslefow0ASCIoUN
=vxAV
-----END PGP SIGNATURE-----

--Signature=_Wed__24_Jun_2009_17_46_57_+1000_NPnVhYRY/GFckm9g--
