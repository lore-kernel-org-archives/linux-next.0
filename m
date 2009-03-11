From: Nico Schottelius <nico-linux-20090311@schottelius.org>
Subject: Re: X200 suspend status on -wl and -next
Date: Wed, 11 Mar 2009 20:01:54 +0100
Message-ID: <20090311190154.GA28042@denkbrett.schottelius.org>
References: <20090311073030.GA5284@denkbrett.schottelius.org> <200903110946.23280.rjw@sisk.pl> <20090311085229.GB4495@denkbrett.schottelius.org> <20090311184407.GG8761@tuxdriver.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="azLHFNyN32YCQGCU"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mx3.schottelius.org ([77.109.138.221]:36562 "EHLO
	mx3.schottelius.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752202AbZCKTCB (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Wed, 11 Mar 2009 15:02:01 -0400
Content-Disposition: inline
In-Reply-To: <20090311184407.GG8761@tuxdriver.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: "John W. Linville" <linville@tuxdriver.com>
Cc: Nico Schottelius <nico-linux-20090311@schottelius.org>, "Rafael J. Wysocki" <rjw@sisk.pl>, LKML <linux-kernel@vger.kernel.org>, ipw3945-devel@lists.sourceforge.net, Linux Next Mailing List <linux-next@vger.kernel.org>


--azLHFNyN32YCQGCU
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

John W. Linville [Wed, Mar 11, 2009 at 02:44:07PM -0400]:
> > ikn% grep url .git/config=20
> >   url =3D git://git.kernel.org/pub/scm/linux/kernel/git/iwlwifi/iwlwifi=
-2.6.git
>=20
> Any chance you'd like to try wireless-testing to help to isolate
> possible sources of this problem?
>=20
> 	git://git.kernel.org/pub/scm/linux/kernel/git/linville/wireless-testing.=
git

Sure, why not. It's just another git-clone & make & wait :-)

Btw, next bug-report in linux-next will come in next minutes (for iwlagn).

Sincerly,

Nico

--=20
Think about Free and Open Source Software (FOSS).
http://nico.schottelius.org/documentations/foss/the-term-foss/

PGP: BFE4 C736 ABE5 406F 8F42  F7CF B8BE F92A 9885 188C

--azLHFNyN32YCQGCU
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAkm4CqIACgkQuL75KpiFGIzrugCg4arBbmPBDMAEKMmv2sf/4Z87
CnsAoJZaKPO0pwXIejV6ci0++sZh+cT2
=c/7g
-----END PGP SIGNATURE-----

--azLHFNyN32YCQGCU--
