From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the battery tree
Date: Tue, 8 Jul 2008 16:13:17 +1000
Message-ID: <20080708161317.20591f4d.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Tue__8_Jul_2008_16_13_17_+1000_Dwzp6jrH/iNb03jd"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:55428 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751236AbYGHGN0 (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Tue, 8 Jul 2008 02:13:26 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Anton Vorontsov <avorontsov@ru.mvista.com>
Cc: linux-next@vger.kernel.org, =?UTF-8?B?Ik1hcmVrIFZhxaF1dCI=?= <marek.vasut@gmail.com>, Russell King <rmk@arm.linux.org.uk>, Dmitry Baryshkov <dbaryshkov@gmail.com>

--Signature=_Tue__8_Jul_2008_16_13_17_+1000_Dwzp6jrH/iNb03jd
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Anton,

Today's linux-next merge of the battery tree got trivial conflicts in
drivers/power/Makefile and drivers/power/Kconfig between commit
7bd66c73ec75711cec7446c6f6822494c1afd951 ("[ARM] 5155/1: PalmTX battery
monitor") from the arm tree and commit
fece418418f51e92dd7e67e17c5e3fe5a28d3279 ("power_supply: Sharp SL-6000
(tosa) batteries support") from the battery tree.

Just a case of overlapping additions.  I took both and can carry the
fixup.

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Tue__8_Jul_2008_16_13_17_+1000_Dwzp6jrH/iNb03jd
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAkhzBX0ACgkQjjKRsyhoI8zxDQCgrneEWfZJKNerMOWovzMu9yHq
A8cAnRvDSHoeVwLJZ39LjXZK4scvw4QS
=vXOf
-----END PGP SIGNATURE-----

--Signature=_Tue__8_Jul_2008_16_13_17_+1000_Dwzp6jrH/iNb03jd--
