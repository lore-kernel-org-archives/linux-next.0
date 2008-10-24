From: Andres Freund <andres@anarazel.de>
Subject: Re: Current suspend issues on Lenovo X200 (w/ Intel graphics)
Date: Fri, 24 Oct 2008 16:30:51 +0200
Message-ID: <200810241630.52740.andres@anarazel.de>
References: <20081023204326.GB4175@denkbrett.schottelius.org> <200810240911.05193.rjw@sisk.pl> <20081024130130.GA5816@denkbrett.schottelius.org>
Mime-Version: 1.0
Content-Type: multipart/signed;
  boundary="nextPart1960897.ikmGCvL5CD";
  protocol="application/pgp-signature";
  micalg=pgp-sha1
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner+glk-linux-kernel-3=40m.gmane.org-S1753690AbYJXObL@vger.kernel.org>
In-Reply-To: <20081024130130.GA5816@denkbrett.schottelius.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Nico -telmich- Schottelius <nico-linux-next@schottelius.org>, "Rafael J. Wysocki" <rjw@sisk.pl>, Nigel Cunningham <ncunningham@crca.org.au>, linux-next@vger.kernel.orgLKML <linux->
List-Id: linux-next.vger.kernel.org

--nextPart1960897.ikmGCvL5CD
Content-Type: text/plain;
  charset="iso-8859-15"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

On Friday 24 October 2008 15:01:31 Nico -telmich- Schottelius wrote:
> > > Chipset Mobile Intel=AE GM45 Express Chipset found
> > This is going to be interesting. :-)
> > Nico, if the system is 64-bit, I'd recommend trying .28-rc1.
> Yes, I'm on amd64;
> As seen on my other post: xorg does not run on .28-rc1
The kernel has a fix for memory management for GM45 cards since 2.6.28-rc1=
=20
which require a newer driver, so trying this may be benifical (patch in rep=
ly=20
to your first post).

Andres

--nextPart1960897.ikmGCvL5CD
Content-Type: application/pgp-signature; name=signature.asc 
Content-Description: This is a digitally signed message part.

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEABECAAYFAkkB3BwACgkQporPraT14igaNACbBpEuZYtiQZWXsoeTUXmNj3aa
qrcAoJSWYTmLxlrXvN9RZanGnvAmHXKs
=Hq0k
-----END PGP SIGNATURE-----

--nextPart1960897.ikmGCvL5CD--
