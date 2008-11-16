From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: next-20081114 build failure
Date: Sun, 16 Nov 2008 22:36:12 +1100
Message-ID: <20081116223612.02c1c06f.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Sun__16_Nov_2008_22_36_12_+1100_aIcp7sxCnVP466SH"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:59214 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751601AbYKPLgj (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Sun, 16 Nov 2008 06:36:39 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: "David S. Miller" <davem@davemloft.net>
Cc: linux-next@vger.kernel.org, Wang Chen <wangchen@cn.fujitsu.com>

--Signature=_Sun__16_Nov_2008_22_36_12_+1100_aIcp7sxCnVP466SH
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Dave,

Today's linux-next build (mips allmodconfig) failed like this:

drivers/net/dm9000.c:1450: error: expected ')' before ';' token
drivers/net/dm9000.c:1455: error: expected ';' before '}' token

Caused by commit 4cf1653aa90c6320dc8032443b5e322820aa28b1 ("netdevice:
safe convert to netdev_priv() #part-2") which left a closing ')' off one
of the conversions.

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Sun__16_Nov_2008_22_36_12_+1100_aIcp7sxCnVP466SH
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAkkgBawACgkQjjKRsyhoI8zCegCbBd4dkf5FG8t1wo8zERVNEeD3
B3gAoJFF7rfaiacPkAQOjB1Gp70O8DI7
=Hq9f
-----END PGP SIGNATURE-----

--Signature=_Sun__16_Nov_2008_22_36_12_+1100_aIcp7sxCnVP466SH--
