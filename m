From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: Tests tree not submitted?
Date: Mon, 19 May 2008 15:37:04 +1000
Message-ID: <20080519153704.b0c9cb2d.sfr@canb.auug.org.au>
References: <20080519135436.34d6d593.sfr@canb.auug.org.au>
	<20080519043822.GA3473@in.ibm.com>
	<20080518220003.5169892a.akpm@linux-foundation.org>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Mon__19_May_2008_15_37_04_+1000_5gXkZcedKJEVfN_/"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:33413 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752590AbYESFhQ (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Mon, 19 May 2008 01:37:16 -0400
In-Reply-To: <20080518220003.5169892a.akpm@linux-foundation.org>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: ananth@in.ibm.com, Sam Ravnborg <sam@ravnborg.org>, linux-next@vger.kernel.org

--Signature=_Mon__19_May_2008_15_37_04_+1000_5gXkZcedKJEVfN_/
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Andrew,

On Sun, 18 May 2008 22:00:03 -0700 Andrew Morton <akpm@linux-foundation.org=
> wrote:
>
> <brief panic>
>=20
> I don't even know what the "tests" tree _is_.
>=20
> Searching the past seven weeks lmkl archives for From:.*ananth.* turns
> up zero hits.
>=20
> So whatever this thing is, it's waaaaaaaaaaaaaaaaaaaaay too low-profile.
>=20
> Did you even send Linus a pull request?  I have no record of one.
>=20
> Secret tree :(

I don;t have the original pull request in my archive, but I do have an emai=
l from Sam Ravnborg dated Feb 19 saying (in part):

"Hi Anath.

Linus did not pull this in the -rc1 to -rc2 timeframe
so please resubmit the patch serie one week into the
next merge window (when most of the trees has hit linus' tree
and Andrew has made his first merge).

IF you need an extra eye balling then you can submit
a few weeks before the merge window opens.
Thats typical after an -rc with only a few patches."

After which Ananth asked me to add it to linux-next and I did on Feb 24.

So, not a complete secret :-) and a pull request was sent on Feb 12
(actually by Sam who put this stuff into a git tree for Ananth).  This
tree (patch set) has not changed since Feb 24 and only has the one simple
conflict I noted.=20
--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Mon__19_May_2008_15_37_04_+1000_5gXkZcedKJEVfN_/
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.6 (GNU/Linux)

iD8DBQFIMRIJTgG2atn1QN8RAm5SAJ9mnSNWPuLxBVjHJ8WZlAbWexJhhQCeOvre
S2yduvcGs6hO1ZC45KKgcc0=
=8d+d
-----END PGP SIGNATURE-----

--Signature=_Mon__19_May_2008_15_37_04_+1000_5gXkZcedKJEVfN_/--
