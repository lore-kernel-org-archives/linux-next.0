From: Nico -telmich- Schottelius <nico-linux-next@schottelius.org>
Subject: Unfetchable (=non-public) arm branches
Date: Mon, 4 Aug 2008 15:19:39 +0200
Message-ID: <20080804131939.GA4182@denkbrett.schottelius.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="cNdxnHkX5QqsyA0e"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mx2.schottelius.org ([62.65.138.77]:55870 "EHLO
	mx2.schottelius.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755875AbYHDNTm (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Mon, 4 Aug 2008 09:19:42 -0400
Content-Disposition: inline
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: linux-next@vger.kernel.org
Cc: rmk@arm.linux.org.uk


--cNdxnHkX5QqsyA0e
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hello!

I am trying to fetch the trees listed in Next/Trees, but the following
two are not accessable for people without ssh-access to
master.kernel.org:

[15:16] denkbrett:Next% grep ssh:// Trees
arm-current git
ssh://master.kernel.org/home/rmk/linux-2.6-arm.git#master
arm      git   ssh://master.kernel.org/home/rmk/linux-2.6-arm.git#devel

Is it possible to make it public on git://git.kernel.org, too?

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

iEYEARECAAYFAkiXAesACgkQuL75KpiFGIzCPACg2eV12+fIqLWUwo0eP+E+ts25
ed4AoK5WvHLvy0H2xeBmCm37LPfR536g
=RNpB
-----END PGP SIGNATURE-----

--cNdxnHkX5QqsyA0e--
