From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the net tree
Date: Thu, 19 Jun 2008 13:04:56 +1000
Message-ID: <20080619130456.e9e22b32.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Thu__19_Jun_2008_13_04_56_+1000_12XBrU1n7tg8l7oP"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:45986 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751582AbYFSDFE (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Wed, 18 Jun 2008 23:05:04 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: David Miller <davem@davemloft.net>
Cc: linux-next@vger.kernel.org, "John W. Linville" <linville@tuxdriver.com>

--Signature=_Thu__19_Jun_2008_13_04_56_+1000_12XBrU1n7tg8l7oP
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Dave,

Today's linux-next merge of the net tree got a conflict in
net/mac80211/tx.c between commit 3a5be7d4b079f3a9ce1e8ce4a93ba15ae6d00111
("Revert "mac80211: Use skb_header_cloned() on TX path."") from the
Linus' tree and commit 23c0752a25d73ccc4547700e8a57d5ae2f2edf56
("mac80211: clean up skb reallocation code") from the net (wireless) tree.

I couldn't readily see what to do with it, so I took the version in the
net tree.  I assume that this will be sorted out next time that the
wireless (or net) tree pulls in Linus' tree.

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Thu__19_Jun_2008_13_04_56_+1000_12XBrU1n7tg8l7oP
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAkhZzNgACgkQTgG2atn1QN8IjgCfedm4/O1loiKU+9MmChNSWEqa
wKEAnRTdkgo+0l557XXzNPxrPOWTawKi
=tyPL
-----END PGP SIGNATURE-----

--Signature=_Thu__19_Jun_2008_13_04_56_+1000_12XBrU1n7tg8l7oP--
