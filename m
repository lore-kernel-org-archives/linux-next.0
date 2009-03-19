From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the kmemcheck tree with the x86 tree
Date: Thu, 19 Mar 2009 18:49:46 +1100
Message-ID: <20090319184946.de4d75f5.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Thu__19_Mar_2009_18_49_46_+1100_hYgWCn9/Ej9kfuBa"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:38274 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752560AbZCSHtz (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Thu, 19 Mar 2009 03:49:55 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Vegard Nossum <vegard.nossum@gmail.com>, Pekka Enberg <penberg@cs.helsinki.fi>, Ingo Molnar <mingo@elte.hu>
Cc: linux-next@vger.kernel.org, Jeremy Fitzhardinge <jeremy.fitzhardinge@citrix.com>, Yinghai Lu <yinghai@kernel.org>

--Signature=_Thu__19_Mar_2009_18_49_46_+1100_hYgWCn9/Ej9kfuBa
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the kmemcheck tree got a conflict in
arch/x86/kernel/head_32.S between commits
2bd2753ff46346543ab92e80df9d96366e21baa5 ("x86: put initial_pg_tables
into .bss") and c090f532db3ab5b7be503f8ac84b0d33a18646c6 ("x86-32: make
sure we map enough to fit linear map pagetables") from the x86 tree and
commit a7fff94fffaa0cecb923d6c1bb9b7691f608b49a ("Revert "kmemcheck: use
set_memory_4k() instead of disabling PSE"") from the kmemcheck tree.

I fixed it up (by using the version from the x86 tree - which is also
what is done in tip/master) and can carry the fix as necessary.
--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Thu__19_Mar_2009_18_49_46_+1100_hYgWCn9/Ej9kfuBa
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAknB+RoACgkQjjKRsyhoI8yI9QCfbA0WucgFsq3QAfu1o2aLrgFe
6awAniNzXuh17RsFitC+XO2z/HLEH5Mi
=VTaD
-----END PGP SIGNATURE-----

--Signature=_Thu__19_Mar_2009_18_49_46_+1100_hYgWCn9/Ej9kfuBa--
