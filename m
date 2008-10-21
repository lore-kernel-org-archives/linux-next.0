From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: proc tree build failure
Date: Tue, 21 Oct 2008 18:21:43 +1100
Message-ID: <20081021182143.247d8d85.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Tue__21_Oct_2008_18_21_43_+1100_/oRwyyG4Q5crk4l_"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:36798 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751686AbYJUIjF (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Tue, 21 Oct 2008 04:39:05 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Alexey Dobriyan <adobriyan@gmail.com>
Cc: linux-next@vger.kernel.org, Rik van Riel <riel@redhat.com>

--Signature=_Tue__21_Oct_2008_18_21_43_+1100_/oRwyyG4Q5crk4l_
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Alexey,

Today's linux-next build (powerpc ppc64_defconfig) failed like this:

fs/proc/meminfo.c: In function 'meminfo_proc_show':
fs/proc/meminfo.c:90: error: 'NR_ACTIVE' undeclared (first use in this func=
tion)
fs/proc/meminfo.c:91: error: 'NR_INACTIVE' undeclared (first use in this fu=
nction)

Caused by commit d8ad172f12c10f974821247773a8b82ba7965ae4 ("proc:
switch /proc/meminfo to seq_file") from the proc tree interacting with
commit 4f98a2fee8acdb4ac84545df98cccecfd130f8db ("vmscan: split LRU lists
into anon & file sets") from  Linus' tree.

It was a bit hard to fix up this evening, so I have dropped the proc tree
for today.
--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Tue__21_Oct_2008_18_21_43_+1100_/oRwyyG4Q5crk4l_
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAkj9gwcACgkQjjKRsyhoI8w27wCfcHtQWKZzWNsvQ2Ktsfumqlwc
D4QAn0+48Rd3WPq8sG7vMhe7MaHKMrpF
=2t2Y
-----END PGP SIGNATURE-----

--Signature=_Tue__21_Oct_2008_18_21_43_+1100_/oRwyyG4Q5crk4l_--
