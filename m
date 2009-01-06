From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: rr tree build failure
Date: Tue, 6 Jan 2009 14:41:25 +1100
Message-ID: <20090106144125.69d084b7.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Tue__6_Jan_2009_14_41_25_+1100_cl8PPOVhy2NWYY+H"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:40118 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1750698AbZAFDlh (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Mon, 5 Jan 2009 22:41:37 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Rusty Russell <rusty@rustcorp.com.au>
Cc: linux-next@vger.kernel.org

--Signature=_Tue__6_Jan_2009_14_41_25_+1100_cl8PPOVhy2NWYY+H
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Rusty,

Today's linux-next build (x86_64 allmodconfig) failed like this:

kernel/sched.c:7206: error: 'sched_group_cpus' redeclared as different kind=
 of symbol
include/linux/sched.h:822: error: previous definition of 'sched_group_cpus'=
 was here

Caused by commit efec6469ba966f25081fdf85c3127a171c87435a
("cpualloc:remove-per_cpu__-prefix").

I have dropped the rr tree for today.

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Tue__6_Jan_2009_14_41_25_+1100_cl8PPOVhy2NWYY+H
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAkli0uUACgkQjjKRsyhoI8x6tQCeKzvvmovH9XfExF1Fdsm3xQth
ZQAAmwfnkrBbmlm820nPoSrsCpaLqUfZ
=jx9f
-----END PGP SIGNATURE-----

--Signature=_Tue__6_Jan_2009_14_41_25_+1100_cl8PPOVhy2NWYY+H--
