From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: net tree build failure
Date: Mon, 20 Apr 2009 11:26:29 +1000
Message-ID: <20090420112629.370c209b.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Mon__20_Apr_2009_11_26_29_+1000_X1ydoGSC8ZxPUQZk"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:56437 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1750814AbZDTB0l (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Sun, 19 Apr 2009 21:26:41 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: David Miller <davem@davemloft.net>
Cc: linux-next@vger.kernel.org, Alexander Beregalov <a.beregalov@gmail.com>

--Signature=_Mon__20_Apr_2009_11_26_29_+1000_X1ydoGSC8ZxPUQZk
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Dave,

Today's linux-next build (powerpc ppc64_defconfig) failed like this:

drivers/net/iseries_veth.c: In function 'veth_probe_one':
drivers/net/iseries_veth.c:1080: error: 'struct net_device' has no member n=
amed 'netdev'

Caused by commit c2775360e82760be3ad7339a7a1442c45c35b395 ("iseries_veth:
convert to net_device_ops").

I have used the net tree from next-20090417 for today.
--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Mon__20_Apr_2009_11_26_29_+1000_X1ydoGSC8ZxPUQZk
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAknrz0UACgkQjjKRsyhoI8xjfQCfSapFs6OnYeOjN5caDsqgyVVf
nTcAoJCp9KyDI7s0+NMbJ20ZDf8vjjnQ
=T7RS
-----END PGP SIGNATURE-----

--Signature=_Mon__20_Apr_2009_11_26_29_+1000_X1ydoGSC8ZxPUQZk--
