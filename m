From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the trivial tree
Date: Mon, 28 Jul 2008 13:37:07 +1000
Message-ID: <20080728133707.087f1d73.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Mon__28_Jul_2008_13_37_07_+1000_QBWutGEf774XlkuP"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:47385 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751635AbYG1DhR (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Sun, 27 Jul 2008 23:37:17 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Jesper Juhl <jesper.juhl@gmail.com>
Cc: linux-next@vger.kernel.org, Arthur Jones <ajones@riverbed.com>, Nick Andrew <nick@nick-andrew.net>

--Signature=_Mon__28_Jul_2008_13_37_07_+1000_QBWutGEf774XlkuP
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Jesper,

Today's linux-next merge of the trivial tree got a conflict in
Documentation/edac.txt between commit
327dafb1c61c9da7b95ac6cc7634a2340cc9509c ("edac: core fix redundant sysfs
controls to parameters") from Linus' tree and commit
0bb08241ce68aaa70b7b804b4d6319d8bad3ae24 ("Tighten up the use of loose")
from the trivial tree.

The former removed the whole section of the file in which the latter had
fixed a spelling mistake.

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Mon__28_Jul_2008_13_37_07_+1000_QBWutGEf774XlkuP
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAkiNPuMACgkQjjKRsyhoI8yHXwCgg6TTe/YIv+SSmvB8mZngmFPm
PJgAoIDI8/p03TnA53auifgoD01xSLUl
=m14o
-----END PGP SIGNATURE-----

--Signature=_Mon__28_Jul_2008_13_37_07_+1000_QBWutGEf774XlkuP--
