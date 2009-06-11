From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: Request for linux-next inclusion of the voyager tree
Date: Thu, 11 Jun 2009 11:35:43 +1000
Message-ID: <20090611113543.29528bf3.sfr@canb.auug.org.au>
References: <1244477423.4079.228.camel@mulgrave.site>
	<20090609202130.GA5291@elte.hu>
	<20090610004126.491508c9@lxorguk.ukuu.org.uk>
	<20090609235647.GE23846@elte.hu>
	<alpine.LFD.2.01.0906091702580.6847@localhost.localdomain>
	<alpine.LFD.2.00.0906101454420.3367@localhost.localdomain>
	<alpine.LFD.2.01.0906100821540.6847@localhost.localdomain>
	<20090610153954.GA3464@elte.hu>
	<1244649759.4109.75.camel@mulgrave.site>
	<20090610165331.GA31096@elte.hu>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Thu__11_Jun_2009_11_35_43_+1000_cYkBNv983gxTeGeB"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:48925 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752753AbZFKBfw (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Wed, 10 Jun 2009 21:35:52 -0400
In-Reply-To: <20090610165331.GA31096@elte.hu>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: James Bottomley <James.Bottomley@HansenPartnership.com>
Cc: Ingo Molnar <mingo@elte.hu>, Linus Torvalds <torvalds@linux-foundation.org>, Thomas Gleixner <tglx@linutronix.de>, Alan Cox <alan@lxorguk.ukuu.org.uk>, "H. Peter Anvin" <hpa@zytor.com>, Andrew Morton <akpm@linux-foundation.org>, linux-next@vger.kernel.org

--Signature=_Thu__11_Jun_2009_11_35_43_+1000_cYkBNv983gxTeGeB
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, 10 Jun 2009 18:53:31 +0200 Ingo Molnar <mingo@elte.hu> wrote:
>
> * James Bottomley <James.Bottomley@HansenPartnership.com> wrote:
> >=20
> > OK, so this is an acceptable compromise for me too.
> >=20
> > What I think now is needed (from me) are three patch sets:
> >=20
> > 1. The final subarchitecture cleanups
> > 2. The quirk model/smp ops additions
> > 3. The voyager put back.
>=20
> Yes, that looks fine.
>=20
> You can have them in a single series for convenience if you want to=20
> (it's probably easier for you to test that way) - but 3 separate=20
> series are fine too, no strong preference either way - as long as=20
> the internal structure and details follows the ordering and=20
> parameters we outlined in previous mails.

OK, given this looks like a rewrite of the voyager tree, I will drop it
from linux-next for a while.

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Thu__11_Jun_2009_11_35_43_+1000_cYkBNv983gxTeGeB
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAkowX28ACgkQjjKRsyhoI8y+LACffYTPkae5Vh2YmHYAUIXIw7W5
eU0An0Jrv47m0nFi7BYEcfdwBNds+5+Q
=qxtg
-----END PGP SIGNATURE-----

--Signature=_Thu__11_Jun_2009_11_35_43_+1000_cYkBNv983gxTeGeB--
