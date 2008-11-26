From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the net tree
Date: Wed, 26 Nov 2008 17:42:40 +1100
Message-ID: <20081126174240.8db9589f.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Wed__26_Nov_2008_17_42_40_+1100_zUHvmJET5bchuhGg"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:33875 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1750718AbYKZGnC (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Wed, 26 Nov 2008 01:43:02 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: David Miller <davem@davemloft.net>
Cc: linux-next@vger.kernel.org, Ingo Molnar <mingo@elte.hu>, "John W. Linville" <linville@tuxdriver.com>, Johannes Berg <johannes@sipsolutions.net>

--Signature=_Wed__26_Nov_2008_17_42_40_+1100_zUHvmJET5bchuhGg
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Dave,

Today's linux-next merge of the net tree got a conflict in
net/wireless/reg.c between commit
020cf6ba7a91ccc5db359f91e9abba175fd3a0aa ("net/wireless/reg.c: fix bad
WARN_ON in if statement") from the net-current tree and commit
2083c4997b95fffe8d4f71741bef2298810805a3 ("wireless: clean up regulatory
ignore_request function") from the net tree.

The latter removed the code that the former fixed.  I assume that this
conflict will be fixed in the net tree soon.

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Wed__26_Nov_2008_17_42_40_+1100_zUHvmJET5bchuhGg
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAkks7+AACgkQjjKRsyhoI8wznQCfXhSA6nRXSHLtAKPkgKmjg2rI
UEkAnjBAfl1uwmlP6phnFFgk5tUvuoed
=sCel
-----END PGP SIGNATURE-----

--Signature=_Wed__26_Nov_2008_17_42_40_+1100_zUHvmJET5bchuhGg--
