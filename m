From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the tip tree with the ttydev tree
Date: Fri, 26 Jun 2009 13:58:35 +1000
Message-ID: <20090626135835.f60b2968.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Fri__26_Jun_2009_13_58_35_+1000_lXJFZ/pRt9iqvNG8"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:48650 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751522AbZFZD6m (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Thu, 25 Jun 2009 23:58:42 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>, "H. Peter Anvin" <hpa@zytor.com>, Peter Zijlstra <peterz@infradead.org>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Jaswinder Singh Rajput <jaswinder@kernel.org>, Alan Cox <alan@lxorguk.ukuu.org.uk>, Arnd Bergmann <arnd@arndb.de>

--Signature=_Fri__26_Jun_2009_13_58_35_+1000_lXJFZ/pRt9iqvNG8
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the tip tree got a conflict in
arch/x86/include/asm/termios.h between commit
9d5eecbefea1142a640bb01426fa6e332a5a9e54 ("tty-x86-termios-clean") from
the ttydev tree and commits 69d5ffdaad7b77b97229b55c36afb20e5bebd29e
("x86: convert termios.h to the asm-generic version") and
73a2d096fdf23aa841f7595d114a11ec85a85e4d ("x86: remove all now-duplicate
header files") from the tip tree.

I just used the version from the tip tree as the ttydev changes are
trivial.  Alan, I think you might as well just drop that patch as the tip
tree is rewriting that file completely (converting it to use the
asm-generic version).

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Fri__26_Jun_2009_13_58_35_+1000_lXJFZ/pRt9iqvNG8
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAkpER2sACgkQjjKRsyhoI8zggQCgpIhDcHw5jxD4PN+9eq52dXhc
Rz8An20N6XfXywEVdF9GsXP8qokHDW1m
=hpg8
-----END PGP SIGNATURE-----

--Signature=_Fri__26_Jun_2009_13_58_35_+1000_lXJFZ/pRt9iqvNG8--
