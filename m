From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the kmemcheck tree
Date: Thu, 3 Jul 2008 16:12:36 +1000
Message-ID: <20080703161236.368d7926.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Thu__3_Jul_2008_16_12_36_+1000_DQTtED/TZYDD5XG9"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:51599 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1755175AbYGCGMo (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Thu, 3 Jul 2008 02:12:44 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Ingo Molnar <mingo@elte.hu>
Cc: linux-next@vger.kernel.org, Vegard Nossum <vegard.nossum@gmail.com>, Pekka Enberg <penberg@cs.helsinki.fi>, Pekka Paalanen <pq@iki.fi>, Thomas Gleixner <tglx@linutronix.de>

--Signature=_Thu__3_Jul_2008_16_12_36_+1000_DQTtED/TZYDD5XG9
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Ingo,

Today's linux-next merge of the kmemcheck tree got a conflict in
arch/x86/mm/Makefile between commit
ff3a3e9ba5e4273a8bc10570adab4a390fb90757 ("x86 mmiotrace: move files into
arch/x86/mm/") from the ftrace tree and commit
385e31b9eae0528bada07d16a189f3f40df23961 ("kmemcheck: add the kmemcheck
core") from the kmemcheck tree.

Just overlapping additions.

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Thu__3_Jul_2008_16_12_36_+1000_DQTtED/TZYDD5XG9
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAkhsbdQACgkQjjKRsyhoI8zMpgCeKsDAyugvyMXp0DOZJWrVVUEy
UKcAn1svzioEE182+jQim9kbtmPYQ7sM
=5SHh
-----END PGP SIGNATURE-----

--Signature=_Thu__3_Jul_2008_16_12_36_+1000_DQTtED/TZYDD5XG9--
