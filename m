From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: wireless tree build failure
Date: Mon, 23 Mar 2009 15:39:54 +1100
Message-ID: <20090323153954.95094b80.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Mon__23_Mar_2009_15_39_54_+1100_iR3+F1DQk4.edzwk"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:42392 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1750788AbZCWEkC (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Mon, 23 Mar 2009 00:40:02 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: David Miller <davem@davemloft.net>
Cc: linux-next@vger.kernel.org, Yang Hongyang <yanghy@cn.fujitsu.com>

--Signature=_Mon__23_Mar_2009_15_39_54_+1100_iR3+F1DQk4.edzwk
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Dave,

Today's linux-next build (powerpc ppc64_defconfig) failed like this:

drivers/net/spider_net.c:2263: error: expected '}' before ';' token

Caused by commit 6e06cb626229567629e1dc6eed9399bec549f3cf ("spider_net:
Convert to net_device_ops").

Clearly never even build tested (or looked at very hard).

I have used the version of the net tree from next-20090320 for today
--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Mon__23_Mar_2009_15_39_54_+1100_iR3+F1DQk4.edzwk
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAknHEpoACgkQjjKRsyhoI8yJbwCfTLQfbZ5ugX+BZKbK8mbXVpLU
YE0AoK287uNswTcCHZOpi07sayjbSkvE
=JoF3
-----END PGP SIGNATURE-----

--Signature=_Mon__23_Mar_2009_15_39_54_+1100_iR3+F1DQk4.edzwk--
