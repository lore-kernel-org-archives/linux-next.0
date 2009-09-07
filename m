From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: slab tree build failure
Date: Mon, 7 Sep 2009 15:37:23 +1000
Message-ID: <20090907153723.0c984c83.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Mon__7_Sep_2009_15_37_23_+1000_YDEqp_F1M3WAiicy"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:48769 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1755217AbZIGFhc (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Mon, 7 Sep 2009 01:37:32 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Pekka Enberg <penberg@cs.helsinki.fi>, Christoph Lameter <cl@linux-foundation.org>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, "Luis R. Rodriguez" <lrodriguez@atheros.com>, "John W. Linville" <linville@tuxdriver.com>

--Signature=_Mon__7_Sep_2009_15_37_23_+1000_YDEqp_F1M3WAiicy
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next build (x86_64 allmodconfig) failed like this:

net/wireless/scan.c: In function 'cfg80211_inform_bss':
net/wireless/scan.c:499: error: implicit declaration of function 'kmemleak_=
ignore'

Caused by commit 74ce35c0d2261896ed4d49799311a894520f7a94 ("cfg80211:
clear cfg80211_inform_bss() from kmemleak reports") from the wireless
tree (which should have included linux/kmemleak.h into
net/wireless/scan.c).  Some interaction with the slab tree has exposed
this.

I have reverted the above commit for today.
--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Mon__7_Sep_2009_15_37_23_+1000_YDEqp_F1M3WAiicy
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAkqknBMACgkQjjKRsyhoI8yGfgCfRgbHPKfQ3vc+VIhyLYRWqzE8
RkYAn3qZ5o1zhJBB1FYOi2WvBH0OQYQc
=c0Ps
-----END PGP SIGNATURE-----

--Signature=_Mon__7_Sep_2009_15_37_23_+1000_YDEqp_F1M3WAiicy--
