From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the net tree with the infiniband tree
Date: Mon, 23 Mar 2009 14:50:01 +1100
Message-ID: <20090323145001.6615d77b.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Mon__23_Mar_2009_14_50_01_+1100_xfVf_vQE19BvF_xp"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:41152 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1754836AbZCWDuH (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Sun, 22 Mar 2009 23:50:07 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: David Miller <davem@davemloft.net>
Cc: linux-next@vger.kernel.org, Stephen Hemminger <shemminger@vyatta.com>, Roland Dreier <rolandd@cisco.com>

--Signature=_Mon__23_Mar_2009_14_50_01_+1100_xfVf_vQE19BvF_xp
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi David,

Today's linux-next merge of the net tree got a conflict in
drivers/infiniband/ulp/ipoib/ipoib_main.c between commit
574d30e9fd416037fc85bcbb148074214aee50e1 ("IPoIB: Convert to
net_device_ops") from the infiniband tree and commit
fe8114e8e1d15ba07ddcaebc4741957a1546f307 ("infiniband: convert ipoib to
net_device_ops") from the net tree.

Again different versions of the same change.  I used the net tree version.
--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Mon__23_Mar_2009_14_50_01_+1100_xfVf_vQE19BvF_xp
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAknHBukACgkQjjKRsyhoI8ypDwCcDQu+VtUphqapZDN7dLZQJlif
bbIAnRHQZDSjC4L3l2TguBbbKM8Ua0tF
=/Sbe
-----END PGP SIGNATURE-----

--Signature=_Mon__23_Mar_2009_14_50_01_+1100_xfVf_vQE19BvF_xp--
