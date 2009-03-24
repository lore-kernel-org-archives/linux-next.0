From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the net tree with the wireless-current
 tree
Date: Tue, 24 Mar 2009 13:37:32 +1100
Message-ID: <20090324133732.59b11ab6.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Tue__24_Mar_2009_13_37_32_+1100_MMmRd6/yo/LFb7D2"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:55942 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751082AbZCXChl (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Mon, 23 Mar 2009 22:37:41 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: David Miller <davem@davemloft.net>, "John W. Linville" <linville@tuxdriver.com>
Cc: linux-next@vger.kernel.org, Jiri Slaby <jirislaby@gmail.com>, Bob Copeland <me@bobcopeland.com>

--Signature=_Tue__24_Mar_2009_13_37_32_+1100_MMmRd6/yo/LFb7D2
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi David, John,

Today's linux-next merge of the net tree got a conflict in
drivers/net/wireless/ath5k/base.c between commit
4f148798de04f7d13d2021f06eee6bccd6453651 ("ath5k: warn and correct rate
for unknown hw rate indexes") from the wireless-current tree and commit
db5b4f7ae3901fdc48c5b988fc2a5e0cb4ec1870 ("ath5k: fix hw rate index
condition") from the net tree.

It looks like the former is a superset of the latter.  I fixed it up (I
used the wireless-current version) and can carry the fix as necessary.
--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Tue__24_Mar_2009_13_37_32_+1100_MMmRd6/yo/LFb7D2
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAknIR2wACgkQjjKRsyhoI8wh5QCgk9xkGBmAlfJjjRdysSaHAt0L
9PsAoLmewAhzgxJSCtnOa1rzaG1A3uqS
=wA1r
-----END PGP SIGNATURE-----

--Signature=_Tue__24_Mar_2009_13_37_32_+1100_MMmRd6/yo/LFb7D2--
