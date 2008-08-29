From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: rcu build warnings
Date: Fri, 29 Aug 2008 19:19:48 +1000
Message-ID: <20080829191948.95cde73f.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Fri__29_Aug_2008_19_19_48_+1000_MAA4Vj/q7/8Pn=/f"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:59529 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1753220AbYH2JT4 (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Fri, 29 Aug 2008 05:19:56 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Cc: linux-next@vger.kernel.org, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>, "H. Peter Anvin" <hpa@zytor.com>

--Signature=_Fri__29_Aug_2008_19_19_48_+1000_MAA4Vj/q7/8Pn=/f
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Paul,

Commit cd95851785bcfe95fdf73689e8ecb5a1c5959231 ("rcu: fix classic RCU
locking cleanup lockdep problem") from the sched tree used a long
(instead of unsigned long) for the flags argument to
spin_lock_irqsave/restore producing these warnings:

kernel/rcuclassic.c: In function 'rcu_init_percpu_data':
kernel/rcuclassic.c:719: warning: comparison of distinct pointer types lack=
s a cast
kernel/rcuclassic.c:727: warning: comparison of distinct pointer types lack=
s a cast

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Fri__29_Aug_2008_19_19_48_+1000_MAA4Vj/q7/8Pn=/f
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAki3vzQACgkQjjKRsyhoI8zvAgCeL3Dii4yHVe8DVLe+x5crkEIx
UZoAniRGlm0h5ig1p9TBqpDxp8OOjdB1
=B6EC
-----END PGP SIGNATURE-----

--Signature=_Fri__29_Aug_2008_19_19_48_+1000_MAA4Vj/q7/8Pn=/f--
