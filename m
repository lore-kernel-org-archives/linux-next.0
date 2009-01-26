From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: net tree build failure
Date: Mon, 26 Jan 2009 13:53:07 +1100
Message-ID: <20090126135307.e4630fc7.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Mon__26_Jan_2009_13_53_07_+1100_60L=WEo7D/zwjEDb"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:47296 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1750970AbZAZCxP (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Sun, 25 Jan 2009 21:53:15 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: David Miller <davem@davemloft.net>
Cc: linux-next@vger.kernel.org, Stephen Hemminger <shemminger@linux-foundation.org>

--Signature=_Mon__26_Jan_2009_13_53_07_+1100_60L=WEo7D/zwjEDb
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Dave,

Today's linux-next build (x86_64 allmodconfig) failed like this:

ERROR: "com20020_netdev_ops" [drivers/net/arcnet/com20020-pci.ko] undefined!

We are not winning with this one :-(

Again caused by commit a1799af4d7deefccdaa9d222a886fa1373dbb49a
("com20020: convert to net_devic_ops") which needed to export the
com20020_netdev_ops to modules.

I have reverted that commit (and 0db155de988031f925096a7df1bf9633790a2c18
"com20020: Fix allyesconfig build failure" which depends on it).
--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Mon__26_Jan_2009_13_53_07_+1100_60L=WEo7D/zwjEDb
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAkl9JZMACgkQjjKRsyhoI8yWWQCgqjNIChJyPFTj47eo66u7TOT8
2iMAniBY3+vMHgiHJybkLyd10rwmsFXS
=1Db6
-----END PGP SIGNATURE-----

--Signature=_Mon__26_Jan_2009_13_53_07_+1100_60L=WEo7D/zwjEDb--
