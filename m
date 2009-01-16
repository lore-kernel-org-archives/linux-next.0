From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: tree build failure
Date: Fri, 16 Jan 2009 16:37:45 +1100
Message-ID: <20090116163745.93f4e075.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Fri__16_Jan_2009_16_37_45_+1100_24.cQDyVkWFa4nnh"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:34224 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751399AbZAPFh7 (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Fri, 16 Jan 2009 00:37:59 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>, "H. Peter Anvin" <hpa@zytor.com>
Cc: linux-next@vger.kernel.org, Peter Zijlstra <a.p.zijlstra@chello.nl>

--Signature=_Fri__16_Jan_2009_16_37_45_+1100_24.cQDyVkWFa4nnh
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi ,

Today's linux-next build (powerpc allnoconfig) failed like this:

In file included from kernel/sched.c:1703:
kernel/sched_fair.c: In function 'adaptive_gran':
kernel/sched_fair.c:1324: error: 'struct sched_entity' has no member named =
'avg_wakeup'

Caused by commit e52fb7c097238d34f4d8e2a596f8a3f85b0c0565
("sched: prefer wakers") from the sched tree.

kernel/sched.c: In function 'enqueue_task':
kernel/sched.c:1752: error: 'struct sched_entity' has no member named 'star=
t_runtime'
kernel/sched.c: In function 'dequeue_task':
kernel/sched.c:1767: error: 'struct sched_entity' has no member named 'avg_=
wakeup'
kernel/sched.c: In function 'try_to_wake_up':
kernel/sched.c:2409: error: 'struct sched_entity' has no member named 'star=
t_runtime'
kernel/sched.c:2410: error: 'struct sched_entity' has no member named 'avg_=
wakeup'
kernel/sched.c: In function '__sched_fork':
kernel/sched.c:2454: error: 'struct sched_entity' has no member named 'star=
t_runtime'
kernel/sched.c:2455: error: 'struct sched_entity' has no member named 'avg_=
wakeup'

Caused by commit 831451ac4e44d3a20b581ce726ef1d1144373f7d ("sched:
introduce avg_wakeup") from the sched tree.

These members depend on CONFIG_SCHEDSTATS.

I have reverted the sched tree for today.
--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Fri__16_Jan_2009_16_37_45_+1100_24.cQDyVkWFa4nnh
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAklwHSkACgkQjjKRsyhoI8yTMwCghmd4w83cgUNic29aD5PBHGJF
uqEAmwditBCQK/704/oTvquvHtugjGXd
=2dvF
-----END PGP SIGNATURE-----

--Signature=_Fri__16_Jan_2009_16_37_45_+1100_24.cQDyVkWFa4nnh--
