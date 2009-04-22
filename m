From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the wireless tree with the
 wireless-current tree
Date: Wed, 22 Apr 2009 11:32:30 +1000
Message-ID: <20090422113230.8c36e9ed.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Wed__22_Apr_2009_11_32_30_+1000_ex1gyvukZ6obzvBi"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:45798 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751874AbZDVBcj (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Tue, 21 Apr 2009 21:32:39 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: "John W. Linville" <linville@tuxdriver.com>
Cc: linux-next@vger.kernel.org, Reinette Chatre <reinette.chatre@intel.com>, Johannes Berg <johannes@sipsolutions.net>

--Signature=_Wed__22_Apr_2009_11_32_30_+1000_ex1gyvukZ6obzvBi
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi John,

Today's linux-next merge of the wireless tree got a conflict in
net/mac80211/pm.c between commit 7d42081a271bd8a82f2100524085c4f029e47717
("mac80211: do not print WARN if config interface") from the
wireless-current tree and commit aa3590f6a8ebc24d38698ffb81fb51e97f03c4f4
("mac80211: add hardware restart function") from the wireless tree.

The latter moved the code (to net/mac80211/util.c:ieee80211_reconfig)
that the former modified.  I just used the version in the wireless tree
and will leave you to fix this up when the merge happens.
--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Wed__22_Apr_2009_11_32_30_+1000_ex1gyvukZ6obzvBi
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAknuc64ACgkQjjKRsyhoI8w2CwCgpQUscgvPBdgqNij/CmRHGW2h
9wwAn2P/01VAzjRflpfaI5K0AFkEOm71
=0Wfn
-----END PGP SIGNATURE-----

--Signature=_Wed__22_Apr_2009_11_32_30_+1000_ex1gyvukZ6obzvBi--
