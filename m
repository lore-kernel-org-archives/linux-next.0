From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the wireless tree
Date: Thu, 20 Nov 2008 14:07:50 +1100
Message-ID: <20081120140750.1373326e.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Thu__20_Nov_2008_14_07_50_+1100__WIUs5JvlESxuzrG"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:42881 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751818AbYKTDIT (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Wed, 19 Nov 2008 22:08:19 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: "John W. Linville" <linville@tuxdriver.com>
Cc: linux-next@vger.kernel.org, Johannes Berg <johannes@sipsolutions.net>, "Winkler, Tomas" <tomas.winkler@intel.com>, Reinette Chatre <reinette.chatre@intel.com>, "Zhu, Yi" <yi.zhu@intel.com>

--Signature=_Thu__20_Nov_2008_14_07_50_+1100__WIUs5JvlESxuzrG
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi John,

Today's linux-next merge of the wireless tree got a conflict in
drivers/net/wireless/iwlwifi/iwl-rx.c between commit
4018517a1a69a85c3d61b20fa02f187b80773137 ("iwlagn: fix RX skb alignment")
from the wireless-current tree and commit
07e27f25d0c73f42562473f642f20b8fa996a9de ("iwlwifi: move rx queue read
pointer into rxq") from the wireless tree.

I wasn't sure how to resolve the conflict so have dropped the wireless
tree for today.  I assume it will be fixed in the wireless (or net) tree
soon.
--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Thu__20_Nov_2008_14_07_50_+1100__WIUs5JvlESxuzrG
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAkkk1IYACgkQjjKRsyhoI8ybTwCfZHLja1vztxH3TaPw9/18B3cK
xpkAn3mnV8+PJJITnnVe5xQr3QPe4ngQ
=8NDa
-----END PGP SIGNATURE-----

--Signature=_Thu__20_Nov_2008_14_07_50_+1100__WIUs5JvlESxuzrG--
