From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: net/net-current merge conflict
Date: Tue, 10 Jun 2008 17:28:23 +1000
Message-ID: <20080610172823.12e0fb8f.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Tue__10_Jun_2008_17_28_23_+1000_7GPr6RYVfo6ws2k1"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:59134 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751833AbYFJH2d (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Tue, 10 Jun 2008 03:28:33 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: David Miller <davem@davemloft.net>
Cc: linux-next@vger.kernel.org, Matt Carlson <mcarlson@broadcom.com>

--Signature=_Tue__10_Jun_2008_17_28_23_+1000_7GPr6RYVfo6ws2k1
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Dave,

Today's linux-next merge of the net tree got a trivial conflict in
drivers/net/tg3.c between commit 1b84d9462a93ccfa99f725aad744ab4d1af8402b
("tg3: Update version to 3.92.1") from the net-current tree and commit
bb9122b829e960f4e242c04c2b38c12efb37757b ("tg3: Update version to 3.93")
from the net tree.

They both update the version and release dates.  I took the net tree
version.

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Tue__10_Jun_2008_17_28_23_+1000_7GPr6RYVfo6ws2k1
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAkhOLRcACgkQTgG2atn1QN9LaACcDrouCfsEN0flYReNXiPoeYa8
dfUAmQGoEb0irBbvuwmIPIFG6ecwS3KT
=oBTl
-----END PGP SIGNATURE-----

--Signature=_Tue__10_Jun_2008_17_28_23_+1000_7GPr6RYVfo6ws2k1--
