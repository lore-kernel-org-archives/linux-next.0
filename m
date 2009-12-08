From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: slab tree build failure
Date: Tue, 8 Dec 2009 14:44:11 +1100
Message-ID: <20091208144411.15a472d5.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Tue__8_Dec_2009_14_44_11_+1100_lAn_wZpsxlT4P2iK"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:48386 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S932282AbZLHDoL (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Mon, 7 Dec 2009 22:44:11 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Pekka Enberg <penberg@cs.helsinki.fi>, Christoph Lameter <cl@linux-foundation.org>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org

--Signature=_Tue__8_Dec_2009_14_44_11_+1100_lAn_wZpsxlT4P2iK
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next build (x86_64 allmodconfig) failed like this:

scripts/Makefile.headersinst:15: include/tests/Kbuild: No such file or dire=
ctory

Caused by commit 1c999557258d251e2e5790de4b723d5996c06d5d ("Add slab
performance tests").

I have used the slab tree from next-20091204 for today.
--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Tue__8_Dec_2009_14_44_11_+1100_lAn_wZpsxlT4P2iK
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)

iEYEARECAAYFAksdy4sACgkQjjKRsyhoI8ylOwCfX/y9jXoJ9dLx1fRfyCnwdkXg
wK8AoIxmI9+ta2PGVaXVNCOb0CXrRjHc
=CuF0
-----END PGP SIGNATURE-----

--Signature=_Tue__8_Dec_2009_14_44_11_+1100_lAn_wZpsxlT4P2iK--
