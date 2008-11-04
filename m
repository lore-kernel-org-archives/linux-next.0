From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: git tree with cputime changes
Date: Wed, 5 Nov 2008 08:48:28 +1100
Message-ID: <20081105084828.1988445a.sfr@canb.auug.org.au>
References: <1225725054.24817.15.camel@localhost>
	<20081105020139.a6a2be85.sfr@canb.auug.org.au>
	<1225812759.5805.0.camel@localhost>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Wed__5_Nov_2008_08_48_28_+1100_fylIlxXUbeg1lTaY"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:57091 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1754370AbYKDVsh (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Tue, 4 Nov 2008 16:48:37 -0500
In-Reply-To: <1225812759.5805.0.camel@localhost>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: schwidefsky@de.ibm.com
Cc: linux-next@vger.kernel.org

--Signature=_Wed__5_Nov_2008_08_48_28_+1100_fylIlxXUbeg1lTaY
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Martin,

On Tue, 04 Nov 2008 16:32:39 +0100 Martin Schwidefsky <schwidefsky@de.ibm.c=
om> wrote:
>
> On Wed, 2008-11-05 at 02:01 +1100, Stephen Rothwell wrote:
> > > Martin Schwidefsky (4):
> > >       [S390] fix scaled & unscaled cputime accounting
> > >       [S390] idle cputime accounting
> >=20
> > These first two aren't really s390 specific, are they?
>=20
> Yeah that is true. The stupid script that applies the patches always
> replaces [PATCH] with [S390] ..

That's OK, it was just a small point.

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Wed__5_Nov_2008_08_48_28_+1100_fylIlxXUbeg1lTaY
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAkkQwywACgkQjjKRsyhoI8zmKwCff7DMvDnRYvP4kOnzpmztUU9L
3lIAn0UHlXYUyfCUvKAJslMjwFrWSG/W
=Qhvi
-----END PGP SIGNATURE-----

--Signature=_Wed__5_Nov_2008_08_48_28_+1100_fylIlxXUbeg1lTaY--
