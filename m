From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: ttydev tree build failure
Date: Mon, 24 Nov 2008 16:13:14 +1100
Message-ID: <20081124161314.a61de8e9.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Mon__24_Nov_2008_16_13_14_+1100_zM.=fJYzVNZ0HayY"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:53097 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1750795AbYKXFN3 (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Mon, 24 Nov 2008 00:13:29 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Alan Cox <alan@lxorguk.ukuu.org.uk>
Cc: linux-next@vger.kernel.org

--Signature=_Mon__24_Nov_2008_16_13_14_+1100_zM.=fJYzVNZ0HayY
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Alan,

I have dropped the ttydev tree for today due to unresolved build issues on
m68k caused by a bad conversion of drivers/char/vme_scc.c in
tty-port-extract-cd causing these errors:

drivers/char/vme_scc.c:634: error: syntax error before 'volatile'
drivers/char/vme_scc.c:634: error: '__mptr' undeclared (first use in this f=
unction)
drivers/char/vme_scc.c:634: error: (Each undeclared identifier is reported =
only once
drivers/char/vme_scc.c:634: error: for each function it appears in.)
drivers/char/vme_scc.c:634: error: syntax error before ')' token
drivers/char/vme_scc.c:635: error: 'port' undeclared here (not in a functio=
n)
drivers/char/vme_scc.c:637: error: syntax error before 'return'

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Mon__24_Nov_2008_16_13_14_+1100_zM.=fJYzVNZ0HayY
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAkkqN+oACgkQjjKRsyhoI8w5XwCgiDuhxSBJGROTdg+zNSBP4DWQ
4fcAnR4yfnGipNjP82HBvtt9iJbwOH/m
=jAfi
-----END PGP SIGNATURE-----

--Signature=_Mon__24_Nov_2008_16_13_14_+1100_zM.=fJYzVNZ0HayY--
