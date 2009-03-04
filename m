From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: slab tree build warning
Date: Wed, 4 Mar 2009 17:35:53 +1100
Message-ID: <20090304173553.c8fb12fb.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Wed__4_Mar_2009_17_35_53_+1100_+L23CM/EtQnqvogP"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:52707 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751703AbZCDGgE (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Wed, 4 Mar 2009 01:36:04 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Pekka Enberg <penberg@cs.helsinki.fi>, Christoph Lameter <cl@linux-foundation.org>
Cc: linux-next@vger.kernel.org, Nick Piggin <npiggin@suse.de>

--Signature=_Wed__4_Mar_2009_17_35_53_+1100_+L23CM/EtQnqvogP
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next build (powerpc allnoconfig) produced this warning:

mm/slqb.c:3122: warning: 'gather_stats' defined but not used

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Wed__4_Mar_2009_17_35_53_+1100_+L23CM/EtQnqvogP
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAkmuIUkACgkQjjKRsyhoI8x36QCgg7zIw2xe1GhKTCizxSU2OnxT
0KAAoJQWBeDsFK16nmow4kXaVKN9+SQc
=bMqi
-----END PGP SIGNATURE-----

--Signature=_Wed__4_Mar_2009_17_35_53_+1100_+L23CM/EtQnqvogP--
