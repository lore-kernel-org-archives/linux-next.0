From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the net tree
Date: Mon, 10 Nov 2008 14:02:53 +1100
Message-ID: <20081110140253.f2c1d262.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Mon__10_Nov_2008_14_02_53_+1100_4tT2Jw00_gtSmMJ1"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:33384 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752813AbYKJDDM (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Sun, 9 Nov 2008 22:03:12 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: David Miller <davem@davemloft.net>
Cc: linux-next@vger.kernel.org, Alan Cox <alan@lxorguk.ukuu.org.uk>, Johannes Berg <johannes@sipsolutions.net>

--Signature=_Mon__10_Nov_2008_14_02_53_+1100_4tT2Jw00_gtSmMJ1
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Dave,

Today's linux-next merge of the net tree got a conflict in
drivers/message/fusion/mptlan.c between commit
54e7ff9d6249ba88e393d7fbc8008da9279723be ("trivial: MPT fusion - remove
long dead code") from Linus' tree and commit
7c510e4b730a92cecf94ada45c989d8be0200d47 ("net: convert more to %pM")
from the net tree.

The former just removed some of the code that the latter modified.  I
have removed the code and expect the ocnflict will be fixed in your tree
soon.
--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Mon__10_Nov_2008_14_02_53_+1100_4tT2Jw00_gtSmMJ1
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAkkXpF0ACgkQjjKRsyhoI8ywigCfR1/3mAdGHJK2vf2HRJ4X34zU
lXoAniWZQw+D7SniJaZfLu2IuaQVXmcE
=dCzf
-----END PGP SIGNATURE-----

--Signature=_Mon__10_Nov_2008_14_02_53_+1100_4tT2Jw00_gtSmMJ1--
