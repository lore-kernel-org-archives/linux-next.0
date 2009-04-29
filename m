From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: net tree build warnings
Date: Wed, 29 Apr 2009 14:59:21 +1000
Message-ID: <20090429145921.5bb48c01.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Wed__29_Apr_2009_14_59_21_+1000_75C9KY7JSKtO2MB3"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:39622 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1756786AbZD2E71 (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Wed, 29 Apr 2009 00:59:27 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: "David S. Miller" <davem@davemloft.net>
Cc: linux-next@vger.kernel.org, Alexander Beregalov <a.beregalov@gmail.com>

--Signature=_Wed__29_Apr_2009_14_59_21_+1000_75C9KY7JSKtO2MB3
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Dave,

Today's linux-next build (x86_64 allmodconfig) produced these warnings:

drivers/net/vxge/vxge-traffic.c: In function '__vxge_hw_vpath_alarm_process=
':
drivers/net/vxge/vxge-traffic.c:1924: warning: comparison of distinct point=
er types lacks a cast
drivers/net/vxge/vxge-traffic.c:1934: warning: comparison of distinct point=
er types lacks a cast
drivers/net/vxge/vxge-traffic.c:1948: warning: comparison of distinct point=
er types lacks a cast
drivers/net/vxge/vxge-traffic.c:1978: warning: comparison of distinct point=
er types lacks a cast
drivers/net/vxge/vxge-traffic.c:1999: warning: comparison of distinct point=
er types lacks a cast
drivers/net/vxge/vxge-traffic.c:2006: warning: comparison of distinct point=
er types lacks a cast
drivers/net/vxge/vxge-traffic.c:2029: warning: comparison of distinct point=
er types lacks a cast
drivers/net/vxge/vxge-traffic.c:2038: warning: comparison of distinct point=
er types lacks a cast
drivers/net/vxge/vxge-traffic.c:2060: warning: comparison of distinct point=
er types lacks a cast
drivers/net/vxge/vxge-traffic.c:2076: warning: comparison of distinct point=
er types lacks a cast
drivers/net/vxge/vxge-traffic.c:2085: warning: comparison of distinct point=
er types lacks a cast
drivers/net/vxge/vxge-traffic.c:2094: warning: comparison of distinct point=
er types lacks a cast
drivers/net/vxge/vxge-traffic.c:2101: warning: comparison of distinct point=
er types lacks a cast
drivers/net/vxge/vxge-traffic.c:2125: warning: comparison of distinct point=
er types lacks a cast
drivers/net/vxge/vxge-traffic.c:2133: warning: comparison of distinct point=
er types lacks a cast
drivers/net/vxge/vxge-traffic.c:2141: warning: comparison of distinct point=
er types lacks a cast
drivers/net/vxge/vxge-traffic.c:2148: warning: comparison of distinct point=
er types lacks a cast

Caused by commit 011983048a120e520147361be1067dd82343038e ("vxge: use max()
instead of VXGE_HW_SET_LEVEL").
--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Wed__29_Apr_2009_14_59_21_+1000_75C9KY7JSKtO2MB3
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAkn33qkACgkQjjKRsyhoI8wcpwCdFZv0A1sS4dtw58BysBbPk7Vw
l1kAnRGIlHaym8nBKlvvgWkbCv+E6mtm
=XRiw
-----END PGP SIGNATURE-----

--Signature=_Wed__29_Apr_2009_14_59_21_+1000_75C9KY7JSKtO2MB3--
