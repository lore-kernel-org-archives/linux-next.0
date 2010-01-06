From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the wireless tree with Linus' tree
Date: Wed, 6 Jan 2010 13:29:09 +1100
Message-ID: <20100106132909.1faca672.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Wed__6_Jan_2010_13_29_09_+1100_v2m8jnFjHMxhLUzu"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:48642 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1753436Ab0AFC3R (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Tue, 5 Jan 2010 21:29:17 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: "John W. Linville" <linville@tuxdriver.com>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Zhu Yi <yi.zhu@intel.com>, David Miller <davem@davemloft.net>

--Signature=_Wed__6_Jan_2010_13_29_09_+1100_v2m8jnFjHMxhLUzu
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi John,

Today's linux-next merge of the wireless tree got a conflict in
drivers/net/wireless/iwlwifi/iwl-core.h between commit
46e75f66677f5094bb51e91f9473128c4e907c7d ("net: fix for utsrelease.h
moving to generated") from Linus' tree and commit
61b91c1ea31d0d3ae5f848f7f7eab53dd691f8d0 ("iwlwifi: remove
linux/utsrelease.h dependency") from the wireless tree.

The latter clearly removes the need for the former, so I used that.
--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Wed__6_Jan_2010_13_29_09_+1100_v2m8jnFjHMxhLUzu
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)

iEYEARECAAYFAktD9XUACgkQjjKRsyhoI8xD8QCgv++MTZQzgyGjKkPdyj8+/lDC
eOIAoIyd2wiQcLDzgxmbl25tt25eTBrU
=O1gh
-----END PGP SIGNATURE-----

--Signature=_Wed__6_Jan_2010_13_29_09_+1100_v2m8jnFjHMxhLUzu--
