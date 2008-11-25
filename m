From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: ftrace tree build failure
Date: Tue, 25 Nov 2008 14:21:05 +1100
Message-ID: <20081125142105.2b6d464a.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Tue__25_Nov_2008_14_21_05_+1100_j7m6l6G5G+My+LKy"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:56237 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1753063AbYKYDVY (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Mon, 24 Nov 2008 22:21:24 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>, "H. Peter Anvin" <hpa@zytor.com>
Cc: linux-next@vger.kernel.org, Steven Rostedt <srostedt@redhat.com>

--Signature=_Tue__25_Nov_2008_14_21_05_+1100_j7m6l6G5G+My+LKy
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next build (x86_64 allmodconfig) failed like this:

arch/x86/boot/tty.c: Assembler messages:
arch/x86/boot/tty.c:76: Error: bad register name `%dil'

I have no idea what caused this (maybe a compiler option?) so I have
dropped the ftrace tree for today.

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Tue__25_Nov_2008_14_21_05_+1100_j7m6l6G5G+My+LKy
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAkkrbyEACgkQjjKRsyhoI8w6BQCguEBOZJMFxuhA86YkTpYJ5pZt
62kAnjz0IhZiYLnoXQDRHYFsYnwDBLC/
=Xdvq
-----END PGP SIGNATURE-----

--Signature=_Tue__25_Nov_2008_14_21_05_+1100_j7m6l6G5G+My+LKy--
