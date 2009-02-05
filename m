From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the net tree with the  tree
Date: Thu, 5 Feb 2009 14:00:04 +1100
Message-ID: <20090205140004.7cd9f1bd.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Thu__5_Feb_2009_14_00_04_+1100_J8uKNVZps0xe/xTd"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:43529 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752836AbZBEDAL (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Wed, 4 Feb 2009 22:00:11 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: David Miller <davem@davemloft.net>
Cc: linux-next@vger.kernel.org, Helmut Schaa <helmut.schaa@googlemail.com>, "John W. Linville" <linville@tuxdriver.com>, Reinette Chatre <reinette.chatre@intel.com>

--Signature=_Thu__5_Feb_2009_14_00_04_+1100_J8uKNVZps0xe/xTd
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Dave,

Today's linux-next merge of the net tree got a conflict in
drivers/net/wireless/iwlwifi/iwl3945-base.c between commit
c4e061ace75513aee227090486cc46dec7810c00 ("iwlwifi: save PCI state before
suspend, restore after resume") from the wireless-current tree and commit
2663516d8fb896430bf42dce41b3e2f141d63bd5 ("iwl3945: report killswitch
changes even if the interface is down") from the net and wireless trees.

Again, the former is just a subset of the latter.
--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Thu__5_Feb_2009_14_00_04_+1100_J8uKNVZps0xe/xTd
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAkmKVjQACgkQjjKRsyhoI8xiXQCgnZhJQ0qGsY3D+l3Kram2sUzi
F3gAn15QZr46zwqBWAeoZVg/Ywwt2IWm
=UMxI
-----END PGP SIGNATURE-----

--Signature=_Thu__5_Feb_2009_14_00_04_+1100_J8uKNVZps0xe/xTd--
