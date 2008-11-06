From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: new build warning
Date: Thu, 6 Nov 2008 15:28:04 +1100
Message-ID: <20081106152804.01c2b97c.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Thu__6_Nov_2008_15_28_04_+1100_YAcgtROcR+yPC+mK"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:56340 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751504AbYKFE2T (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Wed, 5 Nov 2008 23:28:19 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Martin Schwidefsky <schwidefsky@de.ibm.com>
Cc: linux-next@vger.kernel.org

--Signature=_Thu__6_Nov_2008_15_28_04_+1100_YAcgtROcR+yPC+mK
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Martin,

A powerpc ppc64_defconfig build of linux-next gives this new warning:

kernel/time/tick-sched.c: In function 'tick_nohz_restart_sched_tick':
kernel/time/tick-sched.c:415: warning: unused variable 'ticks'

Introduced by commit 04d675f6275c660ac6b435d5c6ae2c73be0e7060 ("[S390]
idle cputime accounting").

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Thu__6_Nov_2008_15_28_04_+1100_YAcgtROcR+yPC+mK
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAkkSclUACgkQjjKRsyhoI8xmBACfcebjjDwNMrnylf6St+zNte5h
a3gAniMajp4/uxHgXgEU6NhsMF5eY+5T
=OGqD
-----END PGP SIGNATURE-----

--Signature=_Thu__6_Nov_2008_15_28_04_+1100_YAcgtROcR+yPC+mK--
