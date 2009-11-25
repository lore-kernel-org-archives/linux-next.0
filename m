From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: tip tree build warning
Date: Wed, 25 Nov 2009 21:53:38 +1100
Message-ID: <20091125215338.d07a95b9.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Wed__25_Nov_2009_21_53_38_+1100_YbXsy6+CWxd0pb1u"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:60225 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1750703AbZKYKxt (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Wed, 25 Nov 2009 05:53:49 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>, "H. Peter Anvin" <hpa@zytor.com>, Peter Zijlstra <peterz@infradead.org>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Frederic Weisbecker <fweisbec@gmail.com>

--Signature=_Wed__25_Nov_2009_21_53_38_+1100_YbXsy6+CWxd0pb1u
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next build (powerpc ppc64_defconfig) produced this warning:

kernel/perf_event.c:4306: warning: 'bp_perf_event_destroy' defined but not =
used

Introduced by commit 24f1e32c60c45c89a997c73395b69c8af6f0a84e
("hw-breakpoints: Rewrite the hw-breakpoints layer on top of perf
events").

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Wed__25_Nov_2009_21_53_38_+1100_YbXsy6+CWxd0pb1u
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)

iEYEARECAAYFAksNDLIACgkQjjKRsyhoI8xS1wCgtumM6LTUSfICs5BTNBCAHSlo
hIMAn3/Uom3IRlyjjnx816M63bm3/XA6
=+I5Y
-----END PGP SIGNATURE-----

--Signature=_Wed__25_Nov_2009_21_53_38_+1100_YbXsy6+CWxd0pb1u--
