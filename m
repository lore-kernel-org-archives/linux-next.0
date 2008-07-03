From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the net tree
Date: Thu, 3 Jul 2008 13:56:41 +1000
Message-ID: <20080703135641.8cae3bc1.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Thu__3_Jul_2008_13_56_41_+1000_x2OI+xeEO8=qL1HH"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:58351 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1754722AbYGCD4w (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Wed, 2 Jul 2008 23:56:52 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: David Miller <davem@davemloft.net>
Cc: linux-next@vger.kernel.org, Vlad Yasevich <vladislav.yasevich@hp.com>

--Signature=_Thu__3_Jul_2008_13_56_41_+1000_x2OI+xeEO8=qL1HH
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi David,

Today's linux-next merge of the net tree got a conflict in  between
commit 16d752397301b95abaa95cbaf9e785d221872311 ("thermal: Create
CONFIG_THERMAL_HWMON=3Dn") from Linus' tree and commit
ecbed6a41900126e7b9509e12a8d0cc22176e3eb ("sctp: Mark GET_PEER|
LOCAL_ADDR_OLD deprecated") from the net tree.

I just took both new entries.

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Thu__3_Jul_2008_13_56_41_+1000_x2OI+xeEO8=qL1HH
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAkhsTfoACgkQjjKRsyhoI8zZdwCgt0ueP5X6lmF3kyKseRLNkRaS
cJYAoICb4oPF6p8fXuGmhwkGd16G5EzO
=4DyS
-----END PGP SIGNATURE-----

--Signature=_Thu__3_Jul_2008_13_56_41_+1000_x2OI+xeEO8=qL1HH--
