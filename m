From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: sparc tree build failure
Date: Tue, 2 Dec 2008 17:24:13 +1100
Message-ID: <20081202172413.f14fe387.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Tue__2_Dec_2008_17_24_13_+1100_AeVK7+puQTog9rWb"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:60991 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1750782AbYLBGY3 (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Tue, 2 Dec 2008 01:24:29 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: "David S. Miller" <davem@davemloft.net>
Cc: linux-next@vger.kernel.org, Rusty Russell <rusty@rustcorp.com.au>

--Signature=_Tue__2_Dec_2008_17_24_13_+1100_AeVK7+puQTog9rWb
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Dave,

Today's linux-next build (sparc defconfig) failed like this:

lib/find_next_bit.c: In function 'find_last_bit':
lib/find_next_bit.c:183: error: implicit declaration of function '__fls'

Caused by commit 352102898a13616e6f9248c38ffe6dbf9ed4016b
("bitmap:find_last_bit") from the rr tree.  I have reverted that commit
along with commit b2db63a70fbc9da9ce6da1331f61db9dde51bcce
("cpumask:use-find_last_bit") which depended on it.

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Tue__2_Dec_2008_17_24_13_+1100_AeVK7+puQTog9rWb
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAkk01I0ACgkQjjKRsyhoI8yGCQCgv7YD0YkBMWQos01+JzxxQi/j
q5kAoJx6YacaQDQGT6lwLpt6W+1ff/K5
=egCk
-----END PGP SIGNATURE-----

--Signature=_Tue__2_Dec_2008_17_24_13_+1100_AeVK7+puQTog9rWb--
