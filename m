From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: Microblaze merge
Date: Wed, 27 May 2009 18:10:22 +1000
Message-ID: <20090527181022.f69d7036.sfr@canb.auug.org.au>
References: <4A1CEA3C.1050904@petalogix.com>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Wed__27_May_2009_18_10_22_+1000_QWgA9=ixG6nuv.KT"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:47290 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1755605AbZE0IK2 (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Wed, 27 May 2009 04:10:28 -0400
In-Reply-To: <4A1CEA3C.1050904@petalogix.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: michal.simek@petalogix.com
Cc: Andrew Morton <akpm@linux-foundation.org>, Arnd Bergmann <arnd@arndb.de>, John Williams <john.williams@petalogix.com>, linux-next@vger.kernel.org

--Signature=_Wed__27_May_2009_18_10_22_+1000_QWgA9=ixG6nuv.KT
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

HI Michal,

On Wed, 27 May 2009 09:22:36 +0200 Michal Simek <michal.simek@petalogix.com=
> wrote:
>
> Can you please merge my next branch to linux-next?
>=20
> The following changes since commit 5805977e63a36ad56594a623f3bd2bebcb7db2=
33:
>   Linus Torvalds (1):
>         Merge branch 'for-linus' of git://git.kernel.org/.../jbarnes/drm-=
2.6
>=20
> are available in the git repository at:
>=20
>   git://git.monstr.eu/linux-2.6-microblaze.git next

I have added it to the end of the tree for today (you just caught me in
time :-)).  Tomorrow it will be moved back with all the other
architectures.

What I tell everyone: all patches/commits in the tree/series must
have been:

	posted to a relevant mailing list
	reviewed
	unit tested
	destined for the next merge window (or the current release)

*before* they are included.  The linux-next tree is for integration
testing and to lower the impact of conflicts between subsystems in the
next merge window.

Basically, this should be just what you would send to Linus (or ask him
to fetch).  It is allowed to be rebased if you deem it necessary.
--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Wed__27_May_2009_18_10_22_+1000_QWgA9=ixG6nuv.KT
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAkoc9W4ACgkQjjKRsyhoI8yYjACguKFiwuWIggBmL2Q1RznUTghP
1YEAoIoS/gOYpHF3KHOgfqZDqI7uLU3L
=OqHU
-----END PGP SIGNATURE-----

--Signature=_Wed__27_May_2009_18_10_22_+1000_QWgA9=ixG6nuv.KT--
