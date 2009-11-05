From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: net tree build warning
Date: Thu, 5 Nov 2009 13:30:41 +1100
Message-ID: <20091105133041.a2aa30f7.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Thu__5_Nov_2009_13_30_41_+1100_LCYfm.LQYhLZ=ufv"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:60925 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751499AbZKECan (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Wed, 4 Nov 2009 21:30:43 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: "David S. Miller" <davem@davemloft.net>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Eric Dumazet <eric.dumazet@gmail.com>

--Signature=_Thu__5_Nov_2009_13_30_41_+1100_LCYfm.LQYhLZ=ufv
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Dave,

Today's linux-next build (x86_64 allmodconfig) produced this warning:

net/ipv4/devinet.c: In function 'inet_select_addr':
net/ipv4/devinet.c:902: warning: label 'out' defined but not used

Probably introduced by commit c6d14c84566d6b70ad9dc1618db0dec87cca9300
("net: Introduce for_each_netdev_rcu() iterator").

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Thu__5_Nov_2009_13_30_41_+1100_LCYfm.LQYhLZ=ufv
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)

iEYEARECAAYFAkryONEACgkQjjKRsyhoI8zAfwCgk0n+5CvpxH/5BlRGaZmNarIb
5gIAniqdu11L4P3d0exa6ATIkobz9ZXN
=9yq3
-----END PGP SIGNATURE-----

--Signature=_Thu__5_Nov_2009_13_30_41_+1100_LCYfm.LQYhLZ=ufv--
