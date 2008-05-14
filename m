From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: net merge conflict
Date: Wed, 14 May 2008 14:54:25 +1000
Message-ID: <20080514145425.a60d9e19.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Wed__14_May_2008_14_54_25_+1000_dcg/3b=LvbTz8QF3"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:60497 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751875AbYENEyc (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Wed, 14 May 2008 00:54:32 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: David Miller <davem@davemloft.net>
Cc: "John W. Linville" <linville@tuxdriver.com>, linux-next@vger.kernel.org, Ivo van Doorn <IvDoorn@gmail.com>

--Signature=_Wed__14_May_2008_14_54_25_+1000_dcg/3b=LvbTz8QF3
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Dave, John,

Today's linux-next merge of the net tree got a conflict in
drivers/net/wireless/rt2x00/rt61pci.c (at the end of rt61pci_beacon_update(=
))
between commit 78720897459a0ed3843c80e9bd9ef1b2f7ae5c8f ("rt2x00:
Don't use pskb_expand_head()") in the net-current/wireless-current trees
and commit e58c6aca99357d7f85f18e0b661d8c5a87f926a9 ("rt2x00: Use rt2x00
queue numbering") in the net/wireless trees.

I think I did the right fixup, but it is probably worth checking.
--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Wed__14_May_2008_14_54_25_+1000_dcg/3b=LvbTz8QF3
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.6 (GNU/Linux)

iD8DBQFIKnCFTgG2atn1QN8RAsYFAJ9ink02WGjmr3LRTodncBO8HPBt2gCdGZQ5
HKSwVn9c/cvChSOkCkQGNOM=
=Pdox
-----END PGP SIGNATURE-----

--Signature=_Wed__14_May_2008_14_54_25_+1000_dcg/3b=LvbTz8QF3--
