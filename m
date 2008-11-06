From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: new warnings
Date: Thu, 6 Nov 2008 14:25:14 +1100
Message-ID: <20081106142514.42bbe615.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Thu__6_Nov_2008_14_25_14_+1100_MLj81niVdFnrAUcC"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:56030 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752629AbYKFDZY (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Wed, 5 Nov 2008 22:25:24 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Johannes Berg <johannes@sipsolutions.net>
Cc: linux-next@vger.kernel.org, "John W. Linville" <linville@tuxdriver.com>, "David S. Miller" <davem@davemloft.net>

--Signature=_Thu__6_Nov_2008_14_25_14_+1100_MLj81niVdFnrAUcC
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi all,

Commit 7a5158ef8da70fdedeb0530faaa8128aa645be3c ("mac80211: fix short
slot handling") added this:

/* XXX: remove all this once drivers stop trying to use it */
static inline int __deprecated __IEEE80211_CONF_SHORT_SLOT_TIME(void)
	.
	.
#define IEEE80211_CONF_SHORT_SLOT_TIME (__IEEE80211_CONF_SHORT_SLOT_TIME())

to include/net/mac80211.h.  I was wondering if any thought was given to
getting rid of the (currently 4) in tree uses of
IEEE80211_CONF_SHORT_SLOT_TIME before doing this so that we don't have
even more new warnings from the kernel build.

The least that could be done is to clean them up now ...
--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Thu__6_Nov_2008_14_25_14_+1100_MLj81niVdFnrAUcC
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAkkSY5oACgkQjjKRsyhoI8ynsACfZIhajfZ/kcI8UEs5EJ4SPwHB
j5UAoLIezX0OjaSKCo2UCpvZz/s1FL6u
=Y5kz
-----END PGP SIGNATURE-----

--Signature=_Thu__6_Nov_2008_14_25_14_+1100_MLj81niVdFnrAUcC--
