From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: sparseirq tree build warning
Date: Mon, 15 Dec 2008 17:29:12 +1100
Message-ID: <20081215172912.1801516f.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Mon__15_Dec_2008_17_29_12_+1100_F3wxsMaQbkeG1aOk"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:47663 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751171AbYLOG3X (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Mon, 15 Dec 2008 01:29:23 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Ingo Molnar <mingo@elte.hu>
Cc: linux-next@vger.kernel.org, Yinghai Lu <yinghai@kernel.org>

--Signature=_Mon__15_Dec_2008_17_29_12_+1100_F3wxsMaQbkeG1aOk
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Ingo,

Today's linux-next build (powerpc ppc64_defconfig) produced this warning:

fs/proc/stat.c: In function 'show_stat':
fs/proc/stat.c:30: warning: unused variable 'desc'

Introduced by commit 240d367b4e6c6e3c5075e034db14dba60a6f5fa7
("sparseirq: fix Alpha build failure").  desc is now only used when
CONFIG_SPARSE_IRQ is set.

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Mon__15_Dec_2008_17_29_12_+1100_F3wxsMaQbkeG1aOk
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAklF+TgACgkQjjKRsyhoI8xJ7wCfZCK6ajd0vG6Pyi939R5TOiM9
5uYAnR6VoxQnirtJJzmXrfdL6DRJJacz
=DbeB
-----END PGP SIGNATURE-----

--Signature=_Mon__15_Dec_2008_17_29_12_+1100_F3wxsMaQbkeG1aOk--
