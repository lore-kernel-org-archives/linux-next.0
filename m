From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the net tree
Date: Tue, 8 Jul 2008 14:16:07 +1000
Message-ID: <20080708141607.404681a4.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Tue__8_Jul_2008_14_16_07_+1000_JA0BYVt3IbsQMGeF"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:57849 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751046AbYGHEQQ (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Tue, 8 Jul 2008 00:16:16 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: David Miller <davem@davemloft.net>
Cc: linux-next@vger.kernel.org, Darren Jenkins <darrenrjenkins@gmail.com>, "John W. Linville" <linville@tuxdriver.com>, Harvey Harrison <harvey.harrison@gmail.com>

--Signature=_Tue__8_Jul_2008_14_16_07_+1000_JA0BYVt3IbsQMGeF
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi David,

Today's linux-next merge of the net tree got a conflict in
drivers/net/wireless/iwlwifi/iwl-3945.c between commit
0ff1cca0e272045b9c11a2ff94bd3e6893c9308c
("drivers/net/wireless/iwlwifi/iwl-3945.c Fix type issue on 64bit") from
the wireless-current tree and commit
fd7c8a40b2a63863f749e4d17f0d94d2e5ab1331 ("mac80211: add helpers for
frame control testing") from the net tree.

I applied the former change to the latter's code and can carry the fixup
while necessary.

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Tue__8_Jul_2008_14_16_07_+1000_JA0BYVt3IbsQMGeF
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAkhy6gcACgkQjjKRsyhoI8zQWwCfT2KLluyVEs9MsjynRAW8CHLX
oV4AoLDbtuNNqR8pTEVL1LsuNWbeRH5h
=oObL
-----END PGP SIGNATURE-----

--Signature=_Tue__8_Jul_2008_14_16_07_+1000_JA0BYVt3IbsQMGeF--
