From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: sched tree build warning
Date: Mon, 22 Dec 2008 15:22:47 +1100
Message-ID: <20081222152247.b934ed5b.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Mon__22_Dec_2008_15_22_47_+1100_A/9ix_6Py/LJ9++s"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:49112 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1753077AbYLVEW4 (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Sun, 21 Dec 2008 23:22:56 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>, "H. Peter Anvin" <hpa@zytor.com>
Cc: linux-next@vger.kernel.org, Ken Chen <kenchen@google.com>

--Signature=_Mon__22_Dec_2008_15_22_47_+1100_A/9ix_6Py/LJ9++s
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next build (powerpc ppc64_defconfig) produced this new
warning:

fs/proc/base.c: In function 'proc_pid_schedstat':
fs/proc/base.c:352: warning: format '%llu' expects type 'long long unsigned=
 int', but argument 3 has type 'u64'

Introduced by commit 9c2c48020ec0dd6ecd27e5a1298f73b40d85a595
("schedstat: consolidate per-task cpu runtime stats").

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Mon__22_Dec_2008_15_22_47_+1100_A/9ix_6Py/LJ9++s
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAklPFhcACgkQjjKRsyhoI8z4rQCfV0a+NhlXRCjIhl58+b4HZojp
Ys8AnjXqYz76mMD6Q7l81rrwh8XIpQo2
=QyXa
-----END PGP SIGNATURE-----

--Signature=_Mon__22_Dec_2008_15_22_47_+1100_A/9ix_6Py/LJ9++s--
