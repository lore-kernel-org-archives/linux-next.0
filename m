From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: tip tree build warning
Date: Fri, 11 Sep 2009 18:56:00 +1000
Message-ID: <20090911185600.9641f38b.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Fri__11_Sep_2009_18_56_00_+1000_zx6ArzwLN9z2A6FI"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:41681 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1754159AbZIKI4F (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Fri, 11 Sep 2009 04:56:05 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>, "H. Peter Anvin" <hpa@zytor.com>, Peter Zijlstra <peterz@infradead.org>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org

--Signature=_Fri__11_Sep_2009_18_56_00_+1000_zx6ArzwLN9z2A6FI
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next build (powerpc allnoconfig) produced this warning:

kernel/sched.c:122: warning: 'double_rq_lock' declared 'static' but never d=
efined

Introduced by commit 18a3885fc1ffa92c2212ff0afdf033403d5b0fa0 ("sched:
Remove reciprocal for cpu_power").  This is a build with CONFIG_SMP
undefined.

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Fri__11_Sep_2009_18_56_00_+1000_zx6ArzwLN9z2A6FI
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)

iEYEARECAAYFAkqqEKAACgkQjjKRsyhoI8yJEQCeJmLpsdi8YGLKogMnMY8iWVyl
9/MAn19dC+oLDQsNG8hs5n3oehR+NHUW
=Ekxc
-----END PGP SIGNATURE-----

--Signature=_Fri__11_Sep_2009_18_56_00_+1000_zx6ArzwLN9z2A6FI--
