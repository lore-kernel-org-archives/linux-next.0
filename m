From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the net tree with the infiniband tree
Date: Mon, 23 Mar 2009 14:49:52 +1100
Message-ID: <20090323144952.d041176d.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Mon__23_Mar_2009_14_49_52_+1100_CIXQd1qWoTpXZ_l0"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:41145 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1754792AbZCWDt7 (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Sun, 22 Mar 2009 23:49:59 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: David Miller <davem@davemloft.net>
Cc: linux-next@vger.kernel.org, Stephen Hemminger <shemminger@vyatta.com>, Roland Dreier <rolandd@cisco.com>

--Signature=_Mon__23_Mar_2009_14_49_52_+1100_CIXQd1qWoTpXZ_l0
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi David,

Today's linux-next merge of the net tree got a conflict in
drivers/infiniband/hw/nes/nes_nic.c between commit
77dfd6b11ac9f64e5f392be1ff3d14593dabaaf7 ("RDMA/nes: Convert to
net_device_ops") from the infiniband tree and commit
d0929553bebcac828b612e7d6d239559e08feaf4 ("infiniband: convert nes driver
to net_device_ops") from the net tree.

Again, presumably versions of the same thing.  I used the net tree
version.
--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Mon__23_Mar_2009_14_49_52_+1100_CIXQd1qWoTpXZ_l0
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAknHBuAACgkQjjKRsyhoI8w4QACfWId6FR6Li9c2/cgqal8TeuM7
0T0AoJwzv2cch+dOTxo94yh4yqgPqnd+
=hj5P
-----END PGP SIGNATURE-----

--Signature=_Mon__23_Mar_2009_14_49_52_+1100_CIXQd1qWoTpXZ_l0--
