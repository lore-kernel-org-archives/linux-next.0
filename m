From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: sched tree build warning
Date: Tue, 21 Apr 2009 10:27:06 +1000
Message-ID: <20090421102706.e19240a0.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Tue__21_Apr_2009_10_27_06_+1000_ZNmn3WYjrZD4x0tZ"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:59035 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752211AbZDUA1P (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Mon, 20 Apr 2009 20:27:15 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>, "H. Peter Anvin" <hpa@zytor.com>
Cc: linux-next@vger.kernel.org, Gautham R Shenoy <ego@in.ibm.com>, Rusty Russell <rusty@rustcorp.com.au>

--Signature=_Tue__21_Apr_2009_10_27_06_+1000_ZNmn3WYjrZD4x0tZ
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next build (powerpc ppc64_defconfig) produced this new
warning:

kernel/sched.c: In function 'find_new_ilb':
kernel/sched.c:4355: warning: passing argument 1 of '__first_cpu' from inco=
mpatible pointer type

Possibly caused by commit f711f6090a81cbd396b63de90f415d33f563af9b
("sched: Nominate idle load balancer from a semi-idle package") from the
sched tree.  Should this call to first_cpu be cpumask_first?

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Tue__21_Apr_2009_10_27_06_+1000_ZNmn3WYjrZD4x0tZ
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAkntEtoACgkQjjKRsyhoI8wl8ACff1n8IOg/kPqc2CNVRbs2HweV
GAcAoJdBaxXACH8eYi9N4BaJYIjoJh3t
=AbXe
-----END PGP SIGNATURE-----

--Signature=_Tue__21_Apr_2009_10_27_06_+1000_ZNmn3WYjrZD4x0tZ--
