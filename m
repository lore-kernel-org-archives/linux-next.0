From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the kbuild tree
Date: Wed, 23 Jul 2008 13:52:05 +1000
Message-ID: <20080723135205.e7a4af7e.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Wed__23_Jul_2008_13_52_05_+1000_i2Pm/wVdCUDqwHNP"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:47403 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751169AbYGWDwQ (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Tue, 22 Jul 2008 23:52:16 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Sam Ravnborg <sam@ravnborg.org>
Cc: linux-next@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>, Mathieu Desnoyers <compudj@krystal.dyndns.org>, Alexey Dobriyan <adobriyan@gmail.com>

--Signature=_Wed__23_Jul_2008_13_52_05_+1000_i2Pm/wVdCUDqwHNP
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Sam,

Today's linux-next merge of the kbuild tree got a conflict in Makefile
between commit d35cb360c29956510b2fe1a953bd4968536f7216 ("markers: fix
duplicate modpost entry") from Linus' tree and commit
c24009d75ac9fb5cb4510fbfe2cf1aaa98b20801 ("kbuild: make clean removes
*.o.* as well") from the kbuild tree.

The clean target had overlapping additions.  I did the obvious fixup
(which was the same as Andrew did for -mm).

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Wed__23_Jul_2008_13_52_05_+1000_i2Pm/wVdCUDqwHNP
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAkiGquUACgkQjjKRsyhoI8wiIwCgstZ2WI97ipewFdoqYhokj/W9
FkgAoJ7rXfRBkKecyVv95njxfI8NFJzr
=l8Qj
-----END PGP SIGNATURE-----

--Signature=_Wed__23_Jul_2008_13_52_05_+1000_i2Pm/wVdCUDqwHNP--
