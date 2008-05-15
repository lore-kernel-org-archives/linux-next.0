From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: upstream build failure
Date: Thu, 15 May 2008 10:39:25 +1000
Message-ID: <20080515103925.3e282f11.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Thu__15_May_2008_10_39_25_+1000_AU=2MoHppf6GZg1T"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:32801 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1753195AbYEOAjh (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Wed, 14 May 2008 20:39:37 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: David Miller <davem@davemloft.net>
Cc: Adrian Bunk <bunk@kernel.org>, Graf Yang <graf.yang@analog.com>, Bryan Wu <cooloney@kernel.org>, linux-next@vger.kernel.org

--Signature=_Thu__15_May_2008_10_39_25_+1000_AU=2MoHppf6GZg1T
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Dave,

Today's linux-next build of Linus' tree (x86_64 allmodconfig) failed like
this:

net/irda/irnet/irnet_irda.c: In function 'irnet_discovery_indication':
net/irda/irnet/irnet_irda.c:1676: error: implicit declaration of function '=
get_unaligned'

I have applied Adrian's patch ("irnet_irda.c must #include
<asm/unaligned.h>") which you have queued but not pushed out, yet.

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Thu__15_May_2008_10_39_25_+1000_AU=2MoHppf6GZg1T
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.6 (GNU/Linux)

iD8DBQFIK4ZBTgG2atn1QN8RAqRIAJ4s33oPEYUlr9QV3mCcmdd9w2cBJgCZAZZg
YhdQb151/rbHz539dJOnzKk=
=6W8R
-----END PGP SIGNATURE-----

--Signature=_Thu__15_May_2008_10_39_25_+1000_AU=2MoHppf6GZg1T--
