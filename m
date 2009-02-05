From: Nico -telmich- Schottelius <nico-linux-next@schottelius.org>
Subject: X200: not resuming, cryptswap fails (was: linux-next: Tree for
	February 5)
Date: Thu, 5 Feb 2009 16:52:03 +0100
Message-ID: <20090205155203.GA4549@denkbrett.schottelius.org>
References: <20090205191658.41161afc.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="cNdxnHkX5QqsyA0e"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mx3.schottelius.org ([77.109.138.221]:59147 "EHLO
	mx3.schottelius.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752120AbZBEPwF (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Thu, 5 Feb 2009 10:52:05 -0500
Content-Disposition: inline
In-Reply-To: <20090205191658.41161afc.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>


--cNdxnHkX5QqsyA0e
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Stephen Rothwell [Thu, Feb 05, 2009 at 07:16:58PM +1100]:
> Hi all,
>=20
> Changes since 20090204:

20090205 on Lenovo X200:

  - on bootup the cryptsetup call for my home works, for
    swap not anymore (hangs, but can be canceled via ctrl-c;
    saw that in previously, beginning with next-20090122;
    standard Debian randomkey swap via cryptsetup)
  - suspend works; resume not: the moon is still seen,
    the fans start working, screen is black, network not
    up again -> no ping/ssh possible.

Back on 2.6.28-rc9-wl-denkbrett-24896-gf4f5c96, last working
version on X200.

Sincerly,

Nico

--=20
Think about Free and Open Source Software (FOSS).
http://nico.schottelius.org/documentations/foss/the-term-foss/

PGP: BFE4 C736 ABE5 406F 8F42  F7CF B8BE F92A 9885 188C

--cNdxnHkX5QqsyA0e
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAkmLCyIACgkQuL75KpiFGIxgRgCdE0SVJxnM9a3dkStOgYF2GMwD
5pQAoMYUJegvOJTzGSmbaVaXYWu/5MZk
=lre1
-----END PGP SIGNATURE-----

--cNdxnHkX5QqsyA0e--
