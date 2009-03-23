From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the net tree with the infiniband tree
Date: Mon, 23 Mar 2009 14:49:35 +1100
Message-ID: <20090323144935.9f8f4ab3.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Mon__23_Mar_2009_14_49_35_+1100_5uUPeknncNe2IH3g"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:41141 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1754290AbZCWDtp (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Sun, 22 Mar 2009 23:49:45 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: David Miller <davem@davemloft.net>
Cc: linux-next@vger.kernel.org, Stephen Hemminger <shemminger@vyatta.com>, Roland Dreier <rolandd@cisco.com>

--Signature=_Mon__23_Mar_2009_14_49_35_+1100_5uUPeknncNe2IH3g
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi David,

Today's linux-next merge of the net tree got conflicts in
drivers/infiniband/hw/amso1100/c2.c and
drivers/infiniband/hw/amso1100/c2_provider.c between commit
7edd87ddd12dd9a735e59d8381d10f25dacc6505 ("RDMA/amso1100: Convert to
net_device_ops") from the infiniband tree and commit
687c75dcf342f71329bd193af553e96a29581238 ("infiniband: convert c2 to
net_device_ops") from the net tree.

Presumably these are two versions of the same thing (the one in the
infiniband tree dates from January).

I fixed the conflicts using the version in the net tree.  Someone should
check the result.

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Mon__23_Mar_2009_14_49_35_+1100_5uUPeknncNe2IH3g
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAknHBs8ACgkQjjKRsyhoI8yBXQCeJUDjBgJqVSFO1oO/8LeKfpqn
uL0Anidw5wcZSyeKvE3c8sPtrOt/cA+v
=SX/w
-----END PGP SIGNATURE-----

--Signature=_Mon__23_Mar_2009_14_49_35_+1100_5uUPeknncNe2IH3g--
