From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the kmemcheck tree with the x86 tree
Date: Fri, 6 Mar 2009 17:19:01 +1100
Message-ID: <20090306171901.1abefadd.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Fri__6_Mar_2009_17_19_01_+1100_FR1uUUov1fbOO7BZ"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:52564 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1750797AbZCFGTK (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Fri, 6 Mar 2009 01:19:10 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Vegard Nossum <vegard.nossum@gmail.com>, Pekka Enberg <penberg@cs.helsinki.fi>, Ingo Molnar <mingo@elte.hu>
Cc: linux-next@vger.kernel.org

--Signature=_Fri__6_Mar_2009_17_19_01_+1100_FR1uUUov1fbOO7BZ
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the kmemcheck tree got a conflict in
arch/x86/mm/init_32.c between various commits from the x86 tree and
commits a7fff94fffaa0cecb923d6c1bb9b7691f608b49a ("Revert "kmemcheck: use
set_memory_4k() instead of disabling PSE"") and
760932c8607b736504a134ed6feec25e90e089ac ("kmemcheck: (finally) use 4k
pages for identity mapping") from the kmemcheck tree.

I fixed it up as in the tip/master branch (patching arch/x86/mm/init.c as
well).
--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Fri__6_Mar_2009_17_19_01_+1100_FR1uUUov1fbOO7BZ
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAkmwwFUACgkQjjKRsyhoI8yZEQCbBr825/DvD6Ec5nXYUA0eIT37
VeUAni8RUdHkwhJxB0eqoX7chGrjZUAH
=ZI3+
-----END PGP SIGNATURE-----

--Signature=_Fri__6_Mar_2009_17_19_01_+1100_FR1uUUov1fbOO7BZ--
