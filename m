From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: wireless/arm build failure
Date: Fri, 7 Nov 2008 12:19:41 +1100
Message-ID: <20081107121941.911bc31a.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Fri__7_Nov_2008_12_19_41_+1100_HO16bBiASuA=T6hM"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:38754 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752279AbYKGBTv (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Thu, 6 Nov 2008 20:19:51 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Johannes Berg <johannes@sipsolutions.net>
Cc: linux-next@vger.kernel.org, "John W. Linville" <linville@tuxdriver.com>, Russell King <rmk@arm.linux.org.uk>

--Signature=_Fri__7_Nov_2008_12_19_41_+1100_HO16bBiASuA=T6hM
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi all,

An arm cam60_defconfig build of next-20081106 produces these errors:

include/net/mac80211.h:405: error: size of array 'type name' is negative
net/mac80211/main.c:957: error: size of array 'type name' is negative

The first is
        BUILD_BUG_ON(
            offsetof(struct ieee80211_tx_info, status.ampdu_ack_len) !=3D 2=
3);
in ieee80211_tx_info_clear_status().
The second is
        BUILD_BUG_ON(sizeof(struct ieee80211_tx_info) > sizeof(skb->cb));
in ieee80211_init().

Maybe something to do with commit
e6a9854b05c1a6af1308fe2b8c68f35abf28a3ee ("mac80211/drivers: rewrite the
rate control API") from the wireless tree (which introduced the
BUILD_BUG_ON in mac80211.h and modified struct ieee80211_tx_info
somewhat).

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Fri__7_Nov_2008_12_19_41_+1100_HO16bBiASuA=T6hM
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAkkTl60ACgkQjjKRsyhoI8wEHACfYrR9bEZrb0DxYrxFH8Go3tIb
c/kAn3CC13bvs9JVJXRPRWJBxtgyBvzH
=s8Cc
-----END PGP SIGNATURE-----

--Signature=_Fri__7_Nov_2008_12_19_41_+1100_HO16bBiASuA=T6hM--
