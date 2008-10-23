From: Nico -telmich- Schottelius <nico-linux-next@schottelius.org>
Subject: xorg not working on 2.6.27-next-20081017 (intel/lenovo x200)
Date: Thu, 23 Oct 2008 17:37:45 +0200
Message-ID: <20081023153745.GA4909@denkbrett.schottelius.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="azLHFNyN32YCQGCU"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mx3.schottelius.org ([77.109.138.221]:42660 "EHLO
	mx3.schottelius.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751638AbYJWPiZ (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Thu, 23 Oct 2008 11:38:25 -0400
Content-Disposition: inline
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: linux-next@vger.kernel.org
Cc: 502387@bugs.debian.org


--azLHFNyN32YCQGCU
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hello!

When trying to startx on that kernel with

Intel Corporation Mobile 4 Series Chipset Integrated Graphics Controller (r=
ev 07)

(driver: intel)

the system freezes. Maybe related to debian bug #502387.

This does *not* happen on 2.6.27-rc9.

Will try latest stable and next in the next days.

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

iEYEARECAAYFAkkAmkgACgkQuL75KpiFGIys2QCfVSW6+qEpocDHk0Dqj8mzyXQs
JxQAn286mnhC0z1tnezjMLAi0Nu390Lj
=zDVX
-----END PGP SIGNATURE-----

--azLHFNyN32YCQGCU--
