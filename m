From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: wireless/wireless-current
Date: Tue, 10 Jun 2008 17:46:06 +1000
Message-ID: <20080610174606.a0b74e51.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Tue__10_Jun_2008_17_46_06_+1000_bEozOL=8rXvq+qmI"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:50466 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751014AbYFJHqR (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Tue, 10 Jun 2008 03:46:17 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: "John W. Linville" <linville@tuxdriver.com>
Cc: Assaf Krauss <assaf.krauss@intel.com>, Johannes Berg <johannes@sipsolutions.net>, linux-next@vger.kernel.org

--Signature=_Tue__10_Jun_2008_17_46_06_+1000_bEozOL=8rXvq+qmI
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi

Today's linux-next merge of the wireless tree got a conflict in
net/mac80211/ieee80211_i.h between commit
be038b376465953c358d675cb38a611898a49dc2 ("mac80211: Checking IBSS
support while changing channel in ad-hoc mode") from the
nwireless-current tree and commit
9e72ebd686a7f39facdfff639386055f1ad7dc88 ("mac80211: remove channel use
statistics") from the wireless tree.

It was just a context overlap and I did the obvious fixup.  You might
want to check the result.

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Tue__10_Jun_2008_17_46_06_+1000_bEozOL=8rXvq+qmI
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAkhOMT4ACgkQTgG2atn1QN9/LACeKA7VSZ68X8UkvL1l40lzWn0b
yukAnjEtD6Uxf4N+CIJXymXHdmjHa04Q
=4+SH
-----END PGP SIGNATURE-----

--Signature=_Tue__10_Jun_2008_17_46_06_+1000_bEozOL=8rXvq+qmI--
