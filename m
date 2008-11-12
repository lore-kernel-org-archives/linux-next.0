From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the net tree
Date: Wed, 12 Nov 2008 13:59:34 +1100
Message-ID: <20081112135934.763d688b.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Wed__12_Nov_2008_13_59_34_+1100_V7z7v2qAEfICCRiG"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:50453 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751106AbYKLC7s (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Tue, 11 Nov 2008 21:59:48 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: David Miller <davem@davemloft.net>
Cc: linux-next@vger.kernel.org, Johannes Berg <johannes@sipsolutions.net>, "John W. Linville" <linville@tuxdriver.com>, Jianjun Kong <jianjun@zeuux.org>

--Signature=_Wed__12_Nov_2008_13_59_34_+1100_V7z7v2qAEfICCRiG
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Dave,

Today's linux-next merge of the net tree got a conflict in
net/mac80211/debugfs_sta.c between commit
013cd397532e5803a1625954a884d021653da720 ("mac80211: fix a buffer overrun
in station debug code") from Linus' tree and commit
804feeb826f8a32c8c71a09101fae31804b40ad1 ("mac80211: remove aggregation
status write support from debugfs") from the wireless/net tree.

The latter change just removes the code that the former change was
modifying.  I used the latter and assume that this will be fixed in your
tree soon.

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Wed__12_Nov_2008_13_59_34_+1100_V7z7v2qAEfICCRiG
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAkkaRpYACgkQjjKRsyhoI8wAwgCgnJ4/rUI4Itlse6OGRq8SvogI
tYIAmgJU9LE01zpF9sKLLH/fcDNZtyza
=j3CM
-----END PGP SIGNATURE-----

--Signature=_Wed__12_Nov_2008_13_59_34_+1100_V7z7v2qAEfICCRiG--
