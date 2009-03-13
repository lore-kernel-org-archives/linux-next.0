From: Nico -telmich- Schottelius <nico-linux-next@schottelius.org>
Subject: Re: linux-next test scripts
Date: Fri, 13 Mar 2009 09:03:48 +0100
Message-ID: <20090313080348.GC3246@denkbrett.schottelius.org>
References: <20090206142022.GA5430@pengutronix.de> <20090212202036.GA31203@pengutronix.de>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="z4+8/lEcDcG5Ke9S"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mx3.schottelius.org ([77.109.138.221]:39778 "EHLO
	mx3.schottelius.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751019AbZCMIDu (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Fri, 13 Mar 2009 04:03:50 -0400
Content-Disposition: inline
In-Reply-To: <20090212202036.GA31203@pengutronix.de>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org


--z4+8/lEcDcG5Ke9S
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Uwe Kleine-K=F6nig [Thu, Feb 12, 2009 at 09:20:37PM +0100]:
> Hello,
>=20
> On Fri, Feb 06, 2009 at 03:20:22PM +0100, Uwe Kleine-K=F6nig wrote:
> > I plan to setup something similar to linux-next for the Pengutronix test
> > lab to build a tree that contains the work of all our developers for
> > daily testing.
> >=20
> > It would be really great if I could take a look into your scripts to
> > manage linux-next.  I tried searching the web for them, but without
> > success.
> >=20
> > Are the scripts somewhere available without being found by me?  If yes,
> > where are they, if not, do you can publish them somewhere?
> After some more search I found the script by James Bottomley[1].

I'm also maintaining some smaller scripts for maintaining all the
kernel testing / building / installation stuff:

http://git.schottelius.org/?p=3Dnsbin;a=3Dtree;f=3Dlinux;hb=3DHEAD

Nico

--=20
Think about Free and Open Source Software (FOSS).
http://nico.schottelius.org/documentations/foss/the-term-foss/

PGP: BFE4 C736 ABE5 406F 8F42  F7CF B8BE F92A 9885 188C

--z4+8/lEcDcG5Ke9S
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAkm6E2QACgkQuL75KpiFGIzgXwCeLy81kn9BRuraYKZQBC4m2QDT
VaUAnjxjrMBIpqXuO0xGTC7CITp6kQHu
=Jv5E
-----END PGP SIGNATURE-----

--z4+8/lEcDcG5Ke9S--
