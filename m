From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the kmemcheck tree with the x86 tree
Date: Fri, 6 Mar 2009 17:24:06 +1100
Message-ID: <20090306172406.0560bac3.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Fri__6_Mar_2009_17_24_06_+1100_KlvdVkGwpjQMLi+h"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:58914 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1750937AbZCFGYS (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Fri, 6 Mar 2009 01:24:18 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Vegard Nossum <vegard.nossum@gmail.com>, Pekka Enberg <penberg@cs.helsinki.fi>, Ingo Molnar <mingo@elte.hu>
Cc: linux-next@vger.kernel.org

--Signature=_Fri__6_Mar_2009_17_24_06_+1100_KlvdVkGwpjQMLi+h
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the kmemcheck tree got a conflict in
arch/x86/mm/init_64.c between commit
f765090a2617b8d9cb73b71e0aa850c29460d8be ("x86: move init_memory_mapping
() to common mm/init.c") from the x86 tree and
commit760932c8607b736504a134ed6feec25e90e089ac  ("kmemcheck: (finally)
use 4k pages for identity mapping") from the kmemcheck tree.

I fixed it up as in the tip/master branch.
--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Fri__6_Mar_2009_17_24_06_+1100_KlvdVkGwpjQMLi+h
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEUEARECAAYFAkmwwYYACgkQjjKRsyhoI8wALQCgm5Isec09j9fj4Vs7XHcT22qq
NYIAmKexdI6G6jWqYVeedjYNhOt99Jk=
=yxNa
-----END PGP SIGNATURE-----

--Signature=_Fri__6_Mar_2009_17_24_06_+1100_KlvdVkGwpjQMLi+h--
