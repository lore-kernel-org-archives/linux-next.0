From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: Microblaze merge
Date: Wed, 27 May 2009 23:24:37 +1000
Message-ID: <20090527232437.d5509976.sfr@canb.auug.org.au>
References: <4A1CEA3C.1050904@petalogix.com>
	<20090527181022.f69d7036.sfr@canb.auug.org.au>
	<4A1D3ACF.2090206@petalogix.com>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Wed__27_May_2009_23_24_37_+1000_l8NzD/fIsj2gg0c9"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:52052 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1760642AbZE0NYl (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Wed, 27 May 2009 09:24:41 -0400
In-Reply-To: <4A1D3ACF.2090206@petalogix.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: michal.simek@petalogix.com
Cc: Andrew Morton <akpm@linux-foundation.org>, Arnd Bergmann <arnd@arndb.de>, John Williams <john.williams@petalogix.com>, linux-next@vger.kernel.org

--Signature=_Wed__27_May_2009_23_24_37_+1000_l8NzD/fIsj2gg0c9
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Michal,

On Wed, 27 May 2009 15:06:23 +0200 Michal Simek <michal.simek@petalogix.com=
> wrote:
>
> > 	posted to a relevant mailing list
> >  =20
> was
> > 	reviewed
> >  =20
> It was reviewed v1 - v2 contains all reported problems
> > 	unit tested
> >  =20
> I tested it
> > 	destined for the next merge window (or the current release)
> >  =20
> it is for next merge open window.

All good.

> I see the first problem that I should use {GIT PULL] prefix in subject.

Not for me.  Now that you have asked for inclusion, I will fetch the
tree/branch that you pointed me to every day until you tell me not to any
more.  So all you have to do is update that branch when your new stuff
meets the above criteria.

I usually don't expect any problems from the architecture trees since, as
you say, they are usually pretty much contained to their own arch/
directory.

One thing - is it easy for me to build a cross compiler for microblaze
(i.e. does some GNU release of gcc just work)?  If so, I could add some
microblaze configs to my automated builds.

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Wed__27_May_2009_23_24_37_+1000_l8NzD/fIsj2gg0c9
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAkodPxUACgkQjjKRsyhoI8zuiwCfQ2ZfWyfwLv5Hz6aQ8DYNB4o6
9SYAoJrwTWKkRNI+cSrTNtBcU4YeVJvh
=03DQ
-----END PGP SIGNATURE-----

--Signature=_Wed__27_May_2009_23_24_37_+1000_l8NzD/fIsj2gg0c9--
