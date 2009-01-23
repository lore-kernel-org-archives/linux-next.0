From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: net tree build failure
Date: Fri, 23 Jan 2009 18:28:47 +1100
Message-ID: <20090123182847.718fdb85.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Fri__23_Jan_2009_18_28_47_+1100_uNsRU02M_Yd92y98"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:33006 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751402AbZAWH2y (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Fri, 23 Jan 2009 02:28:54 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: "David S. Miller" <davem@davemloft.net>
Cc: linux-next@vger.kernel.org, Stephen Hemminger <shemminger@linux-foundation.org>

--Signature=_Fri__23_Jan_2009_18_28_47_+1100_uNsRU02M_Yd92y98
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Dave,

Today's linux-next build (powerpc allyesconfig) failed like this:

drivers/net/arcnet/com20020-pci.o:(.bss+0x10): multiple definition of `com2=
0020_netdev_ops'
drivers/net/arcnet/com20020.o:(.data.rel.ro+0x0): first defined here

The immediate cause is commit a1799af4d7deefccdaa9d222a886fa1373dbb49a
("com20020: convert to net_devic_ops") which I have reverted for today.

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Fri__23_Jan_2009_18_28_47_+1100_uNsRU02M_Yd92y98
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAkl5ca8ACgkQjjKRsyhoI8yrqACgqMd9TKMFbu+tPNJHqCcXIw33
wY4AoLyiKE14SiWuj9JUUHcSk0hD+Tzj
=SJtp
-----END PGP SIGNATURE-----

--Signature=_Fri__23_Jan_2009_18_28_47_+1100_uNsRU02M_Yd92y98--
