From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the wireless tree with the net-current
 tree
Date: Wed, 8 Jul 2009 12:40:05 +1000
Message-ID: <20090708124005.ecbf2907.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Wed__8_Jul_2009_12_40_05_+1000_c9aGqdwAm=Wt_QVB"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:60877 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1755916AbZGHCkU (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Tue, 7 Jul 2009 22:40:20 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: "John W. Linville" <linville@tuxdriver.com>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, "David S. Miller" <davem@davemloft.net>

--Signature=_Wed__8_Jul_2009_12_40_05_+1000_c9aGqdwAm=Wt_QVB
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi John,

Today's linux-next merge of the wireless tree got a conflict in
drivers/net/wireless/p54/p54common.c between commit
0ca1b08eba627b4245efd0f71b55a062bf163777 ("Revert "p54: Use SKB list
handling helpers instead of by-hand code."") from the net-current tree
and commit 373234a7c69600397aea39c1452806736df2dfc5 ("p54: Modify p54
files for new organization") from the wireless tree.

For today, I just ignored the net-current change.  This will need fixing.
--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Wed__8_Jul_2009_12_40_05_+1000_c9aGqdwAm=Wt_QVB
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAkpUBwUACgkQjjKRsyhoI8z+lgCgm7JzMwKHPQLaMxIc+H1tSMwe
RZYAn1lz5J2pkNRjwsGS82Y7CSCNZaYv
=9dO+
-----END PGP SIGNATURE-----

--Signature=_Wed__8_Jul_2009_12_40_05_+1000_c9aGqdwAm=Wt_QVB--
