From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the kmemcheck tree
Date: Wed, 13 Aug 2008 15:29:07 +1000
Message-ID: <20080813152907.b76a06e3.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Wed__13_Aug_2008_15_29_07_+1000_mqhOzfYpjrp63LHK"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:41152 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751517AbYHMF3Q (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Wed, 13 Aug 2008 01:29:16 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Vegard Nossum <vegard.nossum@gmail.com>, Pekka Enberg <penberg@cs.helsinki.fi>, Ingo Molnar <mingo@elte.hu>
Cc: linux-next@vger.kernel.org, Eduard - Gabriel Munteanu <eduard.munteanu@linux360.ro>, Christoph Lameter <cl@linux-foundation.org>

--Signature=_Wed__13_Aug_2008_15_29_07_+1000_mqhOzfYpjrp63LHK
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the kmemcheck tree got a conflict in
mm/slab.c between commit fccd5095804ffc190cb2371c319cb4f5b2c0ee14
("kmemtrace: SLAB hooks") from the slab tree and commit
30532cb3c49a2a9fed94127aab26003c52398a51 ("slab: add hooks for
kmemcheck") from the kmemcheck tree.

Simply overlapping additions of includes.
--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Wed__13_Aug_2008_15_29_07_+1000_mqhOzfYpjrp63LHK
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAkiicSMACgkQjjKRsyhoI8zxYACfY8t07H4ZaXDMGK4fWm4SiCbs
KecAnA0iJwkeVJYoAtCV9Vx7tLtwEd0Q
=Vcrk
-----END PGP SIGNATURE-----

--Signature=_Wed__13_Aug_2008_15_29_07_+1000_mqhOzfYpjrp63LHK--
