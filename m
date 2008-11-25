From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: ftrace tree build warnings
Date: Tue, 25 Nov 2008 13:38:28 +1100
Message-ID: <20081125133828.8f9b49df.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Tue__25_Nov_2008_13_38_28_+1100_8ngQjx3Z7Ij3mY6v"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:43523 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752821AbYKYCiu (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Mon, 24 Nov 2008 21:38:50 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>, "H. Peter Anvin" <hpa@zytor.com>
Cc: linux-next@vger.kernel.org, Steven Rostedt <srostedt@redhat.com>, Alan Cox <alan@redhat.com>

--Signature=_Tue__25_Nov_2008_13_38_28_+1100_8ngQjx3Z7Ij3mY6v
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next build (x86_64 allmodconfig) produced lots of these
warnings:

include/linux/tty.h:330: warning: '______f' is static but declared in inlin=
e function 'tty_kref_get' which is not static

Caused by commit 2bcd521a684cc94befbe2ce7d5b613c841b0d304 ("trace:
profile all if conditionals").  Something needs to be done about
this ...  maybe tty_kref_get needs to be "static inline" instead of
"extern inline"?

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Tue__25_Nov_2008_13_38_28_+1100_8ngQjx3Z7Ij3mY6v
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAkkrZSQACgkQjjKRsyhoI8xeKgCeKhOWRL4EwEhkjx5fXgxnajBf
qxoAnRSguBDSMmTbPW5RHF1mJ3UyOPcb
=jlhy
-----END PGP SIGNATURE-----

--Signature=_Tue__25_Nov_2008_13_38_28_+1100_8ngQjx3Z7Ij3mY6v--
