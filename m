From: Nico -telmich- Schottelius <nico-linux-next@schottelius.org>
Subject: Re: Unfetchable (=non-public) arm branches
Date: Mon, 4 Aug 2008 15:26:45 +0200
Message-ID: <20080804132645.GB4182@denkbrett.schottelius.org>
References: <20080804131939.GA4182@denkbrett.schottelius.org> <20080804132333.GD21651@flint.arm.linux.org.uk>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="St7VIuEGZ6dlpu13"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mx2.schottelius.org ([62.65.138.77]:57073 "EHLO
	mx2.schottelius.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754901AbYHDN0q (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Mon, 4 Aug 2008 09:26:46 -0400
Content-Disposition: inline
In-Reply-To: <20080804132333.GD21651@flint.arm.linux.org.uk>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Russell King <rmk@arm.linux.org.uk>
Cc: linux-next@vger.kernel.org


--St7VIuEGZ6dlpu13
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hello Russel,

thanks for the fast answer.

Russell King [Mon, Aug 04, 2008 at 02:23:33PM +0100]:
> On Mon, Aug 04, 2008 at 03:19:39PM +0200, Nico -telmich- Schottelius wrot=
e:
> > Hello!
> >=20
> > I am trying to fetch the trees listed in Next/Trees, but the following
> > two are not accessable for people without ssh-access to
> > master.kernel.org:
> >=20
> > [15:16] denkbrett:Next% grep ssh:// Trees
> > arm-current git
> > ssh://master.kernel.org/home/rmk/linux-2.6-arm.git#master
> > arm      git   ssh://master.kernel.org/home/rmk/linux-2.6-arm.git#devel
> >=20
> > Is it possible to make it public on git://git.kernel.org, too?
>=20
> No, because it doesn't follow kernel.org policy for living within /pub/sc=
m.
> However, you can get it from:
>=20
> http://ftp.arm.linux.org.uk/pub/linux/arm/kernel/git-cut/linux-2.6-arm.git

404 -> s/git-cut/git-cur/

http://ftp.arm.linux.org.uk/pub/linux/arm/kernel/git-cur/linux-2.6-arm.git/

> which is a direct copy of the kernel.org version.

Will try that, thanks!

Sincerly,

Nico

--=20
Think about Free and Open Source Software (FOSS).
http://nico.schottelius.org/documentations/foss/the-term-foss/

PGP: BFE4 C736 ABE5 406F 8F42  F7CF B8BE F92A 9885 188C

--St7VIuEGZ6dlpu13
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAkiXA5UACgkQuL75KpiFGIzD1gCdHBLtV3YRwrYBcBOkiimcedXN
W8MAnRc7KttHhN6R0KWRj+h9MK0BQhJ4
=+ktY
-----END PGP SIGNATURE-----

--St7VIuEGZ6dlpu13--
