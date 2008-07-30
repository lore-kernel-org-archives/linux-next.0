From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: linux-next: m68k build failure
Date: Wed, 30 Jul 2008 17:54:15 +1000
Message-ID: <20080730175415.6790f1be.sfr@canb.auug.org.au>
References: <20080730175233.02dbf021.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Wed__30_Jul_2008_17_54_15_+1000_5VUoJ4fUhgKkr11x"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:34492 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752484AbYG3HyW (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Wed, 30 Jul 2008 03:54:22 -0400
In-Reply-To: <20080730175233.02dbf021.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: "David S. Miller" <davem@davemloft.net>
Cc: linux-next@vger.kernel.org, Sam Ravnborg <sam@ravnborg.org>, Geert Uytterhoeven <geert@linux-m68k.org>, LKML <linux-kernel@vger.kernel.org>

--Signature=_Wed__30_Jul_2008_17_54_15_+1000_5VUoJ4fUhgKkr11x
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Dave,

Also, m68k sun3_defconfig failed like this:

In file included from arch/m68k/kernel/sun3-head.S:5:
include2/asm/contregs.h:3:32: error: asm-sparc/contregs.h: No such file or =
directory

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Wed__30_Jul_2008_17_54_15_+1000_5VUoJ4fUhgKkr11x
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAkiQHicACgkQjjKRsyhoI8wJOgCfWBolsVLIArf66q6tiMuwL8Mb
W5kAniBq3K6VlDont/r5YMpIKOY+tL29
=Yho3
-----END PGP SIGNATURE-----

--Signature=_Wed__30_Jul_2008_17_54_15_+1000_5VUoJ4fUhgKkr11x--
