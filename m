From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: net-current build failure
Date: Tue, 24 Feb 2009 11:26:59 +1100
Message-ID: <20090224112659.b65e9416.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Tue__24_Feb_2009_11_26_59_+1100_6y=VhiDHzb.T0+1x"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:41503 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1758674AbZBXA1L (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Mon, 23 Feb 2009 19:27:11 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: David Miller <davem@davemloft.net>
Cc: linux-next@vger.kernel.org, Daniel Lezcano <daniel.lezcano@free.fr>

--Signature=_Tue__24_Feb_2009_11_26_59_+1100_6y=VhiDHzb.T0+1x
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Dave,

Today's linux-next build (powerpc ppc64_defconfig) failed like this:

net/core/net_namespace.c: In function 'net_ns_init':
net/core/net_namespace.c:223: error: implicit declaration of function 'net_=
alloc_generic'
net/core/net_namespace.c:223: warning: assignment makes pointer from intege=
r without a cast

Caused by commit 486a87f1e5624096bd1c09e9e716239597d48dca ("netns: fix
double free at netns creation") which I have reverted for today.

--=20
Cheers,
Stephen Rothwell

--Signature=_Tue__24_Feb_2009_11_26_59_+1100_6y=VhiDHzb.T0+1x
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAkmjPtMACgkQjjKRsyhoI8wYegCgtF8FeOY3KXJ1SBl510UtyCgA
xlcAn0ESALqmr7IHE6zEoZImmMw7ZqXe
=/r/N
-----END PGP SIGNATURE-----

--Signature=_Tue__24_Feb_2009_11_26_59_+1100_6y=VhiDHzb.T0+1x--
