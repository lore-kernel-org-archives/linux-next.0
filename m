From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: m68k build failure
Date: Wed, 30 Jul 2008 17:52:33 +1000
Message-ID: <20080730175233.02dbf021.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Wed__30_Jul_2008_17_52_33_+1000_8OF1eZogOgpDeFji"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:34451 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1750969AbYG3Hwm (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Wed, 30 Jul 2008 03:52:42 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: "David S. Miller" <davem@davemloft.net>
Cc: linux-next@vger.kernel.org, Sam Ravnborg <sam@ravnborg.org>, Geert Uytterhoeven <geert@linux-m68k.org>, LKML <linux-kernel@vger.kernel.org>

--Signature=_Wed__30_Jul_2008_17_52_33_+1000_8OF1eZogOgpDeFji
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Dave,

linux-next (version next-20080729) build (m68k defconfig) failed like this;

In file included from arch/m68k/sun3/idprom.c:16:
include2/asm/idprom.h:3:30: error: asm-sparc/idprom.h: No such file or dire=
ctory

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Wed__30_Jul_2008_17_52_33_+1000_8OF1eZogOgpDeFji
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAkiQHcEACgkQjjKRsyhoI8wvZgCfTEXT+gNyG5mc1JBJ4sUcuIu5
QAkAnjon32xp/l7ZSQLWEMZSxxvuqkjZ
=LWc7
-----END PGP SIGNATURE-----

--Signature=_Wed__30_Jul_2008_17_52_33_+1000_8OF1eZogOgpDeFji--
