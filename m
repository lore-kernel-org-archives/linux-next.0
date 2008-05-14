From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: net tree merge conflict
Date: Wed, 14 May 2008 15:01:36 +1000
Message-ID: <20080514150136.43e355a3.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Wed__14_May_2008_15_01_36_+1000_1B9G2RSkXdSvp=AO"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:56041 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751888AbYENFBn (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Wed, 14 May 2008 01:01:43 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: David Miller <davem@davemloft.net>
Cc: "John W. Linville" <linville@tuxdriver.com>, linux-next@vger.kernel.org, Yi Zhu <yi.zhu@intel.com>

--Signature=_Wed__14_May_2008_15_01_36_+1000_1B9G2RSkXdSvp=AO
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Dave, John,

Today's linux-next merge of the net tree got a conflict in
drivers/net/wireless/iwlwifi/iwl-4965-rs.c between commit
6243065d308ab566aa318a8adef853bc0418896d ("iwlwifi: fix compile error
when CONFIG_MAC80211_DEBUGFS is not selected") in the
net-current/wireless-current trees and commit
39e885049d9d5e6a65bb2543f82e136c02c253b5 ("iwlwifi: TLC modifications")
in the net/wireless trees.  I did the obvious fixup.

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Wed__14_May_2008_15_01_36_+1000_1B9G2RSkXdSvp=AO
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.6 (GNU/Linux)

iD8DBQFIKnI0TgG2atn1QN8RApeVAJ9mwyn7aJ+Q4aXYYQRN8laU7adAuACgl2UG
aI/KMpH2GRRBQE9F+ttt3Qc=
=YCgD
-----END PGP SIGNATURE-----

--Signature=_Wed__14_May_2008_15_01_36_+1000_1B9G2RSkXdSvp=AO--
