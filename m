From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: net tree build failure
Date: Mon, 2 Mar 2009 18:05:14 +1100
Message-ID: <20090302180514.9b07c7d9.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Mon__2_Mar_2009_18_05_14_+1100_xwCo9jRUJkqO1y4v"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:38350 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1753169AbZCBHFX (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Mon, 2 Mar 2009 02:05:23 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: "David S. Miller" <davem@davemloft.net>
Cc: linux-next@vger.kernel.org, Andy Grover <andy.grover@oracle.com>

--Signature=_Mon__2_Mar_2009_18_05_14_+1100_xwCo9jRUJkqO1y4v
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Dave,

Today's linux-next build (powerpc allyesconfig) failed like this:

net/rds/cong.c: In function 'rds_cong_set_bit':
net/rds/cong.c:284: error: implicit declaration of function 'generic___set_=
le_bit'
net/rds/cong.c: In function 'rds_cong_clear_bit':
net/rds/cong.c:298: error: implicit declaration of function 'generic___clea=
r_le_bit'
net/rds/cong.c: In function 'rds_cong_test_bit':
net/rds/cong.c:309: error: implicit declaration of function 'generic_test_l=
e_bit'

Caused by commit 922cb17a5c812fcc9ebee249f4109db099896941 ("RDS:
Congestion-handling code").

I have reverted that commit and commit
fe17f84f5f2a7d6c1a31c04c06a016d4ad5f7dec ("RDS: Kconfig and Makefile")
that makes it all build.
--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Mon__2_Mar_2009_18_05_14_+1100_xwCo9jRUJkqO1y4v
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAkmrhSoACgkQjjKRsyhoI8zKVACfZDZc8btDzgJgHH+I8N2x1wNz
iGUAnjMgt1BG9Gtf37KYTTlfKqvjOjZS
=5njY
-----END PGP SIGNATURE-----

--Signature=_Mon__2_Mar_2009_18_05_14_+1100_xwCo9jRUJkqO1y4v--
