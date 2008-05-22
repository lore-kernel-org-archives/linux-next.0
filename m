From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: wireless/wireless-current merge conflict
Date: Thu, 22 May 2008 13:20:31 +1000
Message-ID: <20080522132031.3c05b6f7.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Thu__22_May_2008_13_20_31_+1000_e=/EvjVfWdbTS7yc"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:59021 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1759439AbYEVDUk (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Wed, 21 May 2008 23:20:40 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: "John W. Linville" <linville@tuxdriver.com>, David Miller <davem@davemloft.net>
Cc: Johannes Berg <johannes@sipsolutions.net>, linux-next@vger.kernel.org, Helmut Schaa <hschaa@suse.de>

--Signature=_Thu__22_May_2008_13_20_31_+1000_e=/EvjVfWdbTS7yc
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi John, Dave,

Today's linux-next merge of the net tree got a (trivial) conflict in
net/mac80211/mlme.c between commit
0d580a774b3682b8b2b5c89ab9b813d149ef28e7 ("mac80211: fix NULL pointer
dereference in ieee80211_compatible_rates") from the wireless-current
tree and commit 988c0f723d0b1abb399e6e71d8bf3f8bf1949a70 ("mac80211: a
few code cleanups") from the wireless tree.

The conflict is just contextual with the latter patch removing braces
around some code very near the insertion in the former patch.  I did the
obvious fixup.  You may want to check (around line 724).

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Thu__22_May_2008_13_20_31_+1000_e=/EvjVfWdbTS7yc
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.6 (GNU/Linux)

iD8DBQFINOaETgG2atn1QN8RAmBFAJ9GuJpxCjsM38r1Q6+hSbfYxys4WQCfR//p
ezCKLMtHfBcm0HVCDXtGABE=
=nx8N
-----END PGP SIGNATURE-----

--Signature=_Thu__22_May_2008_13_20_31_+1000_e=/EvjVfWdbTS7yc--
