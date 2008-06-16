From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of net/wireless tree
Date: Mon, 16 Jun 2008 15:03:25 +1000
Message-ID: <20080616150325.8d02efce.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Mon__16_Jun_2008_15_03_25_+1000_dQyaNlL7lCbV/DoO"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:36224 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1750711AbYFPFDg (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Mon, 16 Jun 2008 01:03:36 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: "John W. Linville" <linville@tuxdriver.com>
Cc: linux-next@vger.kernel.org, David Miller <davem@davemloft.net>, Ivo van Doorn <ivdoorn@gmail.com>, Randy Dunlap <randy.dunlap@oracle.com>

--Signature=_Mon__16_Jun_2008_15_03_25_+1000_dQyaNlL7lCbV/DoO
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi John,

Today's linux-next merge of the net tree got a conflicts in
drivers/net/wireless/rt2x00/Kconfig between commits
6847aa5cce6e22c3625a243b02909ac46aafa110 ("rt2x00: LEDS build failure")
and e76328e4a8260707fbc29c99773fb5ba4627096c ("rt2x00: INPUT build
failure") from the net-current/wireless-current tree and commit
3a4d3af700b3d78904775d9a9efe0858b5e1e955 ("rt2x00: Clarify supported
chipsets in Kconfig") from the net/wireless tree.

I fixed them up as per your test merge, thanks.
--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Mon__16_Jun_2008_15_03_25_+1000_dQyaNlL7lCbV/DoO
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAkhV9B0ACgkQTgG2atn1QN9cQACeNVm1RHdromiKvECAzsO9Aja8
lX4An3FR+6qQ+DxZBiuvoipHpGQLOJQB
=Yi9j
-----END PGP SIGNATURE-----

--Signature=_Mon__16_Jun_2008_15_03_25_+1000_dQyaNlL7lCbV/DoO--
