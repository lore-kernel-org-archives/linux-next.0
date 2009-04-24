From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: net tree build failure
Date: Fri, 24 Apr 2009 17:01:36 +1000
Message-ID: <20090424170136.fb013660.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Fri__24_Apr_2009_17_01_36_+1000_Kt.Gg4L0RpbzkOfT"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:36137 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752631AbZDXHBp (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Fri, 24 Apr 2009 03:01:45 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: "David S. Miller" <davem@davemloft.net>
Cc: linux-next@vger.kernel.org, Mateusz Mandera <ormi.linux@gmail.com>

--Signature=_Fri__24_Apr_2009_17_01_36_+1000_Kt.Gg4L0RpbzkOfT
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Dave,

Today's linux-next build (m68k defconfig) failed like this:

drivers/net/8390p.c:94:19: error: invalid suffix "p_init_module" on integer=
 constant
drivers/net/8390p.c:94: error: expected identifier or '(' before numeric co=
nstant
drivers/net/8390p.c:99:20: error: invalid suffix "p_cleanup_module" on inte=
ger constant
drivers/net/8390p.c:99: error: expected identifier or '(' before numeric co=
nstant
drivers/net/8390p.c:103:30: error: invalid suffix "p_init_module" on intege=
r constant
drivers/net/8390p.c:104:33: error: invalid suffix "p_cleanup_module" on int=
eger constant

Caused by commit 362b76edb78923face033e18e4ffc85df8db0f28 ("8390p: Get
rid of init_module/cleanup_module").

Clearly not even looked at hard, much less built ...

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Fri__24_Apr_2009_17_01_36_+1000_Kt.Gg4L0RpbzkOfT
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAknxY9AACgkQjjKRsyhoI8xdLACfXnwMBLlKRU9rgY2+YMgZvpZU
w/kAnRLj98UVssfNKwSTXwFEMY/CeIdR
=TDN0
-----END PGP SIGNATURE-----

--Signature=_Fri__24_Apr_2009_17_01_36_+1000_Kt.Gg4L0RpbzkOfT--
