From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the trivial tree
Date: Tue, 8 Jul 2008 01:39:37 +1000
Message-ID: <20080708013937.4533829b.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Tue__8_Jul_2008_01_39_37_+1000_G+agD/SO.gWcaygL"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:49398 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752184AbYGGPkB (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Mon, 7 Jul 2008 11:40:01 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Jesper Juhl <jesper.juhl@gmail.com>
Cc: linux-next@vger.kernel.org, "Andrew G. Morgan" <morgan@kernel.org>, Nick Andrew <nick@nick-andrew.net>

--Signature=_Tue__8_Jul_2008_01_39_37_+1000_G+agD/SO.gWcaygL
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Jesper,

Today's linux-next merge of the trivial tree got a tivial conflict in
include/linux/securebits.h between commit
086f7316f0d400806d76323beefae996bb3849b1 ("security: filesystem
capabilities: fix fragile setuid fixup code") from Linus' tree and commit
0bb08241ce68aaa70b7b804b4d6319d8bad3ae24 ("Tighten up the use of loose")
from the trivial tree.

This was a trivial conflict (by definition of the tree :-)) the former
commit changed a comment and fixed the instance of loose to lose, so I
used that version.

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Tue__8_Jul_2008_01_39_37_+1000_G+agD/SO.gWcaygL
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAkhyOLkACgkQjjKRsyhoI8zAnwCgwJcCv5H57yEj3nWJ2D1gHMqx
sQsAnjsyzLY30p6FfMPW3ZVU2DLOMMFA
=uBOw
-----END PGP SIGNATURE-----

--Signature=_Tue__8_Jul_2008_01_39_37_+1000_G+agD/SO.gWcaygL--
