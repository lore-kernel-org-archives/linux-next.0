From: Nico -telmich- Schottelius <nico-linux-next@schottelius.org>
Subject: Re: linux-next test scripts
Date: Fri, 13 Mar 2009 10:46:50 +0100
Message-ID: <20090313094650.GA30900@denkbrett.schottelius.org>
References: <20090206142022.GA5430@pengutronix.de> <20090212202036.GA31203@pengutronix.de> <20090313080348.GC3246@denkbrett.schottelius.org> <20090313083701.GB15754@pengutronix.de>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="3MwIy2ne0vdjdPXF"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mx3.schottelius.org ([77.109.138.221]:47459 "EHLO
	mx3.schottelius.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1758368AbZCMJqz (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Fri, 13 Mar 2009 05:46:55 -0400
Content-Disposition: inline
In-Reply-To: <20090313083701.GB15754@pengutronix.de>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org


--3MwIy2ne0vdjdPXF
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Uwe Kleine-K=F6nig [Fri, Mar 13, 2009 at 09:37:01AM +0100]:
> > > > Are the scripts somewhere available without being found by me?  If =
yes,
> > > > where are they, if not, do you can publish them somewhere?
> > > After some more search I found the script by James Bottomley[1].
> >=20
> > I'm also maintaining some smaller scripts for maintaining all the
> > kernel testing / building / installation stuff:
> >=20
> > http://git.schottelius.org/?p=3Dnsbin;a=3Dtree;f=3Dlinux;hb=3DHEAD
> Thanks, but I think it doesn't include what I'm looking for.  You only
> seem to build bleeding edge (in next-build.sh) but you don't merge
> different trees before.

Well, that is something to be written, but also just a loop similar to

> BTW, I don't see the reason for linux/fetch-branches.sh, why not rely on
> git remote udpate?

that one here. I think I wrote it that way, to use the loop for merging
later.

But you are totally right: git remote update is the much simpler way here.

Nico

--=20
Think about Free and Open Source Software (FOSS).
http://nico.schottelius.org/documentations/foss/the-term-foss/

PGP: BFE4 C736 ABE5 406F 8F42  F7CF B8BE F92A 9885 188C

--3MwIy2ne0vdjdPXF
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAkm6K4oACgkQuL75KpiFGIwlQACgy7GqVbCt5zXEwzmaj8uo3ad2
VFIAoJwW07KY8r/iZ72gM0YLEUPG//LD
=pxAo
-----END PGP SIGNATURE-----

--3MwIy2ne0vdjdPXF--
