From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: ftrace tree build failure
Date: Wed, 7 Jan 2009 11:53:17 +1100
Message-ID: <20090107115317.77085a13.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Wed__7_Jan_2009_11_53_17_+1100_1k/7zZSz0TC9Byc7"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:44640 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1756022AbZAGAxa (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Tue, 6 Jan 2009 19:53:30 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>, "H. Peter Anvin" <hpa@zytor.com>
Cc: linux-next@vger.kernel.org

--Signature=_Wed__7_Jan_2009_11_53_17_+1100_1k/7zZSz0TC9Byc7
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next build (x86_64 allmodconfig) failed like this:

init/main.c:653: undefined reference to `kmemtrace_init'

I have cherry-picked the fix from the tip/master tree.
--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Wed__7_Jan_2009_11_53_17_+1100_1k/7zZSz0TC9Byc7
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEUEARECAAYFAklj/P0ACgkQjjKRsyhoI8yK0QCXUj3v/96ZGVQMrZsLozH5CDC3
CgCfTVbuMMAZD8f+ccyNHwXtMrZk6fo=
=xZs/
-----END PGP SIGNATURE-----

--Signature=_Wed__7_Jan_2009_11_53_17_+1100_1k/7zZSz0TC9Byc7--
