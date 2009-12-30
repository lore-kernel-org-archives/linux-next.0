From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: wireless tree build warnings
Date: Thu, 31 Dec 2009 10:57:09 +1100
Message-ID: <20091231105709.c50f22c0.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Thu__31_Dec_2009_10_57_09_+1100_w6qTySxI2GcgrZXX"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:55934 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752243AbZL3X5P (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Wed, 30 Dec 2009 18:57:15 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: "John W. Linville" <linville@tuxdriver.com>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Johannes Berg <johannes@sipsolutions.net>

--Signature=_Thu__31_Dec_2009_10_57_09_+1100_w6qTySxI2GcgrZXX
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi John,

Today's linux-next build (i386 defconfig) produced thes warnings:

net/mac80211/work.c: In function 'ieee80211_remain_on_channel_timeout':
net/mac80211/work.c:534: warning: cast from pointer to integer of different=
 size
net/mac80211/work.c: In function 'ieee80211_remain_done':
net/mac80211/work.c:1030: warning: cast from pointer to integer of differen=
t size
net/mac80211/work.c: In function 'ieee80211_wk_remain_on_channel':
net/mac80211/work.c:1056: warning: cast from pointer to integer of differen=
t size
net/mac80211/work.c: In function 'ieee80211_wk_cancel_remain_on_channel':
net/mac80211/work.c:1072: warning: cast from pointer to integer of differen=
t size

Introduced by commits e4da8c37af626001ff704fb29ea14eb58f5f7208
("mac80211: make off-channel work generic") and
b8bc4b0aa9bfba755c64b11b8f60e6cfab25dc9d ("mac80211: support
remain-on-channel command").

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Thu__31_Dec_2009_10_57_09_+1100_w6qTySxI2GcgrZXX
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)

iEYEARECAAYFAks76NUACgkQjjKRsyhoI8yW2gCfcqfTaq/BGpI1oKh/0jdGT4Qg
kecAn1ZR/pDVqGZ4HJ/v7tPyFoB/9eqs
=tA7x
-----END PGP SIGNATURE-----

--Signature=_Thu__31_Dec_2009_10_57_09_+1100_w6qTySxI2GcgrZXX--
