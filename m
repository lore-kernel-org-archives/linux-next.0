From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: net tree build warnings
Date: Mon, 16 Mar 2009 17:03:10 +1100
Message-ID: <20090316170310.80afbeba.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Mon__16_Mar_2009_17_03_10_+1100_wk5aK6+9=mEm73.Y"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:54631 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1750956AbZCPGDS (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Mon, 16 Mar 2009 02:03:18 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: "David S. Miller" <davem@davemloft.net>
Cc: linux-next@vger.kernel.org, Dhananjay Phadke <dhananjay@netxen.com>

--Signature=_Mon__16_Mar_2009_17_03_10_+1100_wk5aK6+9=mEm73.Y
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Dave,

Today's (and for a while) linux-next build (x86_64 allmodconfig) produced
these warnings:

drivers/net/netxen/netxen_nic_hw.c: In function 'netxen_load_firmware':
drivers/net/netxen/netxen_nic_hw.c:1146: warning: comparison with string li=
teral results in unspecified behavior
drivers/net/netxen/netxen_nic_hw.c:1146: warning: comparison with string li=
teral results in unspecified behavior
drivers/net/netxen/netxen_nic_hw.c:1146: warning: comparison with string li=
teral results in unspecified behavior
drivers/net/netxen/netxen_nic_hw.c:1159: warning: comparison with string li=
teral results in unspecified behavior
drivers/net/netxen/netxen_nic_hw.c:1159: warning: comparison with string li=
teral results in unspecified behavior
drivers/net/netxen/netxen_nic_hw.c:1159: warning: comparison with string li=
teral results in unspecified behavior

Introduced by commit 567c6c4e2b92f4b8632b043f9395b216b7e7c3ce ("netxen:
firmware download improvements").
--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Mon__16_Mar_2009_17_03_10_+1100_wk5aK6+9=mEm73.Y
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAkm9654ACgkQjjKRsyhoI8z4iwCeNfIrBC9U4nv5ZY+d9xfCWsHM
9z8AoLKg9JpnjTH6XHnPykz1q0d/b5AX
=MoHN
-----END PGP SIGNATURE-----

--Signature=_Mon__16_Mar_2009_17_03_10_+1100_wk5aK6+9=mEm73.Y--
